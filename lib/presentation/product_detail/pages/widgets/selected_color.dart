import 'package:e_commerce/core/configs/theme/app_colors.dart';
import 'package:e_commerce/core/configs/theme/styles.dart';
import 'package:e_commerce/core/extensions/localization_extension.dart';
import 'package:e_commerce/core/helper/bottomsheet/app_bottomsheet.dart';
import 'package:e_commerce/core/helper/spacing/spacing.dart';
import 'package:e_commerce/domain/product/entity/product_entity.dart';
import 'package:e_commerce/presentation/product_detail/bloc/cubit/product_color_selection_cubit.dart';
import 'package:e_commerce/presentation/product_detail/pages/widgets/product_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectedColor extends StatelessWidget {
  final ProductEntity product;
  const SelectedColor({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppBottomsheet.display(
          context,
          BlocProvider.value(
            value: BlocProvider.of<ProductColorSelectionCubit>(context),
            child: ProductColors(product: product),
          ),
        );
      },
      child: Container(
        height: 60.h,
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(100.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              context.get('product.colors'),
              style: AppTextStyles.font16SemiBold(color: AppColors.primaryDark),
            ),
            Row(
              children: [
                BlocBuilder<ProductColorSelectionCubit, int>(
                  builder: (context, state) {
                    return Container(
                      height: 30.h,
                      width: 30.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(
                          product.colors[state].rgb[0],
                          product.colors[state].rgb[1],
                          product.colors[state].rgb[2],
                          1,
                        ),
                      ),
                    );
                  },
                ),
                horizontalSpace(15),
                Icon(Icons.keyboard_arrow_down),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
