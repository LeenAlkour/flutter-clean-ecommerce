import 'package:e_commerce/core/routing/routes.dart';
import 'package:e_commerce/data/auth/models/user_creation-req.dart';
import 'package:e_commerce/domain/category/entity/category_entity.dart';
import 'package:e_commerce/domain/order/entities/order.dart';
import 'package:e_commerce/domain/order/entities/product_ordered.dart';
import 'package:e_commerce/domain/product/entity/product_entity.dart';
import 'package:e_commerce/presentation/all_categories/all_categories_page.dart';
import 'package:e_commerce/presentation/auth/pages/enter_password_page.dart';
import 'package:e_commerce/presentation/auth/pages/forgot_password_page.dart';
import 'package:e_commerce/presentation/auth/pages/gender_and_age_selection_page.dart';
import 'package:e_commerce/presentation/auth/pages/reset_password_page.dart';
import 'package:e_commerce/presentation/auth/pages/sign_in_page.dart';
import 'package:e_commerce/presentation/auth/pages/sign_up_page.dart';
import 'package:e_commerce/presentation/cart/pages/cart.dart';
import 'package:e_commerce/presentation/cart/pages/check_out.dart';
import 'package:e_commerce/presentation/cart/pages/order_placed.dart';
import 'package:e_commerce/presentation/category_products/pages/category_products.dart';
import 'package:e_commerce/presentation/home/pages/home_page.dart';
import 'package:e_commerce/presentation/language/pages/choose_language.dart';
import 'package:e_commerce/presentation/product_detail/pages/product_detail.dart';
import 'package:e_commerce/presentation/search/pages/search.dart';
import 'package:e_commerce/presentation/setting/pages/my_favorites.dart';
import 'package:e_commerce/presentation/setting/pages/my_orders.dart';
import 'package:e_commerce/presentation/setting/pages/order_details.dart';
import 'package:e_commerce/presentation/setting/pages/order_items.dart';
import 'package:e_commerce/presentation/setting/pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  late final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: Routes.signInPage,
    routes: [
      // Sign In Page
      GoRoute(
        path: Routes.signInPage,
        name: Routes.signInPage,
        pageBuilder: (context, state) =>
            MaterialPage(key: state.pageKey, child: SafeArea(child: SignInPage())),
      ),

      // Sign Up Page
      GoRoute(
        path: Routes.signUpPage,
        name: Routes.signUpPage,
        pageBuilder: (context, state) =>
            MaterialPage(key: state.pageKey, child: SafeArea(child: SignUpPage())),
      ),

      // Enter Password Page - مع دعم UserSigninReq
      GoRoute(
        path: Routes.enterPasswordPage,
        name: Routes.enterPasswordPage,
        pageBuilder: (context, state) {
          final signInReq = state.extra;

          return MaterialPage(
            key: state.pageKey,
            child: SafeArea(child: EnterPasswordPage(email: signInReq as String)),
          );
        },
      ),

      // Forgot Password Page
      GoRoute(
        path: Routes.forgotPasswordPage,
        name: Routes.forgotPasswordPage,
        pageBuilder: (context, state) =>
            MaterialPage(key: state.pageKey, child: SafeArea(child: ForgotPasswordPage())),
      ),

      // Gender and Age Selection Page - مع دعم UserCreationReq
      GoRoute(
        path: Routes.genderAndAgeSelectionPage,
        name: Routes.genderAndAgeSelectionPage,
        pageBuilder: (context, state) {
          final userCreationReq = state.extra;

          return MaterialPage(
            key: state.pageKey,
            child: SafeArea(
              child: GenderAndAgeSelectionPage(
                userCreationReq: userCreationReq as UserCreationReq,
              ),
            ),
          );
        },
      ),

      // Reset Password Page
      GoRoute(
        path: Routes.resetPasswordPage,
        name: Routes.resetPasswordPage,
        pageBuilder: (context, state) =>
            MaterialPage(key: state.pageKey, child: SafeArea(child: const ResetPasswordPage())),
      ),

      // Home Page
      GoRoute(
        path: Routes.homePage,
        name: Routes.homePage,
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const SafeArea(child: HomePage()),
        ),
      ),
      // All Categories Page
      GoRoute(
        path: Routes.allCategoriesPage,
        name: Routes.allCategoriesPage,
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: SafeArea(child: AllCategoriesPage()),
        ),
      ), // Category Products Page
      GoRoute(
        path: Routes.categoryProductsPage,
        name: Routes.categoryProductsPage,
        pageBuilder: (context, state) {
          final category = state.extra;
          return MaterialPage(
            key: state.pageKey,
            child: SafeArea(
              child: CategoryProductsPage(category: category as CategoryEntity),
            ),
          );
        },
      ),
      // Search Page
      GoRoute(
        path: Routes.searchPage,
        name: Routes.searchPage,
        pageBuilder: (context, state) {
          return MaterialPage(
            key: state.pageKey,
            child: SafeArea(
              child: SearchPage(),
            ),
          );
        },
      ),
      // Product Detail Page 
      GoRoute(
        path: Routes.productDetailPage,
        name: Routes.productDetailPage,
        pageBuilder: (context, state) {
          final product = state.extra;

          return MaterialPage(
            key: state.pageKey,
            child: SafeArea(
              child: ProductDetail(product: product as ProductEntity,

              ),
            ),
          );
        },
      ),
      //  Cart Page
      GoRoute(
        path: Routes.cartPage,
        name: Routes.cartPage,
        pageBuilder: (context, state) {

          return MaterialPage(
            key: state.pageKey,
            child: SafeArea(
              child: CartPage(),
            ),
          );
        },
      ),
      //  Check Out Page
      GoRoute(
        path: Routes.checkOutPage,
        name: Routes.checkOutPage,
        pageBuilder: (context, state) {
          final products = state.extra;

          return MaterialPage(
            key: state.pageKey,
            child: SafeArea(
              child: CheckOutPage(products: products as List<ProductOrderedEntity>),
            ),
          );
        },
      ),
      // Order Placed Page
      GoRoute(
        path: Routes.orderPlacedPage,
        name: Routes.orderPlacedPage,
        pageBuilder: (context, state) {

          return MaterialPage(
            key: state.pageKey,
            child: SafeArea(
              child: OrderPlacedPage(),
            ),
          );
        },
      ),
      // Order Details
      GoRoute(
        path: Routes.orderDetailsPage,
        name: Routes.orderDetailsPage,
        pageBuilder: (context, state) {
          final order = state.extra;
          return MaterialPage(
            key: state.pageKey,
            child: SafeArea(child:  OrderDetailsPage(order: order as OrderEntity)),
          );
        },
      ),
      // My Favorite
       GoRoute(
        path: Routes.myFavoritePage,
        name: Routes.myFavoritePage,
        pageBuilder: (context, state) {
          return MaterialPage(
            key: state.pageKey,
            child: SafeArea(
              child: MyFavoritesPage(),
            ),
          );
        },
      ),
      // My Orders
      GoRoute(
        path: Routes.myOrdersPage,
        name: Routes.myOrdersPage,
        pageBuilder: (context, state) {
          return MaterialPage(
            key: state.pageKey,
            child: SafeArea(child: MyOrdersPage()),
          );
        },
      ),
      // Settings
      GoRoute(
        path: Routes.settingsPage,
        name: Routes.settingsPage,
        pageBuilder: (context, state) {
          return MaterialPage(
            key: state.pageKey,
            child: SafeArea(child: SettingsPage()),
          );
        },
      ),
      // Order Items Page
      GoRoute(
        path: Routes.orderItemsPage,
        name: Routes.orderItemsPage,
        pageBuilder: (context, state) {
          final products = state.extra;
          return MaterialPage(
            key: state.pageKey,
            child: SafeArea(
              child: OrderItemsPage(
                products: products as List<ProductOrderedEntity>,
              ),
            ),
          );
        },
      ), 
      // Choose Language Page
      GoRoute(
        path: Routes.chooseLanguagePage,
        name: Routes.chooseLanguagePage,
        pageBuilder: (context, state) {
          return MaterialPage(
            key: state.pageKey,
            child: SafeArea(
              child: ChooseLanguagePage(),
            ),
          );
        },
      ),
    ],

    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('404', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 16),
            Text(
              'Page not found',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () => context.go(Routes.signInPage),
              child: const Text('Go to Sign In'),
            ),
          ],
        ),
      ),
    ),
  );
}
