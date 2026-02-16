import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/auth/models/user_creation-req.dart';
import 'package:e_commerce/data/auth/models/user_signin_req.dart';

abstract class AuthRepository {
  Future<Either> signIn(UserSigninReq user);
  Future<Either> signInWithGoogle();
  Future<Either> getAges();
  Future<Either> signUp(UserCreationReq user);
  Future<Either> signOut();
  Future<Either> sendPasswordResetEmail(String email);
  Future<bool> isLoggedIn();
  Future<Either> getUser();

}
