import 'dart:developer';

import 'package:hidoc/data/network/models/common/base_response.dart';
import 'package:hidoc/data/network/models/common/car_logo.dart';
import 'package:hidoc/data/network/models/common/dashboard_data.dart';
import 'package:hidoc/data/network/models/common/favourite_data.dart';
import 'package:hidoc/data/network/models/common/get_userdata_from_userinfo_table_data.dart';
import 'package:hidoc/data/network/models/common/product_description_data.dart';
import 'package:hidoc/data/network/models/request/add_favourite_tasks.dart';
import 'package:hidoc/data/network/models/request/add_user_data_to_user_info_table_tasks.dart';
import 'package:hidoc/data/network/models/request/dashboardDataTask/dashboard_data_tasks.dart';
import 'package:hidoc/data/network/models/request/delete_car_task.dart';
import 'package:hidoc/data/network/models/request/delete_favourite_tasks.dart';
import 'package:hidoc/data/network/models/request/favouriteDataTask/favourite_data_tasks.dart';
import 'package:hidoc/data/network/models/request/getHintDataTask/get_hint_data_tasks.dart';
import 'package:hidoc/data/network/models/request/getHintDataTask/hint_data.dart';
import 'package:hidoc/data/network/models/request/getMyCommentTask/get_my_comments_tasks.dart';
import 'package:hidoc/data/network/models/request/get_dashboarddata_by_search_tasks.dart';
import 'package:hidoc/data/network/models/request/get_user_data_from_user_info_table_tasks.dart';
import 'package:hidoc/data/network/models/request/product_description_tasks.dart';
import 'package:hidoc/data/network/models/request/updateMyProfileTask/update_my_profile_tasks.dart';
import 'package:hidoc/data/network/models/request/update_car_task.dart';
import 'package:hidoc/data/network/models/request/upload_dashboard_data_task.dart';
import 'package:hidoc/data/network/models/request/writeMyCommentTask/write_my_comment_tasks.dart';
import 'package:hidoc/di/register_module.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi()
@injectable
abstract class ApiService {
  @factoryMethod
  factory ApiService(Dio dio, @Named(DIConstants.baseUrl) String baseUrl) {
    if (kDebugMode) {
      dio.interceptors.add(LogInterceptor(
        logPrint: (object) {
          log(object.toString());
        },
        error: true,
        requestHeader: true,
        responseHeader: true,
        request: true,
        requestBody: true,
        // responseBody: true
      ));
    }
    return _ApiService(dio, baseUrl: baseUrl);
  }
  static const String CAR_LOGO = "app/carlogo";
  static const String DASHBOARD = "getArticlesByUid";
  static const String DASHBOARDDATA = "app/dashboardData";
  static const String GET_FAVOURITE = "app/getUsersFavourite";
  static const String ADD_FAVOURITE = "app/addUserFavourite";
  static const String DELETE_FAVOURITE = "app/deleteUserFavourite";
  static const String GETHINTS = "app/getHints";
  static const String GETMYPROFILE = "app/getMyProfile";
  static const String GET_MY_COMMENTS = "app/getMyComments";
  static const String WRITE_MY_COMMENTS = "app/writeMyComments";
  static const String UPDATE_MY_PROFILE = "app/updateMyProfile";
  static const String PRODUCT_DESCRIPTION = "app/product_description";
  static const String ADD_DASHBOARD_ITEM = "app/addDashboardItem";
  static const String DELETE_CAR = "app/deleteCar";
  static const String UPDATE_CAR = "app/updateCar";
  static const String GET_USER_DATA = "app/getDataToUserInfoTableDatabase";
  static const String ADD_USER_DATA = "app/addDataToUserInfoTableDatabase";

  @POST(DASHBOARD)
  Future<NetworkResponse<DashboardData>> getDashboard(@Body() DashboardDataTask task);

  @POST(DASHBOARDDATA)
  Future<NetworkResponse<DashboardData>> getDashBoardData(
      @Body() DashboardDataTask task);

  @POST(GETMYPROFILE)
  Future<NetworkResponse<ProductDescriptionData>> getMyProfile(
      @Body() GetUserDataFromUserInfoTableTask task);

  @POST(GET_MY_COMMENTS)
  Future<NetworkResponse<ProductDescriptionData>> getMyComments(
      @Body() GetMyCommentsTask task);

  @POST(WRITE_MY_COMMENTS)
  Future<EmptyNetworkResponse> writeMyComments(@Body() WriteMyCommentTask task);

  @POST(UPDATE_MY_PROFILE)
  Future<EmptyNetworkResponse> updateMyProfile(
      @Body() UpdateMyProfileTask task);

  @POST(DASHBOARD)
  Future<NetworkResponse<DashboardData>> getDashBoardDataBySearch(
      @Body() GetDashboardDataBySearchTask task);

  @POST(GETHINTS)
  Future<NetworkResponse<HintData>> getSearchHints(
      @Body() GetHintDataTask task);

  @POST(GET_USER_DATA)
  Future<NetworkResponse<GetUserdataFromUserinfoTableData>>
      getUserDataFromUserInfoTable(
          @Body() GetUserDataFromUserInfoTableTask task);

  @POST(GET_FAVOURITE)
  Future<NetworkResponse<FavouriteData>> getFavorite(
      @Body() FavouriteDataTask task);

  @POST(ADD_FAVOURITE)
  Future<EmptyNetworkResponse> addFavorite(@Body() AddFavouriteTask task);

  @POST(DELETE_FAVOURITE)
  Future<EmptyNetworkResponse> deleteFavorite(@Body() DeleteFavouriteTask task);

  @POST(ADD_USER_DATA)
  Future<EmptyNetworkResponse> addUserDataToUserInfoTable(
      @Body() AddUserDataToUserInfoTableTask task);

  @POST(PRODUCT_DESCRIPTION)
  Future<NetworkResponse<ProductDescriptionData>> getProductDescriptionData(
      @Body() ProductDescriptionTask task);

  @POST(ADD_DASHBOARD_ITEM)
  Future<EmptyNetworkResponse> addDashboardItem(
      @Body() UploadDashboardDataTask task);

  @POST(DELETE_CAR)
  Future<EmptyNetworkResponse> deleteCar(@Body() DeleteCarTask task);

  @POST(UPDATE_CAR)
  Future<EmptyNetworkResponse> updateCar(@Body() UpdateCarTask task);
}
