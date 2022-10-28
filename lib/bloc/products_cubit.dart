import 'package:bloc/bloc.dart';
import 'package:flutter_template/bloc/result_status.dart';
import 'package:flutter_template/data/model/product.dart';
import 'package:flutter_template/data/repository.dart';
import 'package:flutter_template/util/timber.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'products_cubit.freezed.dart';

@freezed
class ProductsState with _$ProductsState {
  factory ProductsState({
    required ResultStatus status,
    required List<Product> products
  }) = _ProductsState;
}

@injectable
class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this._repository) : super(ProductsState(status: ResultStatus.initial, products: List.of([])));

  final Repository _repository;

  void init([int skip = 0, int limit = 30]) async {
    try {
      final products = await _repository.getProducts(skip, limit);
      return emit(state.copyWith(
          status: ResultStatus.success,
          products: products.products
      ));
    } catch (e) {
      Timber.e(e);
      emit(state.copyWith(status: ResultStatus.failure));
    }
  }
}