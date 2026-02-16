import 'package:e_commerce/core/configs/theme/styles.dart';
import 'package:e_commerce/domain/product/entity/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductTitle extends StatelessWidget {
  final ProductEntity product;
  const ProductTitle({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.0.h),
      child: Text(product.title,style: AppTextStyles.font16Bold()),
    );
  }
}