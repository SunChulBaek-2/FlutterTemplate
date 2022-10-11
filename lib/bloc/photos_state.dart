part of 'photos_bloc.dart';

enum PhotosStatus { initial, success, failure }

class PhotosState extends Equatable {
  const PhotosState({
    this.status = PhotosStatus.initial,
    this.photos = const <Photo>[],
    this.hasReachedMax = false
  });

  final PhotosStatus status;
  final List<Photo> photos;
  final bool hasReachedMax;

  PhotosState copyWith({
    PhotosStatus? status,
    List<Photo>? photos,
    bool? hasReachedMax
  }) {
    return PhotosState(
      status: status ?? this.status,
      photos: photos ?? this.photos,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax
    );
  }

  @override
  String toString() {
    return '''PhotosState { status: $status, hasReachedMax: $hasReachedMax, photos: ${photos.length}}''';
  }

  @override
  List<Object?> get props => [status, photos, hasReachedMax];
}