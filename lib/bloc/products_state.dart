part of 'products_cubit.dart';

enum ProductsStatus { initial, success, failure }

class ProductsState extends Equatable {
  const ProductsState({
    this.status = ProductsStatus.initial,
    this.products = const <Product>[]
  });

  final ProductsStatus status;
  final List<Product> products;

  ProductsState copyWith({
    ProductsStatus? status,
    List<Product>? products
  }) {
    return ProductsState(
      status: status ?? this.status,
      products: products ?? this.products
    );
  }

  @override
  String toString() {
    return '''ProductsState { status: $status, products: ${products.length}}''';
  }

  @override
  List<Object?> get props => [status, products];
}