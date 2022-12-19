import 'package:bloc/bloc.dart';
import 'package:flutter_template/bloc/model/state_base.dart';
import 'package:flutter_template/data/model/product.dart';
import 'package:flutter_template/data/repository.dart';
import 'package:flutter_template/util/timber.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'products_cubit.freezed.dart';

@freezed
@injectable
class ProductsData with _$ProductsData {
  factory ProductsData({
    required List<Product> products
  }) = _ProductsData;

  @factoryMethod
  factory ProductsData.from() => ProductsData(products: List.of([]));
}

@injectable
class ProductsCubit extends Cubit<StateXBase> {
  ProductsCubit(this._repository, StateXBase state) : super(state);

  final Repository _repository;

  void init([int skip = 0, int limit = 30]) async {
    try {
      final products = await _repository.getProducts(skip, limit);
      return emit(StateX(
        data: ProductsData(
          products: products.products
        )
      ));
    } catch (e) {
      Timber.e(e);
      emit(StateXError());
    }
  }
}