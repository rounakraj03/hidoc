// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:hidoc/core/analytics/analytics.dart' as _i3;
import 'package:hidoc/core/analytics/firebase_analytics_impl.dart' as _i4;
import 'package:hidoc/core/services/device_service.dart' as _i6;
import 'package:hidoc/data/local/prefrences.dart' as _i8;
import 'package:hidoc/data/local/secure_storage.dart' as _i9;
import 'package:hidoc/data/local/storage_service.dart' as _i10;
import 'package:hidoc/data/network/error/app_error_model.dart' as _i5;
import 'package:hidoc/data/network/network_call.dart' as _i12;
import 'package:hidoc/data/network/service/api_service.dart' as _i11;
import 'package:hidoc/data/repo/auth_repository.dart' as _i13;
import 'package:hidoc/data/repo/impl/auth_repository_impl.dart' as _i14;
import 'package:hidoc/di/register_module.dart' as _i16;
import 'package:hidoc/presentation/splash/bloc/splash_bloc.dart' as _i15;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i3.Analytics>(() => _i4.FirebaseAnalyticsImpl());
    gh.factory<_i5.AppErrorModel>(() => _i5.AppErrorModel());
    gh.singleton<_i6.DeviceService>(_i6.DeviceService());
    gh.factory<_i7.Dio>(() => registerModule.dio);
    gh.singleton<_i8.Preferences>(_i8.Preferences());
    gh.singleton<_i9.SecureStorage>(_i9.SecureStorage(gh<_i8.Preferences>()));
    gh.singleton<_i10.StorageService>(_i10.StorageService(
      gh<_i8.Preferences>(),
      gh<_i9.SecureStorage>(),
      gh<_i6.DeviceService>(),
    ));
    gh.factory<String>(
      () => registerModule.baseUrl,
      instanceName: 'baseUrl',
    );
    gh.factory<_i11.ApiService>(() => _i11.ApiService(
          gh<_i7.Dio>(),
          gh<String>(instanceName: 'baseUrl'),
        ));
    gh.singleton<_i12.NetworkCall>(_i12.NetworkCall(
      gh<_i7.Dio>(),
      gh<String>(instanceName: 'baseUrl'),
    ));
    gh.factory<_i13.AuthRepository>(() => _i14.AuthRepositoryImpl(
          gh<_i12.NetworkCall>(),
          gh<_i10.StorageService>(),
        ));
    gh.singleton<_i15.SplashBloc>(_i15.SplashBloc(gh<_i13.AuthRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i16.RegisterModule {}
