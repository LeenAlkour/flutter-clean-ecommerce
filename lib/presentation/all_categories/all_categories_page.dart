import 'package:e_commerce/common/bloc/categories/cubit/categories_display_cubit.dart';
import 'package:e_commerce/common/widgets/app_bar/custom_app_bar.dart';
import 'package:e_commerce/core/configs/theme/styles.dart';
import 'package:e_commerce/core/extensions/localization_extension.dart';
import 'package:e_commerce/core/helper/spacing/spacing.dart';
import 'package:e_commerce/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AllCategoriesPage extends StatelessWidget {
  const AllCategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: BlocProvider(
        create: (context) => CategoriesDisplayCubit()..displayCategories(),
        child: Padding(
          padding: EdgeInsets.all(16.0.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [_shopByCategories(context), verticalSpace(10), _categories(context)],
          ),
        ),
      ),
    );
  }

  Widget _shopByCategories(BuildContext context) {
    return Text(context.get('product.shop_by_categories'), style: AppTextStyles.font24Bold(color: Theme.of(context).colorScheme.onSecondary));
  }

  Widget _categories(BuildContext context) {
    return BlocBuilder<CategoriesDisplayCubit, CategoriesDisplayState>(
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (category) => ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  context.push(Routes.categoryProductsPage,extra: category[index]);
                },
                child: Container(
                  height: 70.h,
                  padding: EdgeInsets.all(12.sp),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.sp),
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 50.h,
                        width: 50.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).colorScheme.onSecondary,
                          image: DecorationImage(image: NetworkImage(category[index].image))
                        ),
                      ),
                      horizontalSpace(10),
                      Text(
                        category[index].title,
                        style: AppTextStyles.font24Bold(
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => verticalSpace(10),
            itemCount: category.length,
          ),
          loading: () => Center(child: CircularProgressIndicator()),
          orElse: () => Container(),
          error: (error) => Center(child: Text(error)),
        );
      },
    );
  }
}
