import 'package:hidoc/res/colors.dart';
import 'package:flutter/material.dart';

class CustomRadioButton<T> extends StatelessWidget {
  final T value;
  final T? groupValue;
  final ValueChanged<T?> onChanges;
  final String title;

  const CustomRadioButton(
      {required this.value,
      required this.groupValue,
      required this.onChanges,
      required this.title,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isSelected = value == groupValue;
    return GestureDetector(
      onTap: () {
        onChanges.call(value);
      },
      child: Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            border: Border.all(
                color: isSelected ? AppColors.primary : AppColors.white,
                width: 2)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Radio<T>(
              activeColor: AppColors.primary,
              focusColor: AppColors.primary,
              value: value,
              groupValue: groupValue,
              onChanged: onChanges,
            ),
            Expanded(
                child: Text(title,
                    style: TextStyle(
                        color: isSelected ? AppColors.primary : null,
                        fontSize: 18,
                        fontWeight: FontWeight.bold))),
            const SizedBox(
              width: 10,
            )
          ],
        ),
      ),
    );
  }
}
