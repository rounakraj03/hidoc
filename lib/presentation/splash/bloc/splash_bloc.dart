import 'package:hidoc/data/repo/auth_repository.dart';
import 'package:hidoc/presentation/splash/state/splash_state.dart';
import 'package:hidoc/routes/route_data.dart';
import 'package:hidoc/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:hidoc/res/static_values.dart';

@singleton
class SplashBloc extends Cubit<SplashState> {
  AuthRepository authRepository;
  SplashBloc(this.authRepository) : super(const SplashState());

  void initialize() async {
    await fetchLogo();
    checkForRoute();
  }

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

  Future<void> fetchLogo() async {
    var carInfo = await authRepository.getCarLogo();
    carInfo.forEach((r) {
      emit(state.copyWith(logo: Image.network(r)));
    });
  }
}
