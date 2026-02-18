import 'package:e_commerce/data/auth/repository/auth_repository_impl.dart';
import 'package:e_commerce/data/auth/source/auth_firebase_service.dart';
import 'package:e_commerce/data/category/repository/category_repository_impl.dart';
import 'package:e_commerce/data/category/source/category_firebase_source.dart';
import 'package:e_commerce/data/order/reposirory/order_repsitory_impl.dart';
import 'package:e_commerce/data/order/source/order_firebase_service.dart';
import 'package:e_commerce/data/product/repository/product_repository_impl.dart';
import 'package:e_commerce/data/product/source/product_firebase_data_source_impl.dart';
import 'package:e_commerce/data/product/source/product_remote_data_source.dart';
import 'package:e_commerce/domain/auth/repository/auth_repository.dart';
import 'package:e_commerce/domain/auth/usecases/get_ages.dart';
import 'package:e_commerce/domain/auth/usecases/get_user.dart';
import 'package:e_commerce/domain/auth/usecases/signin.dart';
import 'package:e_commerce/domain/auth/usecases/signin_with_google.dart';
import 'package:e_commerce/domain/auth/usecases/signup.dart';
import 'package:e_commerce/domain/auth/usecases/send_password_reset_email.dart';
import 'package:e_commerce/domain/auth/usecases/is_logged_in.dart';
import 'package:e_commerce/domain/category/repository/category_repository.dart';
import 'package:e_commerce/domain/category/usecase/get_categories.dart';
import 'package:e_commerce/domain/order/repository/order.dart';
import 'package:e_commerce/domain/order/usecase/add_to_cart.dart';
import 'package:e_commerce/domain/order/usecase/get_cart_product.dart';
import 'package:e_commerce/domain/order/usecase/get_orders.dart';
import 'package:e_commerce/domain/order/usecase/order_registration.dart';
import 'package:e_commerce/domain/order/usecase/remove_cart_product.dart';
import 'package:e_commerce/domain/product/repository/product_repository.dart';
import 'package:e_commerce/domain/product/usecase/add_or_remove_favorite_product.dart';
import 'package:e_commerce/domain/product/usecase/get_favorite_products.dart';
import 'package:e_commerce/domain/product/usecase/get_new_in.dart';
import 'package:e_commerce/domain/product/usecase/get_products_by_category_id.dart';
import 'package:e_commerce/domain/product/usecase/get_products_by_title.dart';
import 'package:e_commerce/domain/product/usecase/get_top_selling.dart';
import 'package:e_commerce/domain/product/usecase/is_favorite.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  //Services
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());
  sl.registerSingleton<CategoryFirebaseService>(CategoryFirebaseServiceImpl());
  sl.registerSingleton<ProductRemoteDataSource>(
    ProductFirebaseDataSourceImpl(),
  );
  sl.registerSingleton<OrderFirebaseService>(OrderFirebaseServiceImpl());
  //Repositories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<CategoryRepository>(CategoryRepositoryImpl());
  sl.registerSingleton<ProductRepository>(ProductRepositoryImpl());
  sl.registerSingleton<OrderRepository>(OrderRepositoryImpl());
  //UseCase
  sl.registerSingleton<SigninUseCase>(SigninUseCase());
  sl.registerSingleton<SignUpUseCase>(SignUpUseCase());
  sl.registerSingleton<GetAgesUseCase>(GetAgesUseCase());
  sl.registerSingleton<GetCategoriesUseCase>(GetCategoriesUseCase());
  sl.registerSingleton<SendPasswordResetEmailUseCase>(
    SendPasswordResetEmailUseCase(),
  );
  sl.registerSingleton<IsLoggedInUseCase>(IsLoggedInUseCase());
  sl.registerSingleton<GetUserUseCase>(GetUserUseCase());
  sl.registerSingleton<GetTopSellingUseCase>(GetTopSellingUseCase());
  sl.registerSingleton<GetNewInUseCase>(GetNewInUseCase());
  sl.registerSingleton<GetProductsByCategoryIdUseCase>(
    GetProductsByCategoryIdUseCase(),
  );
  sl.registerSingleton<GetProductsByTitleUseCase>(GetProductsByTitleUseCase());
  sl.registerSingleton<AddToCartUseCase>(AddToCartUseCase());
  sl.registerSingleton<GetCartProductUseCase>(GetCartProductUseCase());
  sl.registerSingleton<RemoveCartProductUSeCase>(RemoveCartProductUSeCase());
  sl.registerSingleton<OrderRegistrationUseCase>(OrderRegistrationUseCase());
  sl.registerSingleton<AddOrRemoveFavoriteProductUseCase>(
    AddOrRemoveFavoriteProductUseCase(),
  );
  sl.registerSingleton<IsFavoriteUseCase>(IsFavoriteUseCase());
  sl.registerSingleton<GetFavoriteProductsUseCase>(
    GetFavoriteProductsUseCase(),
  );
  sl.registerSingleton<GetOrdersUseCase>(GetOrdersUseCase());
  sl.registerSingleton<SigninWithGoogleUseCase>(SigninWithGoogleUseCase());
}
