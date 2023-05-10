import 'package:hidoc/presentation/splash/view/splash_screen.dart';
import 'package:hidoc/routes/route_data.dart';
import 'package:flutter/material.dart';

class SplashRoute extends RouteData {
  @override
  Widget build(BuildContext context) {
    return const SplashScreen();
  }

  @override
  String get routeName => '/';
}

