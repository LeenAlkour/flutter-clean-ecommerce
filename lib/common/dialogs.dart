import 'package:e_commerce/core/configs/theme/app_colors.dart';
import 'package:e_commerce/core/configs/theme/styles.dart';
import 'package:flutter/material.dart';

class Dialogs {
  static void showSuccessSnackBar(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg,style: AppTextStyles.font16Regular(color:  AppColors.bgLightColor),),
        backgroundColor: AppColors.successColor,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
static void showErrorSnackBar(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
               content: Text(
          msg,
          style: AppTextStyles.font16Regular(color: AppColors.bgLightColor),
        ),

        backgroundColor: AppColors.errorColor,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
  static void showProgressBar(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => Center(child: CircularProgressIndicator()),
    );
  }
}
