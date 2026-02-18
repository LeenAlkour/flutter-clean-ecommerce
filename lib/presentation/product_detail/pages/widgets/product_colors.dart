import 'package:e_commerce/core/configs/theme/app_colors.dart';
import 'package:e_commerce/core/configs/theme/styles.dart';
import 'package:e_commerce/core/extensions/localization_extension.dart';
import 'package:e_commerce/common/widgets/spacing/spacing.dart';
import 'package:e_commerce/domain/product/entity/product_entity.dart';
import 'package:e_commerce/presentation/product_detail/bloc/cubit/product_color_selection_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ProductColors extends StatelessWidget {
  final ProductEntity product;

  const ProductColors({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.sh / 2,
      padding: EdgeInsets.all(16.sp),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,

        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r),
          topRight: Radius.circular(16.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 40.h,
            child: Stack(
              children: [
                Center(
                  child: Text(
                    context.get('product.colors'),
                    style: AppTextStyles.font24SemiBold(
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                    onPressed: () {
                      context.pop();
                    },
                    icon: Icon(Icons.close),
                  ),
                ),
              ],
            ),
          ),
          verticalSpace(20),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return BlocBuilder<ProductColorSelectionCubit, int>(
                  builder: (context, state) {
                    return GestureDetector(
                      onTap: () {
                        context
                            .read<ProductColorSelectionCubit>()
                            .itemSelection(index);
                        context.pop();
                      },
                      child: Container(
                        height: 60.h,
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        decoration: BoxDecoration(
                          color: state == index
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(50.r),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              product.colors[index].title,
                              style: AppTextStyles.font18Bold(),
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 30.h,
                                  width: 30.w,
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(
                                      product.colors[index].rgb[0],
                                      product.colors[index].rgb[1],
                                      product.colors[index].rgb[2],
                                      1,
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                horizontalSpace(10),
                                state == index
                                    ? Icon(Icons.check, size: 30.sp)
                                    : Container(),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              separatorBuilder: (context, index) {
                return verticalSpace(20);
              },
              itemCount: product.colors.length,
            ),
          ),
        ],
      ),
    );
  }
}
