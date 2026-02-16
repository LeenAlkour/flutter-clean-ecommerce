import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/usecase/usecase.dart';
import 'package:e_commerce/domain/category/repository/category_repository.dart';
import 'package:e_commerce/service_locator.dart';

class GetCategoriesUseCase implements UseCase<Either, List<dynamic>> {
  GetCategoriesUseCase();

  @override
  Future<Either> call({dynamic params}) async {
    return await sl<CategoryRepository>().getCategories();
  }
}
