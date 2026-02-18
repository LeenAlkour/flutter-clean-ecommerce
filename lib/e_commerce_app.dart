import 'package:e_commerce/core/configs/theme/theme.dart';
import 'package:e_commerce/core/localization/app_localizations.dart';
import 'package:e_commerce/core/routing/app_router.dart';
import 'package:e_commerce/presentation/language/cubit/language_cubit.dart';
import 'package:e_commerce/presentation/language/cubit/language_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ECommerceApp extends StatelessWidget {
  const ECommerceApp({super.key, required this.goRouterApp});

  final AppRouter goRouterApp;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => 
          LanguageCubit()..initializeLanguage(),
      child: BlocBuilder<LanguageCubit, LanguageState>(
        builder: (context, state) {
          return ScreenUtilInit(
            designSize: const Size(375, 812),
            minTextAdapt: true,
            splitScreenMode: true,
            child: MaterialApp.router(
              // locale: Locale(state.currentLanguageCode),
              localizationsDelegates: [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('en'),
                Locale('ar'),
              ],
              routerConfig: goRouterApp.router,
              debugShowCheckedModeBanner: false,
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: ThemeMode.system,
            ),
          );
        },
      ),
    );
  }
}
