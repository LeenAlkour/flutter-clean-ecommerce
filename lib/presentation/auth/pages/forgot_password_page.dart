import 'package:e_commerce/common/bloc/button/cubit/button_state_cubit.dart';
import 'package:e_commerce/common/dialogs.dart';
import 'package:e_commerce/common/widgets/button/custom_reactive_button.dart';
import 'package:e_commerce/common/widgets/app_bar/custom_app_bar.dart';
import 'package:e_commerce/core/configs/theme/styles.dart';
import 'package:e_commerce/core/extensions/localization_extension.dart';
import 'package:e_commerce/core/helper/spacing/spacing.dart';
import 'package:e_commerce/domain/auth/usecases/send_password_reset_email.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_commerce/core/routing/routes.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({super.key});
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ButtonStateCubit(),
      child: Scaffold(
        appBar: CustomAppBar(),
        body: BlocListener<ButtonStateCubit, ButtonState>(
          listener: (context, state) {
            state.whenOrNull(
              error: (errorMessage) {
                Dialogs.showErrorSnackBar(context, errorMessage);
              },
              success: () {
                context.go(Routes.resetPasswordPage);
              },
            );
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 40.0.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.get('auth.forgot_password'),
                  style: AppTextStyles.font32Bold(),
                ),
                verticalSpace(20),
                _emailField(context),
                verticalSpace(20),
                _continueButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _emailField(BuildContext context) {
    return TextField(
      controller: _emailController,
      decoration: InputDecoration(hintText: context.get('auth.enter_email')),
    );
  }

  Widget _continueButton() {
    return Builder(
      builder: (context) {
        return CustomReactiveButton(
          onPressed: () {
            context.read<ButtonStateCubit>().execute(
              usecase: SendPasswordResetEmailUseCase(),
              params: _emailController.text,
            );
          },
          title: context.get('common.continue'),
        );
      },
    );
  }
}
