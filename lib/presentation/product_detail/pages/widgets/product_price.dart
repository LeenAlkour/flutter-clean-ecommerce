import 'package:e_commerce/core/configs/theme/app_colors.dart';
import 'package:e_commerce/core/configs/theme/styles.dart';
import 'package:e_commerce/domain/product/entity/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductPrice extends StatelessWidget {
  final ProductEntity product;
  const ProductPrice({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.0.h),
      child: Text("\$${product.discountedPrice!=0?product.discountedPrice.toString():product.price.toString()}",
      style: AppTextStyles.font16Bold(color:AppColors.primaryDark)),
    );
  }
}