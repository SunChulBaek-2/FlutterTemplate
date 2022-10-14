part of 'photos_bloc.dart';

enum PhotosStatus { initial, success, failure }

class PhotosState extends Equatable {
  const PhotosState({
    this.status = PhotosStatus.initial,
    this.photos = const <Photo>[]
  });

  final PhotosStatus status;
  final List<Photo> photos;

  PhotosState copyWith({
    PhotosStatus? status,
    List<Photo>? photos
  }) {
    return PhotosState(
      status: status ?? this.status,
      photos: photos ?? this.photos
    );
  }

  @override
  String toString() {
    return '''PhotosState { status: $status, photos: ${photos.length}}''';
  }

  @override
  List<Object?> get props => [status, photos];
}