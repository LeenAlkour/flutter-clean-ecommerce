import 'package:e_commerce/common/bloc/button/cubit/button_state_cubit.dart';
import 'package:e_commerce/core/configs/theme/app_colors.dart';
import 'package:e_commerce/core/configs/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomReactiveButton extends StatelessWidget {
  final String? title;
  final VoidCallback onPressed;
  final double? height;
  final double? radius;
  final Widget? content;
  final Color? color;

  const CustomReactiveButton({
    super.key,
    this.title,
    required this.onPressed,
    this.height,
    this.radius,
    this.content,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ButtonStateCubit, ButtonState>(
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => _loading(context),
          initial: () => _initial(context),
          success: () => _initial(context),
          orElse: () => _initial(context),
        );
      },
    );
  }

  Widget _loading(BuildContext context) {
    return ElevatedButton(
      onPressed: null,
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? Theme.of(context).colorScheme.primary,
        minimumSize: Size.fromHeight(height ?? 50.h),
      ),
      child: Container(
        alignment: Alignment.center,
        height: height ?? 50.h,
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _initial(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? Theme.of(context).colorScheme.primary,
        minimumSize: Size.fromHeight(height ?? 50.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 8.r),
        ),
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
