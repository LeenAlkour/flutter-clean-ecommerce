import 'package:e_commerce/core/configs/theme/app_colors.dart';
import 'package:e_commerce/core/configs/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String? title;
  final VoidCallback onPressed;
  final double? height;
  final Widget? content;
  const CustomButton({
    super.key,
    this.title,
    required this.onPressed,
    this.height,
    this.content,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(height ?? 50.h),
      ),
      child:
          content ??
          Text(
            title!,
            style: AppTextStyles.font16SemiBold(
              color: AppColors.secondaryLight,
            ),
          ),
    );
  }
}
