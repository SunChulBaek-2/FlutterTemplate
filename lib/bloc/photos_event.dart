part of 'photos_bloc.dart';

class PhotosEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class PhotosFetched extends PhotosEvent {
  PhotosFetched(this.size);

  final int size;
}