// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response2.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Response2<T> _$Response2FromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    Response2<T>(
      json['total'] as int,
      json['skip'] as int,
      json['limit'] as int,
      fromJsonT(json['products']),
    );

Map<String, dynamic> _$Response2ToJson<T>(
  Response2<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'total': instance.total,
      'skip': instance.skip,
      'limit': instance.limit,
      'products': toJsonT(instance.products),
    };
