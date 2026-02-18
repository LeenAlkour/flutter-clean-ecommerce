import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/usecase/usecase.dart';
import 'package:e_commerce/domain/product/repository/product_repository.dart';
import 'package:e_commerce/core/di/service_locator.dart';

class GetTopSellingUseCase implements UseCase<Either, List<dynamic>> {
  GetTopSellingUseCase();

  @override
  Future<Either> call({dynamic params}) async {
    return await sl<ProductRepository>().getTopSelling();
  }
}
