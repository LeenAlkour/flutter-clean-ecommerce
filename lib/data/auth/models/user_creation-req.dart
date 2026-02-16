import 'package:freezed_annotation/freezed_annotation.dart';

part "user_creation-req.g.dart";
part "user_creation-req.freezed.dart";

@JsonSerializable()
@freezed
class UserCreationReq with _$UserCreationReq {
   String firstName;
    String lastName;
    String email;
    String password;
    int gender;
    String age;

  UserCreationReq(
   {
     this.gender=1,
     this.age="",
   required this.firstName,
   required this.lastName,
   required this.email,
   required this.password,}
  );
}
