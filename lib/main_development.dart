import 'package:e_commerce/core/networking/firebase_services.dart';
import 'package:e_commerce/core/routing/app_router.dart';
import 'package:e_commerce/core/storage/get_storage.dart';
import 'package:e_commerce/e_commerce_app.dart';
import 'package:e_commerce/core/di/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:e_commerce/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await ScreenUtil.ensureScreenSize();
await FirebaseServices().initialize(
    serverClientId:
        '383664719524-fghi04v3q58sfg4af3bqmduuf310e24d.apps.googleusercontent.com',
  );
  await StorageService.init();
  await initializeDependencies();

  runApp(ECommerceApp(goRouterApp: AppRouter()));
}
