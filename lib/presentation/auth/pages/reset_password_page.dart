import 'package:e_commerce/common/widgets/button/custom_button.dart';
import 'package:e_commerce/core/extensions/localization_extension.dart';
import 'package:e_commerce/core/helper/spacing/spacing.dart';
import 'package:e_commerce/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/reset_password_success.png',
            ),
          verticalSpace(20),
          Text("We Sent you an email  to reset your password."),
          verticalSpace(20),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: CustomButton(
              title: context.get('common.return_to_login'),
              onPressed: () {
                context.go(Routes.signInPage);
              },
            ),
          ),
        ],
      ),
    );
  }
}
