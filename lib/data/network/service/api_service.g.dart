// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _ApiService implements ApiService {
  _ApiService(
    this._dio, {
    this.baseUrl,
  });

  final Dio _dio;

  String? baseUrl;

  @override
  Future<NetworkResponse<CarLogo>> getCarLogo() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<NetworkResponse<CarLogo>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'app/carlogo',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = NetworkResponse<CarLogo>.fromJson(
      _result.data!,
      (json) => CarLogo.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<NetworkResponse<DashboardData>> getDashBoardData(task) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(task.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<NetworkResponse<DashboardData>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'app/dashboardData',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = NetworkResponse<DashboardData>.fromJson(
      _result.data!,
      (json) => DashboardData.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<NetworkResponse<ProductDescriptionData>> getMyProfile(task) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(task.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<NetworkResponse<ProductDescriptionData>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'app/getMyProfile',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = NetworkResponse<ProductDescriptionData>.fromJson(
      _result.data!,
      (json) => ProductDescriptionData.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<NetworkResponse<ProductDescriptionData>> getMyComments(task) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(task.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<NetworkResponse<ProductDescriptionData>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'app/getMyComments',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = NetworkResponse<ProductDescriptionData>.fromJson(
      _result.data!,
      (json) => ProductDescriptionData.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<EmptyNetworkResponse<dynamic>> writeMyComments(task) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(task.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<EmptyNetworkResponse<dynamic>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'app/writeMyComments',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = EmptyNetworkResponse<dynamic>.fromJson(_result.data!);
    return value;
  }

  @override
  Future<EmptyNetworkResponse<dynamic>> updateMyProfile(task) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(task.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<EmptyNetworkResponse<dynamic>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'app/updateMyProfile',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = EmptyNetworkResponse<dynamic>.fromJson(_result.data!);
    return value;
  }

  @override
  Future<NetworkResponse<DashboardData>> getDashBoardDataBySearch(task) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(task.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<NetworkResponse<DashboardData>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'app/dashboard',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = NetworkResponse<DashboardData>.fromJson(
      _result.data!,
      (json) => DashboardData.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<NetworkResponse<HintData>> getSearchHints(task) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(task.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<NetworkResponse<HintData>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'app/getHints',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = NetworkResponse<HintData>.fromJson(
      _result.data!,
      (json) => HintData.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<NetworkResponse<GetUserdataFromUserinfoTableData>>
      getUserDataFromUserInfoTable(task) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(task.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<NetworkResponse<GetUserdataFromUserinfoTableData>>(
            Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
                .compose(
                  _dio.options,
                  'app/getDataToUserInfoTableDatabase',
                  queryParameters: queryParameters,
                  data: _data,
                )
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = NetworkResponse<GetUserdataFromUserinfoTableData>.fromJson(
      _result.data!,
      (json) => GetUserdataFromUserinfoTableData.fromJson(
          json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<NetworkResponse<FavouriteData>> getFavorite(task) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(task.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<NetworkResponse<FavouriteData>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'app/getUsersFavourite',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = NetworkResponse<FavouriteData>.fromJson(
      _result.data!,
      (json) => FavouriteData.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<EmptyNetworkResponse<dynamic>> addFavorite(task) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(task.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<EmptyNetworkResponse<dynamic>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'app/addUserFavourite',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = EmptyNetworkResponse<dynamic>.fromJson(_result.data!);
    return value;
  }

  @override
  Future<EmptyNetworkResponse<dynamic>> deleteFavorite(task) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(task.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<EmptyNetworkResponse<dynamic>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'app/deleteUserFavourite',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = EmptyNetworkResponse<dynamic>.fromJson(_result.data!);
    return value;
  }

  @override
  Future<EmptyNetworkResponse<dynamic>> addUserDataToUserInfoTable(task) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(task.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<EmptyNetworkResponse<dynamic>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'app/addDataToUserInfoTableDatabase',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = EmptyNetworkResponse<dynamic>.fromJson(_result.data!);
    return value;
  }

  @override
  Future<NetworkResponse<ProductDescriptionData>> getProductDescriptionData(
      task) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(task.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<NetworkResponse<ProductDescriptionData>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'app/product_description',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = NetworkResponse<ProductDescriptionData>.fromJson(
      _result.data!,
      (json) => ProductDescriptionData.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<EmptyNetworkResponse<dynamic>> addDashboardItem(task) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(task.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<EmptyNetworkResponse<dynamic>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'app/addDashboardItem',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = EmptyNetworkResponse<dynamic>.fromJson(_result.data!);
    return value;
  }

  @override
  Future<EmptyNetworkResponse<dynamic>> deleteCar(task) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(task.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<EmptyNetworkResponse<dynamic>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'app/deleteCar',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = EmptyNetworkResponse<dynamic>.fromJson(_result.data!);
    return value;
  }

  @override
  Future<EmptyNetworkResponse<dynamic>> updateCar(task) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(task.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<EmptyNetworkResponse<dynamic>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'app/updateCar',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = EmptyNetworkResponse<dynamic>.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
