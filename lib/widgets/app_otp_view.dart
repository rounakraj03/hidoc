import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class AppOtpView extends StatelessWidget {
  final int length;
  final String? title;
  final void Function(String value, bool isCompleted) onChanged;
  final ValueChanged<String>? onCompleted;
  final MainAxisAlignment textFieldAlignment;
  final TextEditingController? controller;

  const AppOtpView(
      {required this.length,
      required this.onChanged,
      this.onCompleted,
      this.controller,
      this.textFieldAlignment = MainAxisAlignment.start,
      this.title,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Text(
            title!,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        const SizedBox(
          height: 10,
        ),
        Pinput(
          controller: controller,
          length: length,
          androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsUserConsentApi,
          onCompleted: onCompleted,
          onChanged: (pin) {
            onChanged(pin, pin.length == length);
          },
        )
      ],
    );
  }
}
