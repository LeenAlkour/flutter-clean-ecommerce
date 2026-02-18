import 'package:e_commerce/common/bloc/button/cubit/button_state_cubit.dart';
import 'package:e_commerce/common/widgets/dialogs.dart';
import 'package:e_commerce/common/helper/cart/cart.dart';
import 'package:e_commerce/common/widgets/button/custom_reactive_button.dart';
import 'package:e_commerce/common/widgets/app_bar/custom_app_bar.dart';
import 'package:e_commerce/core/configs/theme/styles.dart';
import 'package:e_commerce/core/extensions/localization_extension.dart';
import 'package:e_commerce/core/routing/routes.dart';
import 'package:e_commerce/data/order/models/order_registration_req.dart';
import 'package:e_commerce/data/order/models/order_status.dart';
import 'package:e_commerce/data/order/models/product_ordered.dart';
import 'package:e_commerce/domain/order/entities/product_ordered.dart';
import 'package:e_commerce/domain/order/usecase/order_registration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:random_string/random_string.dart';

class CheckOutPage extends StatelessWidget {
  final List<ProductOrderedEntity> products;
  CheckOutPage({super.key, required this.products});
  final TextEditingController _addressCon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Text(context.get('cart.check_out'))),
      body: BlocProvider(
        create: (context) => ButtonStateCubit(),
        child: BlocListener<ButtonStateCubit, ButtonState>(
          listener: (context, state) {
            state.whenOrNull(
              error: (error) {
                Dialogs.showErrorSnackBar(context, error);
              },
              success: () {
                Dialogs.showSuccessSnackBar(
                  context,
                  context.get('cart.order_placed_successfully'),
                );
                context.go(Routes.homePage);
              },
            );
          },
          child: Padding(
            padding: EdgeInsets.all(16.sp),
            child: Builder(
              builder: (context) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _addressField(context),

                    CustomReactiveButton(
                      onPressed: () {
                        context.read<ButtonStateCubit>().execute(
                          usecase: OrderRegistrationUseCase(),
                          params: OrderRegistrationReqModel(
                            code: randomString(6),
                            orderStatus: [
                              OrderStatusModel(
                                title: "delevered",
                                createDate: DateTime.now(),
                                done: false,
                              ),
                            ],
                            shippingAddress: _addressCon.text,

                            products: products
                                .map((e) => e.fromEntity())
                                .toList(),
                            createDate: DateTime.now(),
                            itemCount: products.length,
                            totalPrice: CartHelper.calculateCartSubtotal(
                              products,
                            ),
                          ),
                        );
                      },
                      content: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '\$${CartHelper.calculateCartSubtotal(products)}',
                              style: AppTextStyles.font16Bold(),
                            ),
                            Text(
                              context.get('common.finish'),
                              style: AppTextStyles.font16Bold(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _addressField(BuildContext context) {
    return TextField(
      minLines: 2,
      maxLines: 4,
      controller: _addressCon,
      decoration: InputDecoration(hintText: context.get('order.delivery_address')),
    );
  }
}
