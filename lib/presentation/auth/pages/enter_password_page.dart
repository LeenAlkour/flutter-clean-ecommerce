import 'package:e_commerce/common/bloc/button/cubit/button_state_cubit.dart';
import 'package:e_commerce/common/dialogs.dart';
import 'package:e_commerce/common/widgets/button/custom_reactive_button.dart';
import 'package:e_commerce/common/widgets/app_bar/custom_app_bar.dart';
import 'package:e_commerce/core/configs/theme/styles.dart';
import 'package:e_commerce/core/extensions/localization_extension.dart';
import 'package:e_commerce/core/helper/spacing/spacing.dart';
import 'package:e_commerce/core/helper/validators.dart';
import 'package:e_commerce/core/routing/routes.dart';
import 'package:e_commerce/data/auth/models/user_signin_req.dart';
import 'package:e_commerce/domain/auth/usecases/signin.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class EnterPasswordPage extends StatelessWidget {
  final String email;
  EnterPasswordPage({super.key, required this.email});
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 40.0.h),
        child: BlocProvider(
          create: (context) => ButtonStateCubit(),
          child: BlocListener<ButtonStateCubit, ButtonState>(
            listener: (context, state) {
              state.whenOrNull(
                error: (errorMessage) {
                  print(errorMessage);
                  Dialogs.showErrorSnackBar(context, errorMessage);
                },
                success: () => context.go(Routes.homePage),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(context.get('auth.sign_in'), style: AppTextStyles.font32Bold()),
                verticalSpace(20),
                _passwordField(context),
                verticalSpace(20),
                _continueButton(context),
                verticalSpace(20),

                _forgotPassword(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _passwordField(BuildContext context) {
    return Form(
      key: _formKey,
      child: TextFormField(
        validator: (value) => Validators.validatePassword(value, context),
        decoration: InputDecoration(hintText: context.get('auth.enter_password')),
        controller: _passwordController,
      ),
    );
  }

  Widget _continueButton(BuildContext context) {
    return Builder(
      builder: (context) {
        return CustomReactiveButton(
          onPressed: () {
            if (!_formKey.currentState!.validate()) {
              return;
            }
            UserSigninReq signInReq = UserSigninReq(
              email: email,
              password: _passwordController.text,
            );
           
            context.read<ButtonStateCubit>().execute(
              usecase: SigninUseCase(),
              params: signInReq,
            );
          },
          title: context.get('common.continue'),
        );
      },
    );
  }

  Widget _forgotPassword(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: context.get('auth.forgot_password'),
            style: AppTextStyles.font16Regular(
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
          TextSpan(
            text: context.get('auth.reset'),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.push(Routes.forgotPasswordPage);
              },
            style: AppTextStyles.font16Bold(color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
