
import 'package:e_commerce/common/bloc/button/cubit/button_state_cubit.dart';
import 'package:e_commerce/common/widgets/dialogs.dart';
import 'package:e_commerce/common/helper/product/product_price.dart';
import 'package:e_commerce/common/widgets/button/custom_reactive_button.dart';
import 'package:e_commerce/core/configs/theme/app_colors.dart';
import 'package:e_commerce/core/configs/theme/styles.dart';
import 'package:e_commerce/core/extensions/localization_extension.dart';
import 'package:e_commerce/core/routing/routes.dart';
import 'package:e_commerce/data/order/models/add_to_cart_req.dart';
import 'package:e_commerce/domain/order/usecase/add_to_cart.dart';
import 'package:e_commerce/domain/product/entity/product_entity.dart';
import 'package:e_commerce/presentation/product_detail/bloc/cubit/product_color_selection_cubit.dart';
import 'package:e_commerce/presentation/product_detail/bloc/cubit/product_quantity_cubit.dart';
import 'package:e_commerce/presentation/product_detail/bloc/cubit/product_size_selection_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AddToBag extends StatelessWidget {
  final ProductEntity product;
  const AddToBag({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ButtonStateCubit, ButtonState>(
      listener: (context, state) {
        state.whenOrNull(
          error: (error) {
            Dialogs.showErrorSnackBar(context, error);
          },
          success: () {
            context.push(Routes.cartPage);
          },
        );
      },
      child: Padding(
        padding:  EdgeInsets.all(16.0.sp),
        child: CustomReactiveButton(
          
          onPressed: () {
            context.read<ButtonStateCubit>().execute(
              usecase: AddToCartUseCase(),
              params: AddToCartReqModel(
                createdDate: DateTime.now().toString(),
                productId: product.productId,
                productTitle: product.title,
                productColor: product
                    .colors[context.read<ProductColorSelectionCubit>().state]
                    .title,
                productSize: product
                    .sizes[context.read<ProductSizeSelectionCubit>().state],
                productQuantity: context.read<ProductQuantityCubit>().state,
                productPrice: product.price.toDouble(),
                totalPrice:
                    ProductPriceHelper.providCurrentPrice(product) *
                    context.read<ProductQuantityCubit>().state,
                productImage:
                 product.images[0],
              ),
            );
          },
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BlocBuilder<ProductQuantityCubit, int>(
                builder: (context, state) {
                  var price =
                      ProductPriceHelper.providCurrentPrice(product) * state;
                  return Text(
                    "\$${price.toStringAsFixed(2)}",
                    style: AppTextStyles.font16Bold(
                      color: AppColors.bgLightColor,
                    ),
                  );
                },
              ),
              Text( context.get('product.add_to_bag'),
                style: AppTextStyles.font14Medium(
                  color: AppColors.secondaryLight,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
