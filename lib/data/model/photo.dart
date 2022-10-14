import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_template/data/json_parser.dart';

class Photo extends Equatable {
  const Photo({required this.albumId, required this.id, required this.title, required this.url, required this.thumbnailUrl});

  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  @override
  List<Object> get props => [albumId, id, title, url, thumbnailUrl];
}

class PhotoParser extends JsonParser<List<Photo>> {
  PhotoParser(String encodedJson) : super(encodedJson);

  @override
  List<Photo> parse(String encodedJson) {
    final body = jsonDecode(encodedJson) as List;
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
}