import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/usecase/usecase.dart';
import 'package:e_commerce/domain/auth/repository/auth_repository.dart';
import 'package:e_commerce/core/di/service_locator.dart';

class Signout implements UseCase<Either, dynamic> {
  Signout();

  @override
  Future<Either> call({dynamic params}) async {
    return await sl<AuthRepository>().signOut();
  }
}
