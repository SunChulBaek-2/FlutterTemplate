import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_template/main.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_template/data/model/photo.dart';
import 'package:stream_transform/stream_transform.dart';

part 'photos_event.dart';
part 'photos_state.dart';

const throttleDuration = Duration(microseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class PhotosBloc extends Bloc<PhotosEvent, PhotosState> {
  PhotosBloc() : super(const PhotosState()) {
    on<PhotosFetched>(_onPhotosFetched, transformer: throttleDroppable(throttleDuration));
  }

  Future<void> _onPhotosFetched(PhotosFetched event, Emitter<PhotosState> emit) async {
    try {
      final photos = await apiClient.getPhotos();
      return emit(state.copyWith(
        status: PhotosStatus.success,
        photos: photos
      ));
    } catch (e) {
      emit(state.copyWith(status: PhotosStatus.failure));
    }
  }
}