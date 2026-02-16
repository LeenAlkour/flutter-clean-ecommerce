import 'package:e_commerce/domain/auth/entity/user_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@JsonSerializable()
@freezed
class UserModel with _$UserModel {
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
  UserModel({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.image,
    required this.gender,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}




extension UserModelX on UserModel {
  UserEntity toEntity() {
    return UserEntity(
      userId: userId,
      firstName: firstName,
      lastName: lastName,
      email: email,
      image: image,
      gender: gender,
    );
  }
}
