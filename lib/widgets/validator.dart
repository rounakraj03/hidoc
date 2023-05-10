enum ValidatorType {
  brand,
  year,
  currentPrice,
  oldPrice,
  km,
  type,
  name,
  companyName,
  description,
  rating,
  validateMobile,
  validateUserName,
  validatePassword,
  validateCustomerId,
  validateConfirmPassword,
  customerId,
  accountNumber,
  favour,
  confAccountNumber,
  ifscCode,
  beneficiaryName,
  beneficiaryPhone,
  emailId,
  amountLimit,
  addressLine1,
  chequeNo,
  amount,
  maxLimit,
  nickname,
  beneficiaryAmountLimit,
}

class Validator {
  String? validateName(String? value) {
    const pattern = r'(^[a-zA-Z ]*$)';
    final regExp = RegExp(pattern);
    if (value == null) {
      return null;
    }
    if (value.isEmpty) {
      return "Name is Required";
    } else if (!regExp.hasMatch(value.trim())) {
      return "Name must be a-z and A-Z";
    }
    return null;
  }

  String? validateUserName(String? value) {
    if (value == null) {
      return null;
    }
    if (value.isEmpty) {
      return "Username is Required";
    }
    return null;
  }

  String? validateIsNotEmptyOrNull(String title, String? value) {
    if (value == null) {
      return null;
    }
    if (value.isEmpty) {
      return "$title is Required";
    }
    return null;
  }

  //todo made changes here
  String? validateIfscCode(String? value) {
    if (value == null) {
      return null;
    }
    const pattern = r'^[A-Z]+$';
    final regExp = RegExp(pattern);

    if (value.isNotEmpty) {
      if (value[4] != '0') {
        return 'Please fill valid IFSC';
        // return '5th digit should be zero';
      }
      if (!regExp.hasMatch(value.substring(0, 4))) {
        return 'Please fill valid IFSC';
        // return 'first 4 should be alphabet';
      }
      if (value.substring(5, 9) == "KCUB") {
        return 'Please fill valid IFSC';
        // return 'Please fill valid IFSC not this bank';
      }
      if (value.length < 11) {
        return 'Please fill valid IFSC';
      }
      return null;
    }
  }

  //todo made changes here
  String? validateCustomerId(String? value) {
    const pattern = r'(^[0-9]*$)';
    final regExp = RegExp(pattern);
    if (value == null) {
      return null;
    }
    if (value.isEmpty) {
      return "Customer Id is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Customer Id must be digits";
    }
    return null;
  }

  String? validateMobile(String? value) {
    const pattern = r'(^[0-9]*$)';
    final regExp = RegExp(pattern);
    if (value == null) {
      return null;
    }
    if (value.isEmpty) {
      return "Phone number is Required";
    } else if (value.length != 10) {
      return "Phone number must be 10 digits";
    } else if (!regExp.hasMatch(value)) {
      return "Phone number must be digits";
    }
    return null;
  }

  String? validate6DigitCode(String? value) {
    const pattern = r'(^[0-9]*$)';
    final regExp = RegExp(pattern);
    if (value == null) {
      return null;
    }
    if (value.isEmpty) {
      return "Passcode is Required";
    } else if (value.length != 6) {
      return "PassCode must be 6 digits";
    } else if (!regExp.hasMatch(value)) {
      return "PassCode must be digits";
    }
    return null;
  }

  String? validate6DigitToken(String? value) {
    const pattern = r'(^[0-9]*$)';
    final regExp = RegExp(pattern);
    if (value == null) {
      return null;
    }
    if (value.isEmpty) {
      return "Please enter a valid token";
    } else if (value.length != 6) {
      return "PassCode must be 6 digits";
    } else if (!regExp.hasMatch(value)) {
      return "PassCode must be digits";
    }
    return null;
  }

  String? validatePassCode(String? value) {
    const pattern = r'(^[0-9]*$)';
    final regExp = RegExp(pattern);
    if (value == null) {
      return null;
    }
    if (value.isEmpty) {
      return "Passcode is Required";
    } else if (value.length != 6) {
      return "PassCode must be 6 digits";
    } else if (!regExp.hasMatch(value)) {
      return "PassCode must be digits";
    }
    return null;
  }

  String? passwordDoNotMatch(String? value, String? confirmValue) {
    const pattern = r'(^[0-9]*$)';
    final regExp = RegExp(pattern);
    if (value == null) {
      return null;
    }
    if (value.isEmpty) {
      return "PassCode is Required";
    } else if (value.length != 6) {
      return "PassCode must be 6 digits";
    } else if (!regExp.hasMatch(value)) {
      return "PasscodeCode must be digits";
    } else if (value != confirmValue) {
      return "Password do not match!";
    }
    return null;
  }

  String? validateEmail(String? value) {
    const pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    final regExp = RegExp(pattern);
    if (value == null) {
      return null;
    }
    if (value.isEmpty) {
      return "Email is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Invalid Email";
    } else {
      return null;
    }
  }

  String? validatePinCode(String? value) {
    const pattern = r'(^[0-9]*$)';
    final regExp = RegExp(pattern);
    if (value == null) {
      return null;
    }
    if (value.isEmpty) {
      return "Pincode is Required";
    } else if (value.length != 6) {
      return "Pincode must be 6 digits";
    } else if (!regExp.hasMatch(value)) {
      return "Pincode must be digits";
    }
    return null;
  }

  String? validateText(String? value, String? text) {
    const pattern = r'(^[a-zA-Z ]*$)';
    final regExp = RegExp(pattern);
    if (value == null) {
      return null;
    }
    if (value.isEmpty) {
      return "$text is Required";
    } else if (!regExp.hasMatch(value.trim())) {
      return "$text must be a-z and A-Z";
    }
    return null;
  }

  String? validateNumber(String? value, String? desc) {
    if (value == null) {
      return null;
    }
    if (value.isEmpty) {
      return "$desc is Required";
    }
    return null;
  }

  String? validateBeneficiaryAmountLimit(String amount, String? value) {
    if (value == null) {
      return null;
    }
    if (value.isEmpty) {
      return "$amount is Required";
    }
    try {
      final parsedAmount = int.parse(value);
      if (parsedAmount > 200000) {
        return "Amount cannot exceeds Rs.2 Lacs.";
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
