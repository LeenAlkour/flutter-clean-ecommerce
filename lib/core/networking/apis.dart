import 'package:e_commerce/core/networking/firebase_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';

/// Helper class للوصول السريع إلى Firebase instances
/// بدلاً من إنشاء instances جديدة في كل مرة
class Apis {
  static FirebaseAuth get auth => FirebaseServices().auth;

  static FirebaseFirestore get firestore => FirebaseServices().firestore;

  static GoogleSignIn get googleSignIn => FirebaseServices().googleSignIn;
}
