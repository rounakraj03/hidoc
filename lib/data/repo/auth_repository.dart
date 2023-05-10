import 'package:hidoc/data/network/error/network_error.dart';
import 'package:hidoc/data/network/models/common/base_response.dart';
import 'package:hidoc/data/network/models/common/dashboard_data.dart';
import 'package:dartz/dartz.dart';
import 'package:hidoc/data/network/models/common/favourite_data.dart';
import 'package:hidoc/data/network/models/common/get_userdata_from_userinfo_table_data.dart';
import 'package:hidoc/data/network/models/request/getHintDataTask/hint_data.dart';

import '../network/models/common/product_description_data.dart';

abstract class AuthRepository {
  // Future<Either<NetworkError, String>> getCarLogo();


  Future<Either<NetworkError, DashboardData>> getDashboard(int sid, int userId);

  Future<Either<NetworkError, EmptyEntity>> addNewDashboardData(
      {required String name, required double rating, required List imageUrl});

  Future<Either<NetworkError, EmptyEntity>> addNewUserDataToUserTable(
      {required String username,
      required String? company,
      required String? description,
      required String email,
      required String name,
      required String phone,
      required String? profileUrl,
      required String type});

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
      required List reelPaths});

  Future<Either<NetworkError, EmptyEntity>> deleteCar({required int id});

  // Future<Either<NetworkError, DashboardData>> getDashboardData(
  //     String username, int page, Map lastEvaluatedKey);
  //
  // Future<Either<NetworkError, ProductDescriptionData>> getMyProfileData(
  //     String username);
  //
  // Future<Either<NetworkError, ProductDescriptionData>> getMyComments({required String designerUsername, required String customerUsername});

  Future<Either<NetworkError, EmptyEntity>> writeMyComments({
    required String designerUsername,
    required String customerUsername,
    required String customerReview,
    required String customerDate,
    required String customerName,
    required int customerStar,
  });

  Future<Either<NetworkError, EmptyEntity>> updateMyProfileData(
      {required String username,
      required double rating,
      required String name,
      required Map imageList,
      required String backgroundImage,
      required String bio,
      required List order,
      required String phone,
      required String profileImage});

  // Future<Either<NetworkError, DashboardData>> postDashboardData(
  //     String item, String username, int page, Map lastEvaluatedKey);

  // Future<Either<NetworkError, HintData>> getSearchHint(
  //     String item, String username);
  //
  // Future<Either<NetworkError, FavouriteData>> getFavourites(
  //     String username, int page, String lastEvaluatedKey);

  Future<Either<NetworkError, EmptyEntity>> addFavourites(
      {required String username,
      required String favouriteEmail,
      required String favouriteValue});

  Future<Either<NetworkError, EmptyEntity>> deleteFavourites(
      {required String username, required String favouriteEmail});

  // Future<Either<NetworkError, GetUserdataFromUserinfoTableData>>
  //     getUserDataFromUserTable(String username);

  // Future<Either<NetworkError, ProductDescriptionData>> getProductDescriptionData(String name);

  void savePhoneNumber(String phoneNumber);

  Future<void> saveUsername(String username);
  Future<void> saveName(String name);

  Future<String> fetchUsername();
  Future<String> fetchName();

  Future<String> fetchPhoneNumber();
}
