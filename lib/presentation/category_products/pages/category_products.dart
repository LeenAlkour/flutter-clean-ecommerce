import 'package:e_commerce/common/bloc/product/cubit/products_display_cubit.dart';
import 'package:e_commerce/common/widgets/app_bar/custom_app_bar.dart';
import 'package:e_commerce/common/widgets/product_card.dart';
import 'package:e_commerce/core/configs/theme/styles.dart';
import 'package:e_commerce/core/helper/spacing/spacing.dart';
import 'package:e_commerce/domain/category/entity/category_entity.dart';
import 'package:e_commerce/domain/product/entity/product_entity.dart';
import 'package:e_commerce/domain/product/usecase/get_products_by_category_id.dart';
import 'package:e_commerce/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryProductsPage extends StatelessWidget {
  final CategoryEntity category;
  CategoryProductsPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: BlocProvider(
        create: (context) =>
            ProductsDisplayCubit(useCase: sl<GetProductsByCategoryIdUseCase>())
              ..displayProducts(param: category.categoryId),
        child: BlocBuilder<ProductsDisplayCubit, ProductsDisplayState>(
          builder: (context, state) {
            return state.maybeWhen(
              loading: () => Center(child: CircularProgressIndicator()),
              orElse: () => Container(),
              error: (msg) => Center(child: Text(msg)),
              loaded: (data) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [_categoryInfo(data), verticalSpace(10), _products(data)],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _categoryInfo(List<ProductEntity> products) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.0.w),
      child: Text("${category.title} (${products.length})", style: AppTextStyles.font16Bold()),
    );
  }
}

Widget _products(List<ProductEntity> products) {
  return Expanded(
    child: GridView.builder(itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount( 
        crossAxisCount: 2,
        childAspectRatio: 0.6,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (BuildContext context, int index) {
        return ProductCard(product: products[index],);
      },
    ),
  ); 
}
