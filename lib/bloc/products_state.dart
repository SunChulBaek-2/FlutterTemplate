part of 'products_cubit.dart';

@freezed
class ProductsState with _$ProductsState {
  factory ProductsState({
    required ResultStatus status,
    required List<Product> products
  }) = _ProductsState;
}