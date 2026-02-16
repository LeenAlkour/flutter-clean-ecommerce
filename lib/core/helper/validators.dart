import 'package:e_commerce/core/extensions/localization_extension.dart';
import 'package:flutter/widgets.dart';

class Validators {
  // Email validation
  static String? validateEmail(String? email, BuildContext context) {
    if (email == null || email.isEmpty) {
      return context.get('validators.email_required');
    }

    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    if (!emailRegex.hasMatch(email)) {
      return context.get('validators.invalid_email');
    }

    return null; // No errors
  }

  // Password validation
  static String? validatePassword(String? password, BuildContext context) {
    if (password == null || password.isEmpty) {
      return context.get('validators.password_required');
      
    }

    if (password.length < 8) {
      return context.get('validators.password_too_short');
      
    }

    // final passwordRegex = RegExp(
    //   r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d@$!%*?&]{8,}$',
    // );

    // if (!passwordRegex.hasMatch(password)) {
    //   return context.get('validators.password_requirements');
    // }

    return null;
  }

 

  // Name validation
  static String? validateName(String? name, BuildContext context) {
    if (name == null || name.isEmpty) {
      return context.get('validators.name_required');
    }

    if (name.length < 3) {
      return context.get('validators.name_too_short');
    }

    final nameRegex = RegExp(r'^[a-zA-Z\u0600-\u06FF ]{3,}$');

    if (!nameRegex.hasMatch(name)) {
      return context.get('validators.invalid_name');
    }

    return null;
  }

}
