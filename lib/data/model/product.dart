import 'package:flutter_template/util/timber.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

// flutter pub run build_runner build
// flutter pub run build_runner watch
@freezed
@JsonSerializable()
class Product with _$Product {
  factory Product({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'title') required String title,
    @JsonKey(name: 'description') required String desc,
    @JsonKey(name: 'price') required int price,
    @JsonKey(name: 'discountPercentage') required double discount,
    @JsonKey(name: 'rating') required double rating,
    @JsonKey(name: 'stock') required int stock,
    @JsonKey(name: 'brand') required String brand,
    @JsonKey(name: 'category') required String category,
    @JsonKey(name: 'thumbnail') required String thumbnail,
    @JsonKey(name: 'images') required List<String> images,
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