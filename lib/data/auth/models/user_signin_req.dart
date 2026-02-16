import 'package:freezed_annotation/freezed_annotation.dart';

part "user_signin_req.g.dart";
part "user_signin_req.freezed.dart";

@JsonSerializable()
@freezed
class UserSigninReq with _$UserSigninReq {

  @override
  String email;
  @override
  String password;


  UserSigninReq({
    required this.email,
    required this.password,
  });
}
