import 'package:bloc/bloc.dart';
import 'package:flutter_template/main.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_template/data/model/product.dart';
import 'package:flutter_template/util/timber.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(const ProductsState());

  void init([int skip = 0, int limit = 30]) async {
    try {
      final products = await restClient.getProducts(skip, limit);
      return emit(state.copyWith(
          status: ProductsStatus.success,
          products: products.products
      ));
    } catch (e) {
      Timber.e(e);
      emit(state.copyWith(status: ProductsStatus.failure));
    }
  }
}