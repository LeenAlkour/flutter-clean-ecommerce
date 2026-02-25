import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/networking/apis.dart';
import 'package:e_commerce/data/auth/models/user_creation-req.dart';
import 'package:e_commerce/data/auth/models/user_signin_req.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthFirebaseService {
  Future<Either> signIn(UserSigninReq user);
  Future<Either> getAges();
  Future<Either> signUp(UserCreationReq user);
  Future<Either> signOut();
  Future<Either> sendPasswordResetEmail(String email);
  Future<bool> isLoggedIn();
  Future<Either> getUser();
  Future<Either> signInWithGoogle();
}

class AuthFirebaseServiceImpl implements AuthFirebaseService {
  
  @override
  Future<Either> signIn(UserSigninReq user) async {
    try {
      await Apis.auth.signInWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );

      return Right("Sign in was successful");
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == "invalid-email") {
        message = "Not user found for that email";
      } else if (e.code == 'invalid-credential') {
        message = 'Wrong password provided for that user';
      } else {
        message = e.toString();
      }
      return Left(message);
    }
  }

  @override
  Future<Either> signUp(UserCreationReq user) async {
    try {
      var result = await Apis.auth.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
      await FirebaseFirestore.instance
          .collection('users')
          .doc(result.user?.uid)
          .set({
            'email': user.email,
            'firstName': user.firstName,
            'lastName': user.lastName,
            'password': user.password,
            'age': user.age,
            'gender': user.gender,
            'image': '',
            'userId': result.user?.uid,

          });
      return Right("Sign up was successful");
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == "weak-password") {
        message = "the password provided is too weak";
      } else if (e.code == 'email-already-in-use') {
        message = 'An Acount already exists with  that email.';
      }
      return Left(message);
    }
  }

  @override
  Future<Either> signOut() async {
    try {
      await Apis.googleSignIn.signOut();
      await Apis.auth.signOut();
      return Right("Sign out was successful");
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either> getAges() async {
    try {
      final result = await FirebaseFirestore.instance.collection('Ages').get();
      return Right(result.docs);
    } catch (e) {
      return Left('please try again');
    }
  }

  @override
  Future<Either> sendPasswordResetEmail(String email) async {
    try {
      await Apis.auth.sendPasswordResetEmail(email: email);
      return Right("Password reset email sent");
    } catch (e) {
      return Left("Please try again");
    }
  }

  @override
  Future<bool> isLoggedIn() async {
    if (Apis.auth.currentUser != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<Either> getUser() async {
    try {
      var currentUser = Apis.auth.currentUser;
      var userData = await Apis.firestore
          .collection('users')
          .doc(currentUser?.uid)
          .get()
          .then((value) => value.data());
      return Right(userData);
    } catch (e) {
      return Left("Please try again");
    }
  }

  @override
  Future<Either> signInWithGoogle() async {
    try {
      // 1️⃣ اختيار حساب Google
      final GoogleSignInAccount? googleUser = await Apis.googleSignIn.authenticate();

      if (googleUser == null) {
        return Left("Google sign in was cancelled");
      }

      // 2️⃣ جلب بيانات المصادقة
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // 3️⃣ إنشاء Credential لـ Firebase
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.idToken,
        idToken: googleAuth.idToken,
      );

      // 4️⃣ تسجيل الدخول في Firebase
      final UserCredential userCredential = await Apis.auth.signInWithCredential(
        credential,
      );

      final user = userCredential.user;

      if (user == null) {
        return Left("Google sign in failed");
      }

      // 5️⃣ التحقق إذا كان المستخدم جديد
      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      if (!userDoc.exists) {
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'email': user.email,
          'firstName': user.displayName?.split(" ").first ?? "",
          'lastName':
              user.displayName?.split(" ").length != null &&
                  user.displayName!.split(" ").length > 1
              ? user.displayName!.split(" ").last
              : "",
            'password': 'lolokholoudK1',
            'age': '15-17',
            'gender': 1,

          'image': user.photoURL,
          'userId': user.uid,

        });
      }

      return Right("Google sign in was successful");
    } on FirebaseAuthException catch (e) {
      return Left(e.message ?? "Google sign in failed");
    } catch (e) {
      return Left(e.toString());
    }
  }
}
