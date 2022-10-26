import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_template/main.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_template/data/model/photo.dart';

part 'photos_state.dart';

class PhotosCubit extends Cubit<PhotosState> {
  PhotosCubit() : super(const PhotosState());

  void init(int size) async {
    try {
      final photos = await restClient.getPhotos(size);
      return emit(state.copyWith(
          status: PhotosStatus.success,
          photos: photos
      ));
    } catch (e) {
      emit(state.copyWith(status: PhotosStatus.failure));
    }
  }
}