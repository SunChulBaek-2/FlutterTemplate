import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_template/data/model/product.dart';
import 'package:flutter_template/data/repository.dart';
import 'package:flutter_template/util/timber.dart';
import 'package:injectable/injectable.dart';

part 'products_state.dart';

@injectable
class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this._repository) : super(const ProductsState());

  final Repository _repository;

  void init([int skip = 0, int limit = 30]) async {
    try {
      final products = await _repository.getProducts(skip, limit);
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