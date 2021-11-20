// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../app_module.dart' as _i11;
import '../../data/datasources/movie_remote_data.dart' as _i9;
import '../../data/repository/movie_repository.dart' as _i10;
import '../../pages/details/cubit/cast_cubit.dart' as _i5;
import '../../pages/details/cubit/details_cubit.dart' as _i6;
import '../../pages/details/details_module.dart' as _i12;
import '../../pages/home/cubit/home_cubit.dart' as _i8;
import '../network/api_client.dart' as _i3;
import '../network/api_service.dart'
    as _i4; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final appModule = _$AppModule();
  final detailsModule = _$DetailsModule();
  gh.lazySingleton<_i3.ApiClient>(() => appModule.apiClient);
  gh.lazySingleton<_i4.ApiService>(() => appModule.apiService);
  gh.factory<_i5.CastCubit>(() => detailsModule.castCubit);
  gh.factory<_i6.DetailsCubit>(() => detailsModule.detailsCubit);
  gh.lazySingleton<_i7.Dio>(() => appModule.dio);
  gh.factory<_i8.HomeCubit>(() => appModule.homeCubit);
  gh.lazySingleton<_i9.MovieRemoteDataSource>(() => appModule.remoteDataSource);
  gh.lazySingleton<_i10.MovieRepository>(() => appModule.repository);
  return get;
}

class _$AppModule extends _i11.AppModule {}

class _$DetailsModule extends _i12.DetailsModule {}
