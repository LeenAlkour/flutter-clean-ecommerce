import 'package:e_commerce/core/configs/theme/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyles {
  static TextStyle custom({
    required double fontSize,
    required FontWeight fontWeight,
    Color? color,
    FontStyle fontStyle = FontStyle.normal,
    double letterSpacing = 0,
  }) {
    return TextStyle(
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
      color: color,
      fontStyle: fontStyle,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle font24Bold({Color? color}) =>
      custom(fontSize: 24, fontWeight: FontWeightHelper.bold, color: color);

  static TextStyle font24SemiBold({Color? color}) =>
      custom(fontSize: 24, fontWeight: FontWeightHelper.semiBold, color: color);

  static TextStyle font18Bold({Color? color}) =>
      custom(fontSize: 18, fontWeight: FontWeightHelper.bold, color: color);
  static TextStyle font18Regular({Color? color}) =>
      custom(fontSize: 18, fontWeight: FontWeightHelper.regular, color: color);
  static TextStyle font32Bold({Color? color}) =>
      custom(fontSize: 32, fontWeight: FontWeightHelper.bold, color: color);

  static TextStyle font16SemiBold({Color? color}) =>
      custom(fontSize: 16, fontWeight: FontWeightHelper.semiBold, color: color);
  static TextStyle font16Regular({Color? color}) =>
      custom(fontSize: 16, fontWeight: FontWeightHelper.regular, color: color);
  static TextStyle font14Regular({Color? color}) =>
      custom(fontSize: 14, fontWeight: FontWeightHelper.regular, color: color);
  static TextStyle font16Bold({Color? color}) =>
      custom(fontSize: 16, fontWeight: FontWeightHelper.bold, color: color);
  static TextStyle font14Bold({Color? color}) =>
      custom(fontSize: 14, fontWeight: FontWeightHelper.bold, color: color);
  static TextStyle font13Light({Color? color}) =>
      custom(fontSize: 13, fontWeight: FontWeightHelper.light, color: color);
  static TextStyle font14Medium({Color? color}) =>
      custom(fontSize: 14, fontWeight: FontWeightHelper.medium, color: color);
  static TextStyle font10Medium({Color? color}) =>
      custom(fontSize: 10, fontWeight: FontWeightHelper.medium, color: color);
}
