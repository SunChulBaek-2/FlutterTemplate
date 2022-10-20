import 'package:flutter_template/data/model/photo.dart';
import 'package:flutter_template/util/timber.dart';
import 'package:http/http.dart' as http;

const baseUrl = 'jsonplaceholder.typicode.com';

class ApiClient {
  Future<List<Photo>> getPhotos() async {
    final response = await http.get(Uri.https(baseUrl, '/photos'));
    if (response.statusCode == 200) {
      Timber.d(response.body);
      return PhotoParser(response.body).parseInBackground();
    }
    throw Exception('error fetching photos');
  }
}