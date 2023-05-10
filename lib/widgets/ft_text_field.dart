import 'package:hidoc/res/colors.dart';
import 'package:hidoc/res/string_constants.dart';
import 'package:hidoc/widgets/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FtTextField extends StatefulWidget {
  final String? title;
  final String? hint;
  final TextEditingController? controller;
  final Widget? prefix;
  final Widget? suffix;
  final TextInputType? inputType;
  final ValidatorType? validatorType;
  final List<TextInputFormatter>? inputFormatters;
  final bool obscureText;
  final double? circularCurve;
  final bool isSizedBox;
  final int? maxLines;

  const FtTextField({
    this.title,
    this.hint,
    this.controller,
    this.inputType,
    this.obscureText = false,
    this.isSizedBox = false,
    this.prefix,
    this.suffix,
    this.circularCurve,
    this.validatorType,
    this.inputFormatters,
    this.maxLines,
    Key? key,
  }) : super(key: key);

  @override
  State<FtTextField> createState() => _FtTextFieldState();
}

class _FtTextFieldState extends State<FtTextField> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null)
          Text(
            widget.title!,
            style: textTheme.bodyMedium,
          ),
        Visibility(
          visible: !widget.isSizedBox,
          child: const SizedBox(
            height: 10,
          ),
        ),
        TextFormField(
          controller: widget.controller,
          style: textTheme.subtitle1,
          keyboardType: widget.inputType,
          obscureText: widget.obscureText,
          inputFormatters: widget.inputFormatters,
          maxLines: widget.maxLines ?? null,
          validator: (String? value) {
            var validateType = widget.validatorType;
            Validator validator = Validator();
            switch (validateType) {
              case ValidatorType.validateMobile:
                return validator.validateMobile(value);
              case ValidatorType.validateUserName:
                return validator.validateUserName(value);
              case ValidatorType.validatePassword:
                return validator.validateIsNotEmptyOrNull(
                    StringConstants.password, value);
              case ValidatorType.validateConfirmPassword:
                return validator.validateIsNotEmptyOrNull(
                    StringConstants.confirmPassword, value);
              case ValidatorType.customerId:
                return validator.validateIsNotEmptyOrNull(
                    StringConstants.customerID, value);
              case ValidatorType.accountNumber:
                return validator.validateIsNotEmptyOrNull(
                    StringConstants.accountNumber, value);
              case ValidatorType.confAccountNumber:
                return validator.validateIsNotEmptyOrNull(
                    StringConstants.confAccountNumber, value);
              //todo i have to make changes here
              //todo make change here
              case ValidatorType.ifscCode:
                // return validator.validateIsNotEmptyOrNull(
                //     StringConstants.ifscCode, value);
                return validator.validateIfscCode(value);
              case ValidatorType.validateCustomerId:
                return validator.validateCustomerId(value);
              case ValidatorType.beneficiaryName:
                return validator.validateIsNotEmptyOrNull(
                    StringConstants.beneficiaryName, value);
              case ValidatorType.beneficiaryPhone:
                return validator.validateIsNotEmptyOrNull(
                    StringConstants.beneficiaryPhoneNo, value);
              case ValidatorType.emailId:
                return validator.validateIsNotEmptyOrNull(
                    StringConstants.emailId, value);
              case ValidatorType.amountLimit:
                return validator.validateIsNotEmptyOrNull(
                    StringConstants.amountLimit, value);
              case ValidatorType.addressLine1:
                return validator.validateIsNotEmptyOrNull(
                    StringConstants.addressLine1, value);
              case ValidatorType.favour:
                return validator.validateIsNotEmptyOrNull(
                    StringConstants.favour, value);
              case ValidatorType.chequeNo:
                return validator.validateIsNotEmptyOrNull(
                    StringConstants.chequeNo, value);
              case ValidatorType.amount:
                return validator.validateIsNotEmptyOrNull(
                    StringConstants.amount, value);
              case ValidatorType.name:
                return validator.validateIsNotEmptyOrNull(
                    StringConstants.name, value);
              case ValidatorType.companyName:
                return validator.validateIsNotEmptyOrNull(
                    StringConstants.companyName, value);
              case ValidatorType.description:
                return validator.validateIsNotEmptyOrNull(
                    StringConstants.description, value);
              case ValidatorType.rating:
                return validator.validateIsNotEmptyOrNull(
                    StringConstants.rating, value);
              case ValidatorType.brand:
                return validator.validateIsNotEmptyOrNull(
                    StringConstants.brand, value);
              case ValidatorType.year:
                return validator.validateIsNotEmptyOrNull(
                    StringConstants.year, value);
              case ValidatorType.currentPrice:
                return validator.validateIsNotEmptyOrNull(
                    StringConstants.currentPrice, value);
              case ValidatorType.oldPrice:
                return validator.validateIsNotEmptyOrNull(
                    StringConstants.oldPrice, value);
              case ValidatorType.km:
                return validator.validateIsNotEmptyOrNull(
                    StringConstants.km, value);
              case ValidatorType.type:
                return validator.validateIsNotEmptyOrNull(
                    StringConstants.type, value);
              case ValidatorType.maxLimit:
                return validator.validateIsNotEmptyOrNull(
                    StringConstants.maximumLimit, value);
              case ValidatorType.nickname:
                return validator.validateIsNotEmptyOrNull(
                    StringConstants.nickName, value);
              case ValidatorType.beneficiaryAmountLimit:
                return validator.validateBeneficiaryAmountLimit(
                    StringConstants.amount, value);

              default:
                return null;
            }
          },
          decoration: InputDecoration(
              fillColor: AppColors.white,
              filled: true,
              prefixIcon: widget.prefix,
              suffixIcon: widget.suffix,
              hintStyle: textTheme.bodySmall!,
              hintText: widget.hint,
              border: _border(),
              enabledBorder: _border()),
        )
      ],
    );
  }

  InputBorder _border() {
    return OutlineInputBorder(
        // borderRadius: const BorderRadius.all(Radius.circular(5)),
        borderRadius: BorderRadius.all(Radius.circular(widget.circularCurve ?? 5)),
        borderSide: BorderSide(color: AppColors.black.withOpacity(0.1)));
  }
}
