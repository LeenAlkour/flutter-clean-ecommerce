import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/usecase/usecase.dart';
import 'package:e_commerce/data/auth/models/user_creation-req.dart';
import 'package:e_commerce/domain/auth/repository/auth_repository.dart';
import 'package:e_commerce/core/di/service_locator.dart';

class SignUpUseCase implements UseCase<Either, UserCreationReq> {

  SignUpUseCase();

  @override
  Future<Either> call({UserCreationReq? params})async {
    return await sl<AuthRepository>().signUp(params!);
  }
}