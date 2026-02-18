// // data/product/datasource/remote/product_api_data_source_impl.dart
// import 'package:dartz/dartz.dart';
// import 'package:e_commerce/data/product/models/product_model.dart';
// import 'package:e_commerce/data/product/source/product_remote_data_source.dart';
// import 'package:e_commerce/domain/product/entity/product_entity.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'product_api_service.dart';

// class ProductApiDataSourceImpl implements ProductRemoteDataSource {
//   final ProductApiService _apiService;
//   final FirebaseAuth _auth;

//   ProductApiDataSourceImpl({
//     required ProductApiService apiService,
//     FirebaseAuth? auth,
//   }) : _apiService = apiService,
//        _auth = auth ?? FirebaseAuth.instance;

//   String get _currentUserId => _auth.currentUser!.uid;

//   // ─── Methods ───────────────────────────────────────────
//   @override
//   Future<Either> getTopSelling() async {
//     try {
//       final result = await _apiService.getTopSelling();
//       return Right(result);
//     } catch (e) {
//       return Left('Please try again: $e');
//     }
//   }

//   @override
//   Future<Either> getNewIn() async {
//     try {
//       final result = await _apiService.getNewIn();
//       return Right(result);
//     } catch (e) {
//       return Left('Please try again: $e');
//     }
//   }

//   @override
//   Future<Either> getProductsByCategoryId(String categoryId) async {
//     try {
//       final result = await _apiService.getProductsByCategoryId(categoryId);
//       return Right(result);
//     } catch (e) {
//       return Left('Please try again: $e');
//     }
//   }

//   @override
//   Future<Either> getProductsByTitle(String title) async {
//     try {
//       final result = await _apiService.getProductsByTitle(title);
//       return Right(result);
//     } catch (e) {
//       return Left('Please try again: $e');
//     }
//   }

//   @override
//   Future<Either> addOrRemoveFavoriteProduct(ProductEntity product) async {
//     try {
//       final productModel = product.fromEntity();

//       // check if favorite first
//       final favorites = await _apiService.getFavoriteProducts(_currentUserId);
//       final isFav = favorites.any((p) => p.productId == product.productId);

//       if (isFav) {
//         await _apiService.removeFavorite(_currentUserId, product.productId);
//         return const Right(false);
//       } else {
//         await _apiService.addFavorite(_currentUserId, productModel);
//         return const Right(true);
//       }
//     } catch (e) {
//       return Left('Please try again: $e');
//     }
//   }

//   @override
//   Future<bool> isFavorite(String productId) async {
//     try {
//       final favorites = await _apiService.getFavoriteProducts(_currentUserId);
//       return favorites.any((p) => p.productId == productId);
//     } catch (_) {
//       return false;
//     }
//   }

//   @override
//   Future<Either> getFavoriteProducts() async {
//     try {
//       final result = await _apiService.getFavoriteProducts(_currentUserId);
//       return Right(result);
//     } catch (e) {
//       return Left('Please try again: $e');
//     }
//   }
// }
