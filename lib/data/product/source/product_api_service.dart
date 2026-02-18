// // data/product/datasource/remote/product_api_service.dart
// import 'package:dio/dio.dart';
// import 'package:e_commerce/data/product/models/product_model.dart';
// import 'package:retrofit/retrofit.dart';

// part 'product_api_service.g.dart';

// @RestApi(baseUrl: "https://your-api.com/api/")
// abstract class ProductApiService {
//   factory ProductApiService(Dio dio, {String baseUrl}) = _ProductApiService;

//   @GET("products/top-selling")
//   Future<List<ProductModel>> getTopSelling();

//   @GET("products/new-in")
//   Future<List<ProductModel>> getNewIn();

//   @GET("products/category/{id}")
//   Future<List<ProductModel>> getProductsByCategoryId(
//     @Path("id") String categoryId,
//   );

//   @GET("products/search")
//   Future<List<ProductModel>> getProductsByTitle(@Query("title") String title);

//   @GET("users/{userId}/favorites")
//   Future<List<ProductModel>> getFavoriteProducts(@Path("userId") String userId);

//   @POST("users/{userId}/favorites")
//   Future<void> addFavorite(
//     @Path("userId") String userId,
//     @Body() ProductModel product,
//   );

//   @DELETE("users/{userId}/favorites/{productId}")
//   Future<void> removeFavorite(
//     @Path("userId") String userId,
//     @Path("productId") String productId,
//   );
// }
