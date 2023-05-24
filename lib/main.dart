import 'dart:async';
import 'package:hidoc/core/flavor_config.dart';
import 'package:hidoc/di/di.dart';
import 'package:hidoc/main_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:developer';

import 'package:hidoc/res/colors.dart';


// import 'package:flutter_windowmanager/flutter_windowmanager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  bootstrap();
}



Future<void> bootstrap() async {
  FlavorConfig.init(
      name: Name.hidoc,
      environment: Environment.prod,
      detail: Detail.dealer);

  // WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppColors.primary.withOpacity(0.4)
      // statusBarColor: Colors.transparent
  ));

  await registerDependencies();
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };
  // final crashlyticsService = inject<CrashlyticsService>();
  // crashlyticsService.initialize();

  // await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  await runZonedGuarded(() async {
    runApp(const MainApp());
  }, (error, stackTrace) {
    // crashlyticsService.recordError(error, stackTrace);
    log(error.toString(), stackTrace: stackTrace);
  });
}
