import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/product/models/product_model.dart';
import 'package:e_commerce/data/product/source/product_remote_data_source.dart';
import 'package:e_commerce/domain/product/entity/product_entity.dart';
import 'package:e_commerce/domain/product/repository/product_repository.dart';
import 'package:e_commerce/core/di/service_locator.dart';

class ProductRepositoryImpl implements ProductRepository {
  @override
  Future<Either> getTopSelling() async {
    final result = await sl<ProductRemoteDataSource>().getTopSelling();
    return result.fold(
      (error) => Left(error),
      (ruselt) => Right(
        List.from(
          ruselt,
        ).map((e) => ProductModel.fromJson(e).toEntity()).toList(),
      ),
    );
  }

  @override
  Future<Either> getNewIn() async {
    final result = await sl<ProductRemoteDataSource>().getNewIn();
    return result.fold(
      (error) => Left(error),
      (ruselt) => Right(
        List.from(
          ruselt,
        ).map((e) => ProductModel.fromJson(e).toEntity()).toList(),
      ),
    );
  }

  @override
  Future<Either> getProductsByCategoryId(String categoryId) async {
    final result = await sl<ProductRemoteDataSource>().getProductsByCategoryId(
      categoryId,
    );
    return result.fold(
      (error) => Left(error),
      (ruselt) => Right(
        List.from(
          ruselt,
        ).map((e) => ProductModel.fromJson(e).toEntity()).toList(),
      ),
    );
  }

  @override
  Future<Either> getProductsByTitle(String title) async {
    final result = await sl<ProductRemoteDataSource>().getProductsByTitle(
      title,
    );
    return result.fold(
      (error) => Left(error),
      (ruselt) => Right(
        List.from(
          ruselt,
        ).map((e) => ProductModel.fromJson(e).toEntity()).toList(),
      ),
    );
  }

  @override
  Future<Either> addOrRemoveFavoriteProduct(ProductEntity product) async {
    final result = await sl<ProductRemoteDataSource>()
        .addOrRemoveFavoriteProduct(product);
    return result.fold((error) => Left(error), (ruselt) => Right(ruselt));
  }

  @override
  Future<bool> isFavorite(String productId) {
    return sl<ProductRemoteDataSource>().isFavorite(productId);
  }

  @override
  Future<Either> getFavoriteProducts() async {
    final result = await sl<ProductRemoteDataSource>().getFavoriteProducts();
    return result.fold(
      (error) => Left(error),
      (ruselt) => Right(
        List.from(
          ruselt,
        ).map((e) => ProductModel.fromJson(e).toEntity()).toList(),
      ),
    );
  }
}
