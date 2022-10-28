import 'package:flutter_template/data/model/product.dart';
import 'package:flutter_template/data/rest_client.dart';
import 'package:injectable/injectable.dart';

@injectable
class Repository {
  Repository(this._restClient);

  final RestClient _restClient;

  Future<Products> getProducts(int skip, int limit) => _restClient.getProducts(skip, limit);
}