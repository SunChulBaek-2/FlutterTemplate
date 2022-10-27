import 'package:flutter_template/data/model/product.dart';
import 'package:flutter_template/data/rest_client.dart';
import 'package:flutter_template/main.dart';

class Repository {
  final RestClient _restClient = getIt<RestClient>();

  Future<Products> getProducts(int skip, int limit) => _restClient.getProducts(skip, limit);
}