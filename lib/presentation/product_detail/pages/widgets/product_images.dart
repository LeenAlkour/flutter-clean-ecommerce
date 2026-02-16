import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/domain/product/entity/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductImages extends StatelessWidget {
  final ProductEntity product;

  const ProductImages({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: CachedNetworkImage(
              imageUrl: product.images[index],
              width: 200.w,
              height: 200.h,
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                width: 200.w,
                height: 200.h,
                color: Colors.grey[300],
                child: const Center(child: CircularProgressIndicator()),
              ),
              errorWidget: (context, url, error) => Container(
                width: 200.w,
                height: 200.h,
                color: Colors.grey[300],
                child: const Icon(
                  Icons.broken_image,
                  size: 50,
                  color: Colors.grey,
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(width: 16.w),
        itemCount: product.images.length,
      ),
    );
  }
}
