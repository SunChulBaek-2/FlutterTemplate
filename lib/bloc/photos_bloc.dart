import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:equatable/equatable.dart';
import 'package:flutter_template/model/photo.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:logger/logger.dart';

part 'photos_event.dart';
part 'photos_state.dart';

const _photosLimit = 20;
const throttleDuration = Duration(microseconds: 100);
var _logger = Logger();

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class PhotosBloc extends Bloc<PhotosEvent, PhotosState> {
  PhotosBloc({required this.httpClient}) : super(const PhotosState()) {
    on<PhotosFetched>(_onPhotosFetched, transformer: throttleDroppable(throttleDuration));
  }

  final http.Client httpClient;

  Future<void> _onPhotosFetched(PhotosFetched event, Emitter<PhotosState> emit) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == PhotosStatus.initial) {
        final photos = await _fetchPhotos();
        return emit(state.copyWith(
          status: PhotosStatus.success,
          photos: photos,
          hasReachedMax: false
        ));
      }
      final photos = await _fetchPhotos(state.photos.length);
      emit(photos.isEmpty
        ? state.copyWith(hasReachedMax: true)
        : state.copyWith(
          status: PhotosStatus.success,
          photos: List.of(state.photos)..addAll(photos),
          hasReachedMax: false
        ));
    } catch (e) {
      emit(state.copyWith(status: PhotosStatus.failure));
    }
  }

  Future<List<Photo>> _fetchPhotos([int startIndex = 0]) async {
    final response = await httpClient.get(
      Uri.https(
        'jsonplaceholder.typicode.com',
        '/photos',
        <String, String>{'_start':'$startIndex', '_limit':'$_photosLimit'},
      )
    );
    if (response.statusCode == 200) {
      final body = json.decode(response.body) as List;
      return body.map((dynamic json) {
        final map = json as Map<String, dynamic>;
        return Photo(
          albumId: map['albumId'] as int,
          id: map['id'] as int,
          title: map['title'] as String,
          url: map['url'] as String,
          thumbnailUrl: map['thumbnailUrl'] as String
        );
      }).toList();
    }
    throw Exception('error fetching photos');
  }
}