import 'package:freezed_annotation/freezed_annotation.dart';

part "user_entity.freezed.dart";

@freezed
class UserEntity with _$UserEntity {
  @override
  String userId;
  @override
  String firstName;
  @override
  String lastName;
  @override
  String email;
  @override
  String image;
  @override
  int gender;
  UserEntity({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.image,
    required this.gender,
  });
}
