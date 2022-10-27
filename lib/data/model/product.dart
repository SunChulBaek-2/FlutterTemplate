import 'package:flutter_template/util/timber.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

// flutter pub run build_runner build
// flutter pub run build_runner watch
@freezed
@JsonSerializable()
class Products with _$Products {
  factory Products({
    @JsonKey(name: 'products') required List<Product> products,
    @JsonKey(name: 'total') required int total,
    @JsonKey(name: 'skip') required String skip,
    @JsonKey(name: 'limit') required int limit,
  }) = _Products;

  factory Products.fromJson(Map<String, dynamic> json) {
    try {
      return _$ProductsFromJson(json);
    } catch (e) {
      Timber.e(e);
    }
    throw Exception('Products.fromJson()');
  }
}

@freezed
@JsonSerializable()
class Product with _$Product {
  factory Product({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'title') required String title,
    @JsonKey(name: 'description') required String desc,
    @JsonKey(name: 'thumbnail') required String thumbnail,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) {
    try {
      return _$ProductFromJson(json);
    } catch (e) {
      Timber.e(e);
    }
    throw Exception('Product.fromJson()');
  }
}