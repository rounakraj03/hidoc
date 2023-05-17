import 'package:hidoc/res/app_text_styles.dart';
import 'package:hidoc/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get theme {
    return ThemeData(
      fontFamily: 'Poppins',
        primaryColor: AppColors.primary,
        focusColor: AppColors.primary,
        // scaffoldBackgroundColor: AppColors.primary,
        scaffoldBackgroundColor: Colors.white,
        bottomSheetTheme:
            const BottomSheetThemeData(backgroundColor: AppColors.white),
        cardTheme: const CardTheme(
            elevation: 0,
            color: AppColors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            margin: EdgeInsets.only()),
        indicatorColor: AppColors.primary,
        buttonTheme: const ButtonThemeData(),
        tabBarTheme: const TabBarTheme(),
        appBarTheme: AppBarTheme(
            color: AppColors.primary,
            systemOverlayStyle: SystemUiOverlayStyle.light,
            elevation: 0,
            centerTitle: true,
            iconTheme: IconThemeData(color: AppColors.white, size: 20)),
        inputDecorationTheme: const InputDecorationTheme(),
        textTheme: TextTheme(
          headline1: AppTextStyles.headline1,
          headline2: AppTextStyles.headline2,
          subtitle1: AppTextStyles.subtitle1,
          bodyText1: AppTextStyles.body1,
          bodyText2: AppTextStyles.body2,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.disabled)) {
                    return AppColors.primary.withOpacity(0.2);
                  } else {
                    return AppColors.primary;
                  }
                }),
                elevation: MaterialStateProperty.all(1),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(Dimens.buttonBorderRadius)))),
                textStyle: MaterialStateProperty.all(
                    AppTextStyles.body2.copyWith(color: AppColors.white)))),
        disabledColor: AppColors.primary.withOpacity(0.1),
        colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: AppColors.primary,
            background: AppColors.primary.withOpacity(0.5)));
  }
}

class Dimens {
  static double buttonBorderRadius = 10;
}
