import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_template/main.dart';
import 'package:http/http.dart' as http;
import 'package:equatable/equatable.dart';
import 'package:flutter_template/data/model/photo.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:logger/logger.dart';

part 'photos_event.dart';
part 'photos_state.dart';

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
      final photos = await apiClient.getPhotos();
      return emit(state.copyWith(
        status: PhotosStatus.success,
        photos: photos,
        hasReachedMax: false
      ));
    } catch (e) {
      emit(state.copyWith(status: PhotosStatus.failure));
    }
  }
}