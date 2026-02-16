import 'package:e_commerce/common/widgets/app_bar/custom_app_bar.dart';
import 'package:e_commerce/core/configs/theme/app_colors.dart';
import 'package:e_commerce/core/configs/theme/styles.dart';
import 'package:e_commerce/core/extensions/localization_extension.dart';
import 'package:e_commerce/core/helper/spacing/spacing.dart';
import 'package:e_commerce/core/routing/routes.dart';
import 'package:e_commerce/domain/order/entities/order.dart';
import 'package:e_commerce/presentation/setting/widgets/order_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class OrderDetailsPage extends StatelessWidget {
  final OrderEntity order;

  const OrderDetailsPage({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text("${context.get('order.order')} #${order.code}", style: AppTextStyles.font18Bold()),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildOrderStatus(context),
            verticalSpace(30),
            _buildOrderItems(context),
            verticalSpace(30),
            _buildShippingDetails(context),
            verticalSpace(30),
            _buildOrderSummary(context),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderStatus(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text( context.get('order.order_status'), style: AppTextStyles.font18Bold()),
        verticalSpace(16),
        ...List.generate(order.orderStatus.length, (index) {
          final status = order.orderStatus[index];
          final isLast = index == order.orderStatus.length - 1;

          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    height: 24.h,
                    width: 24.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: status.done
                          ? AppColors.primaryDark
                          : Colors.grey.shade300,
                      border: Border.all(
                        color: status.done
                            ? AppColors.primaryDark
                            : Colors.grey.shade400,
                        width: 2.w,
                      ),
                    ),
                    child: status.done
                        ? Icon(Icons.check, color: Colors.white, size: 14.sp)
                        : null,
                  ),
                  if (!isLast)
                    Container(
                      height: 40.h,
                      width: 2.w,
                      color: status.done
                          ? AppColors.primaryDark
                          : Colors.grey.shade300,
                    ),
                ],
              ),
              horizontalSpace(12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      status.title,
                      style: AppTextStyles.font16SemiBold(
                        color: status.done
                            ? AppColors.primaryDark
                            : Colors.grey.shade600,
                      ),
                    ),
                    verticalSpace(4),
                    Text(
                      _formatDate(status.createDate),
                      style: AppTextStyles.font14Regular(
                        color: Colors.grey.shade500,
                      ),
                    ),
                    if (!isLast) verticalSpace(16),
                  ],
                ),
              ),
            ],
          );
        }),
      ],
    );
  }

  Widget _buildOrderItems(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(context.get('order.items'), style: AppTextStyles.font18Bold()),
            TextButton(
              onPressed: () {
                context.pushNamed(Routes.orderItemsPage, extra: order.products);
              },
              child: Text(
                "${context.get('home.see_all')} (${order.products.length})",
                style: AppTextStyles.font14Medium(color: AppColors.primaryDark),
              ),
            ),
          ],
        ),
        verticalSpace(16),
        ...List.generate(
          order.products.length > 2 ? 2 : order.products.length,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: OrderItemCard(product: order.products[index]),
          )
        ),
        if (order.products.length > 2) ...[
          verticalSpace(8),
          Center(
            child: Text(
              "+${order.products.length - 2} ${context.get('order.more_items')}",
              style: AppTextStyles.font14Medium(color: Colors.grey.shade600),
            ),
          ),
        ],
      ],
    );
  }

 

  Widget _buildShippingDetails(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(context.get('order.shipping_details'), style: AppTextStyles.font18Bold()),
        verticalSpace(16),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(16.sp),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: Colors.grey.shade200, width: 1.w),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: 20.sp,
                    color: AppColors.primaryDark,
                  ),
                  horizontalSpace(8),
                  Text(
                    context.get('order.delivery_address'),
                    style: AppTextStyles.font14Medium(),
                  ),
                ],
              ),
              verticalSpace(8),
              Text(
                order.shippingAddress,
                style: AppTextStyles.font14Regular(color: Colors.grey.shade700),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildOrderSummary(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(context.get('order.order_summary'), style: AppTextStyles.font18Bold()),
        verticalSpace(16),
        Container(
          padding: EdgeInsets.all(16.sp),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: Colors.grey.shade200, width: 1.w),
          ),
          child: Column(
            children: [
              // _buildSummaryRow("Subtotal", order.totalPrice),
              // _buildSummaryRow("Shipping", order.),
              // _buildSummaryRow("Tax", order.totalPrice),
              // Divider(height: 24.h, color: Colors.grey.shade300),
              _buildSummaryRow(context.get('order.total'), order.totalPrice, isTotal: true),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSummaryRow(String label, double amount, {bool isTotal = false}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: isTotal
                ? AppTextStyles.font16SemiBold()
                : AppTextStyles.font14Regular(color: Colors.grey.shade600),
          ),
          Text(
            "\$${amount.toStringAsFixed(2)}",
            style: isTotal
                ? AppTextStyles.font18Bold(color: AppColors.primaryDark)
                : AppTextStyles.font14Medium(),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return "${date.day}/${date.month}/${date.year}";
  }
}
