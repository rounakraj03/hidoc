import 'package:hidoc/res/app_theme.dart';
import 'package:hidoc/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:hidoc/res/app_text_styles.dart';

class FTButton extends StatelessWidget {
  final String title;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onPressed;
  final bool inverseTheme;

  const FTButton({
    required this.title,
    this.onPressed,
    this.padding,
    this.inverseTheme = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      height: 50,
      child: Theme(
        data: Theme.of(context).copyWith(
            elevatedButtonTheme: !inverseTheme
                ? null
                : ElevatedButtonThemeData(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith((states) {
                          if (states.contains(MaterialState.disabled)) {
                            return AppColors.white.withOpacity(0.2);
                          } else {
                            return AppColors.white;
                          }
                        }),
                        textStyle: MaterialStateProperty.all(AppTextStyles.body2
                            .copyWith(color: AppColors.primary)),
                        elevation: MaterialStateProperty.all(1),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            side: BorderSide(color: AppColors.primary),
                            borderRadius: BorderRadius.all(Radius.circular(
                                Dimens.buttonBorderRadius))))))),
        child: ElevatedButton(
          onPressed: () {
            FocusScope.of(context).requestFocus(FocusNode());
            onPressed?.call();
          },
          child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                    child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      color:
                          inverseTheme ? AppColors.primary : AppColors.white),
                ))
              ]),
        ),
      ),
    );
  }
}
