import 'package:hidoc/core/loader/app_loader.dart';
import 'package:hidoc/core/message_handler/message_handler.dart';
import 'package:hidoc/presentation/splash/view/splash_screen.dart';
import 'package:hidoc/res/app_theme.dart';
import 'package:hidoc/routes/router.dart';
import 'package:flutter/material.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.theme,
      navigatorKey: NavigationHandler.navigationKey,
      initialRoute: NavigationHandler.initialRoute,
      onGenerateRoute: NavigationHandler.onGenerate,
      scaffoldMessengerKey: MessageHandler.scaffoldMessengerKey,
      home: SplashScreen(),
      builder: AppLoader.initBuilder(),
    );
  }
}
