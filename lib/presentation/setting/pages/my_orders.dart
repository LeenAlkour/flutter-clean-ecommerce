import 'package:e_commerce/common/widgets/app_bar/custom_app_bar.dart';
import 'package:e_commerce/core/configs/theme/app_colors.dart';
import 'package:e_commerce/core/configs/theme/styles.dart';
import 'package:e_commerce/core/extensions/localization_extension.dart';
import 'package:e_commerce/core/helper/spacing/spacing.dart';
import 'package:e_commerce/core/routing/routes.dart';
import 'package:e_commerce/domain/order/entities/order.dart';
import 'package:e_commerce/domain/order/entities/order_status.dart';
import 'package:e_commerce/presentation/setting/bloc/cubit/order_display_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class MyOrdersPage extends StatelessWidget {
  const MyOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(context.get('order.my_orders'), style: AppTextStyles.font24Bold()),
      ),
      body: BlocProvider(
        create: (context) => OrderDisplayCubit()..displayOrders(),
        child: BlocBuilder<OrderDisplayCubit, OrderDisplayState>(
          builder: (context, state) {
            return state.maybeWhen(
              loading: () => const Center(child: CircularProgressIndicator()),
              loaded: (orders) => _buildOrdersList(context, orders),
              error: (message) => _buildErrorState(message,context),
              orElse: () => _buildEmptyState(context),
            );
          },
        ),
      ),
    );
  }

  Widget _buildOrdersList(BuildContext context, List<OrderEntity> orders) {
    if (orders.isEmpty) {
      return _buildEmptyState(context);
    }

    return ListView.builder(
      padding: EdgeInsets.all(16.sp),
      itemCount: orders.length,
      itemBuilder: (context, index) {
        final order = orders[index];
        return _buildOrderCard(context, order);
      },
    );
  }

  Widget _buildOrderCard(BuildContext context, OrderEntity order) {
    final statusColor = _getStatusColor(order.orderStatus.last);
    final date = DateFormat('MMM dd, yyyy').format(order.createDate);

    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey.shade200, width: 1.w),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            context.pushNamed(Routes.orderDetailsPage, extra: order);
          },
          borderRadius: BorderRadius.circular(12.r),
          child: Padding(
            padding: EdgeInsets.all(16.sp),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8.sp),
                          decoration: BoxDecoration(
                            color: AppColors.primaryDark.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Icon(
                            Icons.receipt_rounded,
                            color: AppColors.primaryDark,
                            size: 20.sp,
                          ),
                        ),
                        horizontalSpace(12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${context.get('order.order')} #${order.code}',
                              style: AppTextStyles.font16SemiBold(),
                            ),
                            Text(
                              date,
                              style: AppTextStyles.font18Regular(
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: statusColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Text(
                        _getStatusText(order.orderStatus.last,context),
                        style: AppTextStyles.font14Medium(color: statusColor),
                      ),
                    ),
                  ],
                ),
                verticalSpace(12),
                Divider(height: 1.h, color: Colors.grey.shade200),
                verticalSpace(12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.inventory_2_outlined,
                          size: 16.sp,
                          color: Colors.grey.shade600,
                        ),
                        horizontalSpace(4),
                        Text(
                          '${order.products.length} ${order.products.length == 1 ? context.get('order.item') : context.get('order.items')}',
                          style: AppTextStyles.font14Regular(
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          '${context.get('order.total')}: ',
                          style: AppTextStyles.font14Regular(
                            color: Colors.grey.shade600,
                          ),
                        ),
                        Text(
                          '\$${order.totalPrice.toStringAsFixed(2)}',
                          style: AppTextStyles.font16SemiBold(
                            color: AppColors.primaryDark,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_bag_outlined,
            size: 80.sp,
            color: Colors.grey.shade300,
          ),
          verticalSpace(16),
          Text(
            context.get('order.no_orders'),
            style: AppTextStyles.font18Bold(color: Colors.grey.shade700),
          ),
         
          verticalSpace(24),
          ElevatedButton(
            onPressed: () {
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryDark,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            child: Text(
              context.get('order.start_shopping'),
              style: AppTextStyles.font16SemiBold(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(String message,BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 80.sp, color: Colors.red.shade200),
          
          Text(
            message,
            style: AppTextStyles.font14Regular(color: Colors.grey.shade600),
            textAlign: TextAlign.center,
          ),
          verticalSpace(24),
          ElevatedButton(
            onPressed: () {
              context.read<OrderDisplayCubit>().displayOrders();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryDark,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            child: Text(context.get('common.try_again'), style: AppTextStyles.font16SemiBold()),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(OrderStatusEntity status) {
    if (status.done) {
      return Colors.green;
    } else if (status.title.toLowerCase().contains('shipped')) {
      return Colors.blue;
    } else if (status.title.toLowerCase().contains('processing')) {
      return Colors.orange;
    } else {
      return Colors.grey;
    }
  }

  String _getStatusText(OrderStatusEntity status, BuildContext context) {
    if (status.done) {
      return context.get('order.delivered');
    }
    return status.title;
  }
}
