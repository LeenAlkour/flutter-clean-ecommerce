import 'package:e_commerce/presentation/auth/bloc/cubit/cubit/cubit/authenticat_cubit.dart';
import 'package:e_commerce/presentation/auth/pages/sign_in_page.dart';
import 'package:e_commerce/presentation/home/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppStartedPage extends StatelessWidget {
  const AppStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticatCubit, AuthenticatState>(
      builder: (context, state) {
        return state.maybeWhen(
          authenticated: () => HomePage(),
          unAuthenticated: () => SignInPage(),
          orElse: () => const SizedBox(),
        );
      },
    );
  }
}
