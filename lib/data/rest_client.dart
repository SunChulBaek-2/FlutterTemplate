import 'package:dio/dio.dart';
import 'package:flutter_template/data/model/product.dart';
import 'package:flutter_template/data/model/response2.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:retrofit/http.dart';

part 'rest_client.g.dart';

@singleton
@RestApi(baseUrl: 'https://dummyjson.com/')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @factoryMethod
  factory RestClient.from(Dio dio) => RestClient(dio);

  @GET('products')
  Future<Response2<List<Product>>> getProducts(
    @Query('skip') int skip,
    @Query('limit') int limit
  );
}

DateTime? dateTimeFromString(String? text) {
  if (text != null) {
    return DateFormat('yyyy-MM-dd HH:mm:ss').parse(text);
  } else {
    return null;
  }
}