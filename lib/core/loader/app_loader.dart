import 'package:hidoc/core/app_logger/app_logger.dart';
import 'package:hidoc/res/assets.dart';
import 'package:hidoc/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AppLoader {
  static TransitionBuilder initBuilder({
    TransitionBuilder? builder,
  }) {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorSize = 45.0
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.dark
      ..radius = 10.0
      ..maskColor = AppColors.primary
      ..indicatorColor = AppColors.primary
      ..userInteractions = true
      ..errorWidget = SizedBox(
        height: 100,
        width: 100,
        child: Image.asset(Assets.error),
      )
      ..dismissOnTap = false;
    return EasyLoading.init(builder: builder);
  }

  static Future<void> showLoader({String? status}) {
    AppLogger.log("Loading showing");
    return EasyLoading.show(
        status: status ?? "Loading...", maskType: EasyLoadingMaskType.clear);
  }

  static Widget loader() {
    return SpinKitCircle(
      color: AppColors.primary,
      size: EasyLoading.instance.indicatorSize, //changed here
    );
  }

  static Future<void> dismissLoader() {
    AppLogger.log("Loading Dismissed");
    return EasyLoading.dismiss(animation: true);
  }

  static void showToast(String? status,
      {EasyLoadingToastPosition? toastPosition}) async {
    AppLogger.log("showToast $status");
    if (status == null) {
      return;
    }
    await EasyLoading.showToast(status,
        toastPosition: toastPosition ?? EasyLoadingToastPosition.bottom);
  }

  static Future<void> showSuccess(String status) {
    return EasyLoading.showSuccess(
        status,
        duration: const Duration(seconds: 3)
    );
  }

  static Future<void> showError(String error) {
    return EasyLoading.showError(error, duration: const Duration(seconds: 3));
  }
}
