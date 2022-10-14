import 'dart:convert';

import 'package:flutter_template/data/model/photo.dart';
import 'package:http/http.dart' as http;

const baseUrl = 'jsonplaceholder.typicode.com';

class ApiClient {
  Future<List<Photo>> getPhotos() async {
    final response = await http.get(Uri.https(baseUrl, '/photos'));
    if (response.statusCode == 200) {
      final body = json.decode(response.body) as List;
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
    throw Exception('error fetching photos');
  }
}