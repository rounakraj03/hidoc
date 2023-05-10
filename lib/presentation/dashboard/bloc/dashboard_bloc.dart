import 'package:hidoc/data/repo/auth_repository.dart';
import 'package:hidoc/presentation/dashboard/state/dashboard_state.dart';

import 'package:hidoc/routes/route_data.dart';
import 'package:hidoc/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:hidoc/res/static_values.dart';

@singleton
class DashboardBloc extends Cubit<DashboardState> {
  AuthRepository authRepository;
  DashboardBloc(this.authRepository) : super(const DashboardState());

  // void initialize() async {
  //   await fetchLogo();
  //   // checkForRoute();
  // }

  Future<void> checkForRoute() async {
    navigate();
  }

  navigate() {
    Future.delayed(const Duration(seconds: 3), () async {
      print("Changing page to Main Screen");
      if (StaticValues.showLoginScreen) {
        // LoginRoute().pushReplacement();
      } else {
        // RouteData.pushAndPop(DashboardRoute());
        // DashboardRoute().pushNamedAndRemoveUntil();
        // UploadScreenRoute().pushNamedAndRemoveUntil();
      }
    });
  }

  Future<void> initialize() async {
    var carInfo = await authRepository.getDashboard(500, 423914);
    carInfo.forEach((r) {
      print("result->? $r");
      // emit(state.copyWith(logo: Image.network(r)));
    });
  }
}
