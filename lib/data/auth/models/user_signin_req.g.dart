// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_signin_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSigninReq _$UserSigninReqFromJson(Map<String, dynamic> json) =>
    UserSigninReq(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$UserSigninReqToJson(UserSigninReq instance) =>
    <String, dynamic>{'email': instance.email, 'password': instance.password};
