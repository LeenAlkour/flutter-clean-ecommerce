import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';

/// Service class لإدارة Firebase instances
/// يستخدم Singleton pattern لضمان وجود instance واحد فقط
class FirebaseServices {
  static final FirebaseServices _instance = FirebaseServices._internal();

  late final FirebaseAuth _firebaseAuth;
  late final FirebaseFirestore _firestore;
  late final GoogleSignIn _googleSignIn;

  // Private constructor
  FirebaseServices._internal();

  // Factory constructor - يرجع نفس الـ instance دائماً
  factory FirebaseServices() {
    return _instance;
  }

  /// تهيئة Firebase Services مرة واحدة عند بدء التطبيق
  Future<void> initialize({required String serverClientId}) async {
    _firebaseAuth = FirebaseAuth.instance;
    _firestore = FirebaseFirestore.instance;
    _googleSignIn = GoogleSignIn.instance;

   await _googleSignIn.initialize(
      serverClientId: serverClientId
    );
  }

  /// الحصول على Firebase Auth instance
  FirebaseAuth get auth => _firebaseAuth;

  /// الحصول على Firestore instance
  FirebaseFirestore get firestore => _firestore;

  /// الحصول على Google Sign In instance
  GoogleSignIn get googleSignIn => _googleSignIn;
}
