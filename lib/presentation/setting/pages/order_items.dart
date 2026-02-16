import 'package:e_commerce/common/widgets/app_bar/custom_app_bar.dart';
import 'package:e_commerce/core/extensions/localization_extension.dart';
import 'package:e_commerce/core/helper/spacing/spacing.dart';
import 'package:e_commerce/domain/order/entities/product_ordered.dart';
import 'package:e_commerce/presentation/setting/widgets/order_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderItemsPage extends StatelessWidget {
  final List<ProductOrderedEntity> products;
  const OrderItemsPage({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Text(context.get('order.items'))),
      body: _products(products),
    );
  }
  Widget _products(List<ProductOrderedEntity> products) {
    return ListView.separated(
      padding: EdgeInsets.all(16.sp),
      itemBuilder: (context, index) {
        return OrderItemCard(product: products[index]);
      },
      separatorBuilder: (context, index) => verticalSpace(10),
      itemCount: products.length,
    );
  }
}