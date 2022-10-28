part of 'products_cubit.dart';

enum ProductsStatus { initial, success, failure }

@freezed
class ProductsState with _$ProductsState {
  factory ProductsState({
    required ProductsStatus status,
    required List<Product> products
  }) = _ProductsState;
}