import 'package:hidoc/data/local/storage_service.dart';
import 'package:hidoc/data/network/error/network_error.dart';
import 'package:hidoc/data/network/models/common/base_response.dart';
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
import 'package:hidoc/data/network/models/request/updateMyProfileTask/update_my_profile_tasks.dart';
import 'package:hidoc/data/network/models/request/update_car_task.dart';
import 'package:hidoc/data/network/models/request/upload_dashboard_data_task.dart';
import 'package:hidoc/data/network/models/request/writeMyCommentTask/write_my_comment_tasks.dart';
import 'package:hidoc/data/network/network_call.dart';
import 'package:hidoc/data/repo/auth_repository.dart';
import 'package:hidoc/data/repo/repo_ext.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  NetworkCall networkCall;
  final StorageService _storageService;

  AuthRepositoryImpl(this.networkCall, this._storageService);

  @override
  Future<Either<NetworkError, String>> getCarLogo() async {
    var image = await _storageService.getCompanyLogo();
    if (image.isNotEmpty) {
      return Right(image);
    }

    final result = await networkCall.execute().getCarLogo().getResult();
    result.forEach((r) {
      _storageService.setCompanyName(r.result.companyName);
      _storageService.setCompanyLogo(r.result.logoData);
      print("Saved value is : ");
      print(
          "company logo is ${r.result.logoData} && company name is ${r.result.companyName} ");
    });
    return result.flatMap((a) => Right(a.result.logoData));
  }

  @override
  void savePhoneNumber(String phoneNumber) async {
    await _storageService.setPhoneNumber(phoneNumber);
  }

  @override
  Future<String> fetchPhoneNumber() {
    return _storageService.getPhoneNumber();
  }

  @override
  Future<Either<NetworkError, DashboardData>> getDashboardData(
      String username, int page, Map lastEvaluatedKey) async {
    final result = await networkCall
        .execute()
        .getDashBoardData(DashboardDataTask(
            username: username, page: page, lastEvaluatedKey: lastEvaluatedKey))
        .getResult();
    return result.flatMap((a) => Right(a.result));
  }

  // @override
  // Future<Either<NetworkError, ProductDescriptionData>> getProductDescriptionData(String name) async {
  //   final result = await networkCall.execute().getProductDescriptionData(ProductDescriptionTask(name)).getResult();
  //   return result.flatMap((a) => Right(a.result));
  // }

  @override
  Future<Either<NetworkError, EmptyEntity>> deleteCar({required int id}) async {
    return await networkCall
        .execute()
        .deleteCar(DeleteCarTask(id: id))
        .getResult();
  }

  @override
  Future<Either<NetworkError, EmptyEntity>> updateCar(
      {required String name,
      required String brand,
      required String type,
      required String currentPrice,
      required String oldPrice,
      required int km,
      required int year,
      required int cost,
      required int id,
      required bool sold,
      required List imagePaths,
      required List reelPaths}) async {
    return await networkCall
        .execute()
        .updateCar(UpdateCarTask(
            id: id,
            name: name,
            brand: brand,
            type: type,
            currentPrice: currentPrice,
            oldPrice: oldPrice,
            km: km,
            year: year,
            cost: cost,
            sold: sold,
            imagePaths: imagePaths,
            reelPaths: reelPaths))
        .getResult();
  }

  @override
  Future<Either<NetworkError, EmptyEntity>> addNewDashboardData(
      {required String name,
      required double rating,
      required List imageUrl}) async {
    return await networkCall
        .execute()
        .addDashboardItem(UploadDashboardDataTask(
          name: name,
          rating: rating,
          imageList: imageUrl,
        ))
        .getResult();
  }

  @override
  Future<void> saveUsername(String username) async {
    await _storageService.setUserName(username);
  }

  @override
  Future<String> fetchUsername() {
    return _storageService.getUserName();
  }

  @override
  Future<Either<NetworkError, EmptyEntity>> addNewUserDataToUserTable(
      {required String username,
      required String? company,
      required String? description,
      required String email,
      required String name,
      required String phone,
      required String? profileUrl,
      required String type}) async {
    return await networkCall
        .execute()
        .addUserDataToUserInfoTable(AddUserDataToUserInfoTableTask(
            username: username,
            email: email,
            name: name,
            phone: phone,
            type: type,
            company: company,
            description: description,
            profileUrl: profileUrl))
        .getResult();
  }

  @override
  Future<Either<NetworkError, GetUserdataFromUserinfoTableData>>
      getUserDataFromUserTable(String username) async {
    final result = await networkCall
        .execute()
        .getUserDataFromUserInfoTable(
            GetUserDataFromUserInfoTableTask(username))
        .getResult();
    return result.flatMap((a) => Right(a.result));
  }

  @override
  Future<Either<NetworkError, DashboardData>> postDashboardData(
      String item, String username, int page, Map lastEvaluatedKey) async {
    final result = await networkCall
        .execute()
        .getDashBoardDataBySearch(GetDashboardDataBySearchTask(
            item: item,
            username: username,
            page: page,
            lastEvaluatedKey: lastEvaluatedKey))
        .getResult();
    return result.flatMap((a) => Right(a.result));
  }

  @override
  Future<Either<NetworkError, HintData>> getSearchHint(
      String item, String username) async {
    final result = await networkCall
        .execute()
        .getSearchHints(GetHintDataTask(item: item, username: username))
        .getResult();
    return result.flatMap((a) => Right(a.result));
  }

  @override
  Future<Either<NetworkError, FavouriteData>> getFavourites(
      String username, int page, String lastEvaluatedKey) async {
    final result = await networkCall
        .execute()
        .getFavorite(FavouriteDataTask(
            username: username, page: page, lastEvaluatedKey: lastEvaluatedKey))
        .getResult();
    return result.flatMap((a) => Right(a.result));
  }

  @override
  Future<Either<NetworkError, EmptyEntity>> addFavourites(
      {required String username,
      required String favouriteEmail,
      required String favouriteValue}) async {
    return await networkCall
        .execute()
        .addFavorite(AddFavouriteTask(
            username: username,
            favouriteEmail: favouriteEmail,
            favouriteValue: favouriteValue))
        .getResult();
  }

  @override
  Future<Either<NetworkError, EmptyEntity>> deleteFavourites(
      {required String username, required String favouriteEmail}) async {
    return await networkCall
        .execute()
        .deleteFavorite(DeleteFavouriteTask(
            username: username, favouriteEmail: favouriteEmail))
        .getResult();
  }

  @override
  Future<Either<NetworkError, ProductDescriptionData>> getMyProfileData(
      String username) async {
    final result = await networkCall
        .execute()
        .getMyProfile(GetUserDataFromUserInfoTableTask(username))
        .getResult();
    return result.flatMap((a) => Right(a.result));
  }

  @override
  Future<Either<NetworkError, EmptyEntity>> updateMyProfileData(
      {required String username,
      required double rating,
      required String name,
      required Map imageList,
      required String backgroundImage,
      required String bio,
      required List order,
      required String phone,
      required String profileImage}) async {
    return await networkCall
        .execute()
        .updateMyProfile(UpdateMyProfileTask(
            username: username,
            imageList: imageList,
            rating: rating,
            name: name,
            profileImage: profileImage,
            backgroundImage: backgroundImage,
            phone: phone,
            bio: bio,
            order: order))
        .getResult();
  }

  @override
  Future<Either<NetworkError, ProductDescriptionData>> getMyComments({required String designerUsername, required String customerUsername}) async {
    final result = await networkCall
        .execute()
        .getMyComments(GetMyCommentsTask(designerUsername: designerUsername, customerUsername: customerUsername))
        .getResult();
    return result.flatMap((a) => Right(a.result));
  }

  @override
  Future<Either<NetworkError, EmptyEntity>> writeMyComments(
      {required String designerUsername,
      required String customerUsername,
      required String customerReview,
      required String customerDate,
      required String customerName,
      required int customerStar}) async {
    return await networkCall
        .execute()
        .writeMyComments(WriteMyCommentTask(
            designerUsername: designerUsername,
            customerUsername: customerUsername,
            customerReview: customerReview,
            customerDate: customerDate,
            customerName: customerName,
            customerStar: customerStar))
        .getResult();
  }

  @override
  Future<String> fetchName() {
    return _storageService.getName();
  }

  @override
  Future<void> saveName(String name) async {
    await _storageService.setName(name);
  }
}
