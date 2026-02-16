import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/common/bloc/categories/cubit/categories_display_cubit.dart';
import 'package:e_commerce/core/configs/theme/styles.dart';
import 'package:e_commerce/core/extensions/localization_extension.dart';
import 'package:e_commerce/core/helper/spacing/spacing.dart';
import 'package:e_commerce/core/routing/routes.dart';
import 'package:e_commerce/domain/category/entity/category_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesDisplayCubit()..displayCategories(),
      child: BlocBuilder<CategoriesDisplayCubit, CategoriesDisplayState>(
        builder: (context, state) {
          return state.maybeWhen(
            loaded: (data) => Column(
              children: [
                _seaAll(context),
                verticalSpace(20),
                _categories(data),
              ],
            ),

            loading: () => Center(child: CircularProgressIndicator()),
            error: (e) => Text(e),
            orElse: () => Container(),
          );
        },
      ),
    );
  }

  Widget _seaAll(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 8.0.w),
          child: Text(context.get('home.categories'), style: AppTextStyles.font16Bold()),
        ),
        TextButton(
          onPressed: () {
            context.push(Routes.allCategoriesPage);
          },
          child: Text(context.get('home.see_all'), style: AppTextStyles.font16Regular()),
        ),
      ],
    );
  }


Widget _categories(List<dynamic> categories) {
  return SizedBox(
    height: 110.h,
    child: ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        final category = categories[index];
        return Column(
          children: [
            Container(
              height: 60.h,
              width: 60.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
              ),
              child: ClipOval(
                child: category.image.isNotEmpty
                    ? CachedNetworkImage(
                        imageUrl: category.image,
                        width: 60.w,
                        height: 60.h,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Container(
                          color: Colors.grey[200],
                          child: Center(
                            child: SizedBox(
                              width: 20.w,
                              height: 20.w,
                              child: const CircularProgressIndicator(
                                strokeWidth: 2,
                              ),
                            ),
                          ),
                        ),
                        errorWidget: (context, url, error) => Container(
                          color: Colors.grey[200],
                          child: Icon(
                            Icons.category,
                            size: 30.sp,
                            color: Colors.grey[400],
                          ),
                        ),
                      )
                    : Container(
                        color: Colors.grey[200],
                        child: Icon(
                          Icons.category,
                          size: 30.sp,
                          color: Colors.grey[400],
                        ),
                      ),
              ),
            ),
            verticalSpace(8),
            SizedBox(
              width: 70.w,
              child: Text(
                category.title,
                style: AppTextStyles.font14Medium(),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        );
      },
      separatorBuilder: (context, index) => horizontalSpace(8.w),
      itemCount: categories.length,
    ),
  );
}}
