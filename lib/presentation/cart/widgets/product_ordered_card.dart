import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/configs/theme/app_colors.dart';
import 'package:e_commerce/core/configs/theme/styles.dart';
import 'package:e_commerce/core/extensions/localization_extension.dart';
import 'package:e_commerce/common/widgets/spacing/spacing.dart';
import 'package:e_commerce/domain/order/entities/product_ordered.dart';
import 'package:e_commerce/presentation/cart/bloc/cubit/cart_product_display_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductOrderedCard extends StatelessWidget {
  final ProductOrderedEntity product;

  const ProductOrderedCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      padding: EdgeInsets.all(8.sp),
      margin: EdgeInsets.only(bottom: 8.h),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(8.r),
      ),
    child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 90.w,
            height: 90.h, 
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(4.r),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4.r),
              child: product.productImage.isNotEmpty
                  ? CachedNetworkImage(
                      imageUrl: product.productImage,
                      width: 90.w,
                      height: 90.h,
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
                          Icons.broken_image,
                          size: 30.sp,
                          color: Colors.grey[400],
                        ),
                      ),
                    )
                  : Container(
                      color: Colors.grey[200],
                      child: Icon(
                        Icons.image,
                        size: 30.sp,
                        color: Colors.grey[400],
                      ),
                    ),
            ),
          ),

          horizontalSpace(10),

          Expanded(
            child: SizedBox(
              height: 90.h, 
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.productTitle,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: AppTextStyles.font14Medium(),
                      ),
                      verticalSpace(4),

                      Row(
                        children: [
                          _buildAttribute(
                            context: context,
                            label: context.get('product.size'),
                            value: product.productSize,
                          ),
                          horizontalSpace(8),
                          _buildAttribute(
                            context: context,
                            label: context.get('product.color'),
                            value: product.productColor,
                          ),
                          horizontalSpace(8),
                          _buildAttribute(
                            context: context,
                            label: context.get('product.quantity'),
                            value: product.productQuantity.toString(),
                          ),
                        ],
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$${product.totalPrice.toStringAsFixed(2)}",
                        style: AppTextStyles.font14Medium(
                          color: AppColors.primaryDark,
                        ),
                      ),

                      GestureDetector(
                        onTap: () {
                          context
                              .read<CartProductDisplayCubit>()
                              .removeCartProduct(product);
                        },
                        child: Container(
                          height: 28.h,
                          width: 28.w,
                          decoration: BoxDecoration(
                            color: AppColors.errorColor.withOpacity(0.1),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.errorColor,
                              width: 1.w,
                            ),
                          ),
                          child: Icon(
                            Icons.remove,
                            size: 16.sp,
                            color: AppColors.errorColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),   );
  }

  Widget _buildAttribute({required BuildContext context,required String label, required String value}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSecondary.withOpacity(0.2),
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Text.rich(
        TextSpan(
          text: "$label: ",
          style: AppTextStyles.font10Medium(color: AppColors.textTertiaryColor),
          children: [
            TextSpan(
              text: value,
              style: AppTextStyles.font10Medium(color: AppColors.bgLightColor),
            ),
          ],
        ),
      ),
    );
  }
}
