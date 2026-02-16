import 'package:e_commerce/common/bloc/button/cubit/button_state_cubit.dart'
    show ButtonStateCubit, ButtonState, ButtonStatePatterns;
import 'package:e_commerce/common/dialogs.dart';
import 'package:e_commerce/common/widgets/button/custom_button.dart';
import 'package:e_commerce/common/widgets/app_bar/custom_app_bar.dart';
import 'package:e_commerce/common/widgets/button/custom_reactive_button.dart';
import 'package:e_commerce/core/configs/theme/styles.dart';
import 'package:e_commerce/core/extensions/localization_extension.dart';
import 'package:e_commerce/core/helper/spacing/spacing.dart';
import 'package:e_commerce/core/helper/validators.dart';
import 'package:e_commerce/core/routing/routes.dart';
import 'package:e_commerce/domain/auth/usecases/signin_with_google.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SignInPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(hideBackButton: true),
      body: BlocProvider(
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
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 40.0.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.get('auth.sign_in'),
                  style: AppTextStyles.font32Bold(),
                ),
                verticalSpace(20),
                _emailField(context),
                verticalSpace(20),
                _continueButton(context),
                verticalSpace(20),

                _createAccount(context),
                verticalSpace(40),
                _signInWithGoogle(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _emailField(BuildContext context) {
    return Form(
      key: _formKey,
      child: TextFormField(
        validator: (value) => Validators.validateEmail(value, context),
        controller: _emailController,
        decoration: InputDecoration(hintText: context.get('auth.enter_email')),
      ),
    );
  }

  Widget _continueButton(BuildContext context) {
    return CustomButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          context.push(Routes.enterPasswordPage, extra: _emailController.text);
        }
      },
      title: context.get('common.continue'),
    );
  }

  Widget _createAccount(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: context.get('auth.dont_have_account'),
            style: AppTextStyles.font16Regular(
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
          TextSpan(
            text: context.get('auth.create_account'),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.pushReplacement(Routes.signUpPage);
              },
            style: AppTextStyles.font16Bold(
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
        ],
      ),
    );
  }

  _signInWithGoogle(BuildContext context) {
    return CustomReactiveButton(
      color: Theme.of(context).colorScheme.secondary,
      radius: 4,
      onPressed: () {
        context.read<ButtonStateCubit>().execute(
          usecase: SigninWithGoogleUseCase(),
        );
      },
      content: Row(
        children: [
          Image.asset('assets/icons/google.png', width: 25.w, height: 25.h),
          Text(context.get('auth.sign_in_with_google')),
        ],
      ),
    );
  }
}
