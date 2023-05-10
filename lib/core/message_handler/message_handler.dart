import 'dart:io';

import 'package:hidoc/res/app_text_styles.dart';
import 'package:hidoc/res/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageHandler {
  MessageHandler._();

  static var scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
}

void showSnackBar({required String title}) {
  MessageHandler.scaffoldMessengerKey.currentState!.hideCurrentSnackBar();
  MessageHandler.scaffoldMessengerKey.currentState!.showSnackBar(SnackBar(
    // margin: const EdgeInsets.symmetric(horizontal: 100, vertical: 150),
    // behavior: SnackBarBehavior.floating,
    behavior: SnackBarBehavior.fixed,
      backgroundColor: AppColors.lightRed,
    content:
    // SizedBox(
    //   // height: 25,
    //   child: Text(
    //     title!,
    //     style: AppTextStyles.subtitle1.copyWith(color: AppColors.white),
    //     textAlign: TextAlign.center,
    //   ),
    // ),

    SizedBox(
      height: 50,
      child: Row( crossAxisAlignment: CrossAxisAlignment.end, children: [Icon(Icons.error, size: 30, color: Colors.white,),
      SizedBox(width: 15,),
      Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Error", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
            SizedBox.square(dimension: 5),
            Text(title,maxLines: 1,
              overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 14),)

          ],
        ),
      )],),
    ),
    duration: const Duration(seconds: 3),
    elevation: 2,
    // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
  ));
}

Future<bool?> showNativeAlert({
  required BuildContext context,
  required String title,
  required String content,
  required String defaultActionText,
  String? cancelActionText,
}) {
  if (Platform.isAndroid) {
    return _showAndroidAlert(
      context: context,
      title: title,
      content: content,
      defaultActionText: defaultActionText,
      cancelActionText: cancelActionText,
    );
  } else if (Platform.isIOS) {
    return _showIosAlert(
      context: context,
      title: title,
      content: content,
      defaultActionText: defaultActionText,
      cancelActionText: cancelActionText,
    );
  } else {
    throw Exception(
        'Platform is not supported. Please only run on iOS or Android devices.');
  }
}

Future<bool?> _showAndroidAlert({
  required BuildContext context,
  required String title,
  required String content,
  required String defaultActionText,
  String? cancelActionText,
}) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        if (cancelActionText != null)
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(cancelActionText),
          ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: Text(defaultActionText),
        ),
      ],
    ),
  );
}

Future<bool?> _showIosAlert(
    {required BuildContext context,
    required String title,
    required String content,
    required String defaultActionText,
    String? cancelActionText}) {
  return showCupertinoDialog<bool>(
    context: context,
    builder: (context) => CupertinoAlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        if (cancelActionText != null)
          CupertinoDialogAction(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(cancelActionText),
          ),
        CupertinoDialogAction(
          onPressed: () => Navigator.of(context).pop(true),
          child: Text(defaultActionText),
        ),
      ],
    ),
  );
}
