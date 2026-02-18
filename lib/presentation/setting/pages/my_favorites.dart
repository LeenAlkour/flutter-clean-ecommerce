import 'package:e_commerce/common/bloc/product/cubit/products_display_cubit.dart';
import 'package:e_commerce/common/widgets/app_bar/custom_app_bar.dart';
import 'package:e_commerce/common/widgets/product_card.dart';
import 'package:e_commerce/core/extensions/localization_extension.dart';
import 'package:e_commerce/domain/product/entity/product_entity.dart';
import 'package:e_commerce/domain/product/usecase/get_favorite_products.dart';
import 'package:e_commerce/core/di/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyFavoritesPage extends StatelessWidget {
  const MyFavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Text(context.get('settings.favorite'))),
      body: BlocProvider(
        create: (context) =>
            ProductsDisplayCubit(useCase: sl<GetFavoriteProductsUseCase>())
              ..displayProducts(),
        child: BlocBuilder<ProductsDisplayCubit, ProductsDisplayState>(
          builder: (context, state) {
            return state.maybeWhen(
                orElse: () =>  Container(),
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error) => Center(child: Text(error)),
                loaded: (data) => _products(data));
          },
        ),
      ),
    );
  }
  Widget _products(List<ProductEntity> products) {
    return GridView.builder(
      padding: EdgeInsets.all(16.sp),
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.6,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (BuildContext context, int index) {
        return ProductCard(product: products[index]);
      },
    );
  }
}
