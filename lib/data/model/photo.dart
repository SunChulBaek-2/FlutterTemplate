import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_template/data/json_parser.dart';
import 'package:flutter_template/util/timber.dart';

class Photo extends Equatable {
  const Photo({required this.albumId, required this.id, required this.title, required this.url, required this.thumbnailUrl});

  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  @override
  List<Object> get props => [albumId, id, title, url, thumbnailUrl];

  factory Photo.fromJson(dynamic json) {
    try {
      return Photo(
          albumId: json['albumId'] as int,
          id: json['id'] as int,
          title: json['title'] as String,
          url: json['url'] as String,
          thumbnailUrl: json['thumbnailUrl'] as String
      );
    } catch (e) {
      Timber.e(e);
    }
    throw Exception('Photo.fromJson()');
  }
}

class PhotoParser extends JsonParser<List<Photo>> {
  PhotoParser(String encodedJson) : super(encodedJson);

  @override
  List<Photo> parse(String encodedJson) {
    try {
      final body = jsonDecode(encodedJson) as List;
      return body.map((dynamic json) {
        final map = json as Map<String, dynamic>;
        return Photo.fromJson(map);
      }).toList();
    } catch (e) {
      Timber.e(e);
    }
    throw Exception('PhotoParser.parse()');
  }
}