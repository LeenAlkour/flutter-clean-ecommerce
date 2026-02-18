import 'package:e_commerce/common/widgets/button/custom_button.dart';
import 'package:e_commerce/common/widgets/app_bar/custom_app_bar.dart';
import 'package:e_commerce/core/configs/theme/styles.dart';
import 'package:e_commerce/core/extensions/localization_extension.dart';
import 'package:e_commerce/common/widgets/spacing/spacing.dart';
import 'package:e_commerce/common/helper/validators.dart';
import 'package:e_commerce/core/routing/routes.dart';
import 'package:e_commerce/data/auth/models/user_creation-req.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});
    final _formKey = GlobalKey<FormState>();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(hideBackButton: true),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 40.0.h),

        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(context.get('auth.create_account'), style: AppTextStyles.font32Bold()),
              verticalSpace(20),
              _emailField(context),
              verticalSpace(20),
              _firstNameField(context),
              verticalSpace(20),
              _lastNameField(context),
              verticalSpace(20),
              _passwordField(context),
              verticalSpace(20),
          
              _continueButton(context),
              verticalSpace(20),
              _createAccount(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _emailField(BuildContext context) {
    return TextFormField( 
      
      validator: (value) => Validators.validateEmail(value, context),
      decoration: InputDecoration(hintText: context.get('auth.enter_email')),
      controller: _emailController,
    );
  }

  Widget _firstNameField(BuildContext context) {
    return TextFormField(
      validator: (value) => Validators.validateName(value, context),
      decoration: InputDecoration(hintText: context.get('auth.enter_first_name')),
      controller: _firstNameController,
    );
  }

  Widget _lastNameField(BuildContext context) {
    return TextFormField(
      validator:  (value) => Validators.validateName(value, context),
      decoration: InputDecoration(hintText: context.get('auth.enter_last_name')),
      controller: _lastNameController,
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextFormField(
      validator:  (value) => Validators.validatePassword(value, context),
      decoration: InputDecoration(hintText: context.get('auth.enter_password')),
      controller: _passwordController,
    );
  }

  Widget _continueButton(BuildContext context) {
    return CustomButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
        context.pushNamed(
          Routes.genderAndAgeSelectionPage,
          extra: UserCreationReq(
            firstName: _firstNameController.text,
            lastName: _lastNameController.text,
            email: _emailController.text,
            password: _passwordController.text,
          ),
        );
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
            text: context.get('auth.already_have_account'),
            style: AppTextStyles.font16Regular(color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
          TextSpan(
            text: context.get('auth.sign_in'),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.pushReplacement(Routes.signInPage);
              },
            style: AppTextStyles.font16Bold(color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
