// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'products_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProductsData {
  List<Product> get products => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductsDataCopyWith<ProductsData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductsDataCopyWith<$Res> {
  factory $ProductsDataCopyWith(
          ProductsData value, $Res Function(ProductsData) then) =
      _$ProductsDataCopyWithImpl<$Res, ProductsData>;
  @useResult
  $Res call({List<Product> products});
}

/// @nodoc
class _$ProductsDataCopyWithImpl<$Res, $Val extends ProductsData>
    implements $ProductsDataCopyWith<$Res> {
  _$ProductsDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
  }) {
    return _then(_value.copyWith(
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProductsDataCopyWith<$Res>
    implements $ProductsDataCopyWith<$Res> {
  factory _$$_ProductsDataCopyWith(
          _$_ProductsData value, $Res Function(_$_ProductsData) then) =
      __$$_ProductsDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Product> products});
}

/// @nodoc
class __$$_ProductsDataCopyWithImpl<$Res>
    extends _$ProductsDataCopyWithImpl<$Res, _$_ProductsData>
    implements _$$_ProductsDataCopyWith<$Res> {
  __$$_ProductsDataCopyWithImpl(
      _$_ProductsData _value, $Res Function(_$_ProductsData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
  }) {
    return _then(_$_ProductsData(
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
    ));
  }
}

/// @nodoc

class _$_ProductsData implements _ProductsData {
  _$_ProductsData({required final List<Product> products})
      : _products = products;

  final List<Product> _products;
  @override
  List<Product> get products {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  String toString() {
    return 'ProductsData(products: $products)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductsData &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_products));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductsDataCopyWith<_$_ProductsData> get copyWith =>
      __$$_ProductsDataCopyWithImpl<_$_ProductsData>(this, _$identity);
}

abstract class _ProductsData implements ProductsData {
  factory _ProductsData({required final List<Product> products}) =
      _$_ProductsData;

  @override
  List<Product> get products;
  @override
  @JsonKey(ignore: true)
  _$$_ProductsDataCopyWith<_$_ProductsData> get copyWith =>
      throw _privateConstructorUsedError;
}
