import 'package:dartz/dartz.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/data/product/source/product_remote_data_source.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:e_commerce/data/product/models/product_model.dart';
import 'package:e_commerce/domain/product/entity/product_entity.dart';

class ProductFirebaseDataSourceImpl implements ProductRemoteDataSource {
  @override
  Future<Either> getTopSelling() async {
    try {
      final result = await FirebaseFirestore.instance
          .collection('Products')
          .where('salesNumber', isGreaterThanOrEqualTo: 20)
          .get();

      return Right(result.docs.map((e) => e.data()).toList());
    } catch (e) {
      return Left('Please try again');
    }
  }

  @override
  Future<Either> getNewIn() async {
    try {
      final result = await FirebaseFirestore.instance
          .collection('Products')
          .where(
            'createdDate',
            isGreaterThanOrEqualTo: DateTime.now().subtract(
              const Duration(days: 1),
            ),
          )
          .get();

      return Right(result.docs.map((e) => e.data()).toList());
    } catch (e) {
      return Left('Please try again');
    }
  }

  @override
  Future<Either> getProductsByCategoryId(String categoryId) async {
    try {
      final result = await FirebaseFirestore.instance
          .collection('Products')
          .where('categoryId', isEqualTo: categoryId)
          .get();

      return Right(result.docs.map((e) => e.data()).toList());
    } catch (e) {
      return Left('Please try again');
    }
  }

  @override
  Future<Either> getProductsByTitle(String title) async {
    try {
      final result = await FirebaseFirestore.instance
          .collection('Products')
          .where('title', isGreaterThanOrEqualTo: title)
          .get();

      return Right(result.docs.map((e) => e.data()).toList());
    } catch (e) {
      return Left('Please try again');
    }
  }

  @override
  Future<Either> addOrRemoveFavoriteProduct(ProductEntity product) async {
    try {
      var user = FirebaseAuth.instance.currentUser;

      var products = await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .collection("Favorites")
          .where('productId', isEqualTo: product.productId)
          .get();
      if (products.docs.isNotEmpty) {
        await products.docs.first.reference.delete();
        return Right(false);
      } else {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .collection("Favorites")
            .add(product.fromEntity().toJson());
        return Right(true);
      }
    } catch (e) {
      return Left('Please try again $e');
    }
  }

  @override
  Future<bool> isFavorite(String productId) async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      var products = await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .collection("Favorites")
          .where('productId', isEqualTo: productId)
          .get();
      if (products.docs.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  @override
  Future<Either> getFavoriteProducts() async {
    try {
      var user = FirebaseAuth.instance.currentUser;

      final result = await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .collection("Favorites")
          .get();

      return Right(result.docs.map((e) => e.data()).toList());
    } catch (e) {
      return Left('Please try again');
    }
  }
}
