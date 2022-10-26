import 'package:flutter_template/util/timber.dart';
import 'package:json_annotation/json_annotation.dart';

part 'photo.g.dart';

// flutter pub run build_runner build
// flutter pub run build_runner watch
@JsonSerializable()
class Photo {
  const Photo({required this.albumId, required this.id, required this.title, required this.url, required this.thumbnailUrl});

  @JsonKey(name: 'albumId')
  final int albumId;
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'url')
  final String url;
  @JsonKey(name: 'thumbnailUrl')
  final String thumbnailUrl;

  factory Photo.fromJson(Map<String, dynamic> json) {
    try {
      return _$PhotoFromJson(json);
    } catch (e) {
      Timber.e(e);
    }
    throw Exception('Photo.fromJson()');
  }
}