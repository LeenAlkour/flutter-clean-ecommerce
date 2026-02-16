import 'package:e_commerce/common/helper/cart/cart.dart';
import 'package:e_commerce/common/widgets/button/custom_button.dart';
import 'package:e_commerce/core/configs/theme/app_colors.dart';
import 'package:e_commerce/core/configs/theme/styles.dart';
import 'package:e_commerce/core/extensions/localization_extension.dart';
import 'package:e_commerce/core/routing/routes.dart';
import 'package:e_commerce/domain/order/entities/product_ordered.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CheckOut extends StatelessWidget {
  final List<ProductOrderedEntity> products;
  CheckOut({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.sp),
      height: 1.sh / 3.5,
      color: Theme.of(context).colorScheme.secondary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Text(
                context.get('cart.subtotal'),
                style: AppTextStyles.font16Regular(
                  color: AppColors.textSecondaryColor,
                ),
              ),
              Text(
                "\$${CartHelper.calculateCartSubtotal(products).toString()}",
                style: AppTextStyles.font16Bold(),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Text(
                context.get('cart.shipping'),
                style: AppTextStyles.font16Regular(
                  color: AppColors.textSecondaryColor,
                ),
              ),
              Text("\$200", style: AppTextStyles.font16Bold()),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Text(
                context.get('cart.tax'),
                style: AppTextStyles.font16Regular(
                  color: AppColors.textSecondaryColor,
                ),
              ),
              Text("\$200", style: AppTextStyles.font16Bold()),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Text(
                context.get('cart.total'),
                style: AppTextStyles.font16Regular(
                  color: AppColors.textSecondaryColor,
                ),
              ),
              Text(
                "\$${CartHelper.calculateCartSubtotal(products) + 8}",
                style: AppTextStyles.font16Bold(),
              ),
            ],
          ),
          CustomButton(
            onPressed: () {
              context.pushNamed(Routes.checkOutPage,extra: products);
            },
            title: context.get('cart.check_out'),
          ),
        ],
      ),
    );
  }
}
