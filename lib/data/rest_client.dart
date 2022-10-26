import 'package:dio/dio.dart';
import 'package:flutter_template/data/model/photo.dart';
import 'package:retrofit/http.dart';

part 'rest_client.g.dart';

Map<String, String> headers = { };

@RestApi(baseUrl: 'https://jsonplaceholder.typicode.com/')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('photos')
  Future<List<Photo>> getPhotos(@Query('_limit') int limit);
}