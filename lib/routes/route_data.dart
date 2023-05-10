import 'package:flutter/material.dart';
import 'router.dart';

abstract class RouteData {
  String get routeName;

  Widget build(BuildContext context);

  Future push() async {
    return NavigationHandler.navigationKey.currentState!
        .pushNamed(routeName, arguments: this);
  }

  Future pushReplacement() {
    return NavigationHandler.navigationKey.currentState!
        .pushReplacementNamed(routeName, arguments: this);
  }

  static void pop<T extends Object?>([T? result]) {
    NavigationHandler.navigationKey.currentState!.pop(result);
  }

  static void pushAndPop<T extends Object?>(RouteData routeData, [T? result]) {
    NavigationHandler.navigationKey.currentState!.pop(result);
    routeData.push();
  }

  static pushANdPopUntil(RouteData routeData) async {
    NavigationHandler.navigationKey.currentState!
        .popUntil((route) => route.settings.arguments == routeData);
    routeData.push();
  }

  Future pushNamedAndRemoveUntil() async {
    NavigationHandler.navigationKey.currentState!
        .pushNamedAndRemoveUntil(routeName, (route) => false, arguments: this);
  }

  @override
  String toString() {
    return 'RouteData { $routeName }';
  }
}
