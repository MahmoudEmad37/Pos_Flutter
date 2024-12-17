

import 'package:pos_flutter/core/utils/strings/app_strings.dart';

class ValidationForm {
  static String? phoneValidator(value) {
    String pattern = r'^(\+201|01|00201)[0-2,5]{1}[0-9]{8}';
    RegExp regExp = RegExp(pattern);
    if (value.length == 0) {
      return AppStrings.pleaseEnterMobileNumber;
    } else if (!regExp.hasMatch(value) || value.length > 11) {
      return AppStrings.pleaseEnterValidMobileNumber;
    }
    return null;
  }

  static String? nameValidator(value) {
    if (value.isEmpty) {
      return AppStrings.pleaseEnterName;
    }
    return null;
  }

  static String? carNumberValidator(value) {
    if (value.isEmpty) {
      return AppStrings.pleaseEnterCarNumber;
    }
    return null;
  }

  static String? carModelValidator(value) {
    if (value.isEmpty) {
      return AppStrings.pleaseEnterCarModel;
    }
    return null;
  }

  // static String? addressValidator(value) {
  //   if (value.isEmpty) {
  //     return AppStrings.pleaseEnterAddress;
  //   }
  //   return null;
  // }

  // static String? titleValidator(value) {
  //   if (value.isEmpty) {
  //     return AppStrings.pleaseEnterTitle;
  //   }
  //   return null;
  // }

  // static String? messageValidator(value) {
  //   if (value.isEmpty) {
  //     return AppStrings.pleaseEnterMessage;
  //   }
  //   return null;
  // }

  // static String? postalCodeValidator(value) {
  //   if (value.isEmpty) {
  //     return AppStrings.pleaseEnterPostalCode;
  //   }
  //   return null;
  // }

  // static String? emailValidator(value) {
  //   bool emailValid = RegExp(
  //           r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
  //       .hasMatch(value!);
  //   if (value.isEmpty) {
  //     return AppStrings.pleaseEnterEmail;
  //   } else if (!emailValid) {
  //     return AppStrings.emailNotValid;
  //   }
  //   return null;
  // }

  // static String? passwordValidator(v) {
  //   if (v!.length == 0) {
  //     return AppStrings.pleaseEnterPassword;
  //   } else if (v!.length <= 5) {
  //     return AppStrings.weekPassword;
  //   } else {
  //     return null;
  //   }
  // }

  // static String? confirmPasswordValidator(text, v) {
  //   if (text != v) {
  //     return AppStrings.passwordNotMatch;
  //   } else {
  //     return null;
  //   }
  // }
}
