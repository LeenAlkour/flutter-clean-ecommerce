import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/configs/theme/app_colors.dart';
import 'package:e_commerce/core/configs/theme/styles.dart';
import 'package:e_commerce/core/extensions/localization_extension.dart';
import 'package:e_commerce/core/helper/spacing/spacing.dart';
import 'package:e_commerce/domain/order/entities/product_ordered.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderItemCard extends StatelessWidget {
  final ProductOrderedEntity product;
  
  const OrderItemCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      padding: EdgeInsets.all(8.sp),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          Container(
            width: 80.w,
            height: 84.h,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(4.r),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4.r),
              child: _buildProductImage(),
            ),
          ),
          horizontalSpace(10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.productTitle,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: AppTextStyles.font16SemiBold(),
                ),
                Wrap(
                  spacing: 8.w,
                  runSpacing: 4.h,
                  children: [
                    _buildInfoChip(context.get('product.size'), product.productSize, context),
                    _buildInfoChip(context.get('product.color'), product.productColor, context),
                    _buildInfoChip(context.get('product.quantity'), product.productQuantity.toString(), context),
                  ],
                ),
                Text(
                  "\$${_formatPrice(product.totalPrice)}",
                  style: AppTextStyles.font14Medium(
                    color: AppColors.primaryDark,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductImage() {
    if (product.productImage != null && product.productImage!.isNotEmpty) {
      return CachedNetworkImage(
        imageUrl: product.productImage!,
        width: 80.w,
        height: 84.h,
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
      );
    }
    
    return Container(
      color: Colors.grey[200],
      child: Center(
        child: Icon(
          Icons.image,
          color: Colors.grey[400],
          size: 30.sp,
        ),
      ),
    );
  }

  Widget _buildInfoChip(String label, String value, BuildContext context) {
    if (value.isEmpty) return const SizedBox.shrink();
    
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 8.w,
        vertical: 4.h,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Text(
        "$label: $value",
        style: AppTextStyles.font10Medium(color: AppColors.textTertiaryColor),
      ),
    );
  }

  String _formatPrice(double price) {
    return price.toStringAsFixed(2);
  }
}