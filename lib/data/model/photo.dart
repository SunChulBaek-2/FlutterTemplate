import 'package:flutter_template/util/timber.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo.freezed.dart';
part 'photo.g.dart';

// flutter pub run build_runner build
// flutter pub run build_runner watch
@freezed
@JsonSerializable()
class Photo with _$Photo {
  factory Photo({
    @JsonKey(name: 'albumId') required int albumId,
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'title') required String title,
    @JsonKey(name: 'url') required String url,
    @JsonKey(name: 'thumbnailUrl') required String thumbnailUrl
  }) = _Photo;

  factory Photo.fromJson(Map<String, dynamic> json) {
    try {
      return _$PhotoFromJson(json);
    } catch (e) {
      Timber.e(e);
    }
    throw Exception('Photo.fromJson()');
  }
}