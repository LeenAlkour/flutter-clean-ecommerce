import 'package:e_commerce/core/usecase/usecase.dart';
import 'package:e_commerce/domain/auth/repository/auth_repository.dart';
import 'package:e_commerce/core/di/service_locator.dart';

class IsLoggedInUseCase implements UseCase<bool, dynamic> {
  IsLoggedInUseCase();

  @override
  Future<bool> call({dynamic params}) async {
    return await sl<AuthRepository>().isLoggedIn();
  }
}
