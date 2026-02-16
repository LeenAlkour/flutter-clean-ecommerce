// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_creation-req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserCreationReq _$UserCreationReqFromJson(Map<String, dynamic> json) =>
    UserCreationReq(
      gender: (json['gender'] as num?)?.toInt() ?? 1,
      age: json['age'] as String? ?? "",
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$UserCreationReqToJson(UserCreationReq instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'password': instance.password,
      'gender': instance.gender,
      'age': instance.age,
    };
