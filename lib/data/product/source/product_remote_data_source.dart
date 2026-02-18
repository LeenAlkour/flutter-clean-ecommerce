import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/product/entity/product_entity.dart';

abstract class ProductRemoteDataSource {
  Future<Either> getTopSelling();
  Future<Either> getNewIn();
  Future<Either> getProductsByCategoryId(String categoryId);
  Future<Either> getProductsByTitle(String title);
  Future<Either> addOrRemoveFavoriteProduct(ProductEntity product);
  Future<bool> isFavorite(String productId);
  Future<Either> getFavoriteProducts();
}

