import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/category/models/category.dart';
import 'package:e_commerce/data/category/source/category_firebase_source.dart';
import 'package:e_commerce/domain/category/repository/category_repository.dart';
import 'package:e_commerce/core/di/service_locator.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  @override
  Future<Either> getCategories() async {
    final categories = await sl<CategoryFirebaseService>().getCategories();
    
    return categories.fold((errorMessage) => Left(errorMessage), (data) {
      print(
        "+++++++++++++++++++++++++++++++++${data.map((e) => CategoryModel.fromJson(e).toEntity()).toList()}",
      );
      return Right(
        data.map((e) => CategoryModel.fromJson(e).toEntity()).toList(),
        // List.from(data.map((e)=>CategoryModel.fromJson(e).toEntity()).toList())
      );
    });
  }
}
