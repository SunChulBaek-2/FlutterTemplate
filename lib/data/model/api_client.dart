import 'dart:collection';

import 'package:flutter_template/data/model/photo.dart';
import 'package:flutter_template/util/timber.dart';
import 'package:http/http.dart' as http;

const baseUrl = 'jsonplaceholder.typicode.com';

class ApiClient {
  Future<List<Photo>> getPhotos(int limit) async {
    final uri = Uri.https(baseUrl, '/photos', {
      '_limit': limit.toString()
    });
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      Timber.d('GET ${uri.toString()}\n${response.body}');
      return PhotoParser(response.body).parseInBackground();
    }
    throw Exception('error fetching photos');
  }
}