import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/usecase/usecase.dart';
import 'package:e_commerce/domain/product/repository/product_repository.dart';
import 'package:e_commerce/core/di/service_locator.dart';

class GetFavoriteProductsUseCase implements UseCase<Either, List<dynamic>> {
  GetFavoriteProductsUseCase();

  @override
  Future<Either> call({dynamic params}) async {
    return await sl<ProductRepository>().getFavoriteProducts();
  }
}
