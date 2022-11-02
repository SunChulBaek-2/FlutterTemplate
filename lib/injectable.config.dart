// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:event_bus/event_bus.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i5;

import 'bloc/products_cubit.dart' as _i6;
import 'data/repository.dart' as _i8;
import 'data/rest_client.dart' as _i7;
import 'di/api_module.dart' as _i9;
import 'di/app_module.dart' as _i10; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final apiModule = _$ApiModule();
  final appModule = _$AppModule();
  gh.factory<_i3.BaseOptions>(() => apiModule.options);
  gh.factory<_i3.Dio>(() => apiModule.dio);
  gh.singleton<_i4.EventBus>(appModule.eventBus);
  gh.factory<Map<String, dynamic>>(() => apiModule.headers);
  gh.factory<_i5.PrettyDioLogger>(() => apiModule.logger);
  gh.factory<_i6.ProductsState>(() => _i6.ProductsState.from());
  gh.singleton<_i7.RestClient>(_i7.RestClient.from(get<_i3.Dio>()));
  gh.factory<_i8.Repository>(() => _i8.Repository(get<_i7.RestClient>()));
  gh.factory<_i6.ProductsCubit>(() => _i6.ProductsCubit(
        get<_i8.Repository>(),
        get<_i6.ProductsState>(),
      ));
  return get;
}

class _$ApiModule extends _i9.ApiModule {}

class _$AppModule extends _i10.AppModule {}
