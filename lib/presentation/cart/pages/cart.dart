import 'package:e_commerce/common/widgets/app_bar/custom_app_bar.dart';
import 'package:e_commerce/core/configs/assets/app_vectors.dart';
import 'package:e_commerce/core/configs/theme/styles.dart';
import 'package:e_commerce/core/extensions/localization_extension.dart';
import 'package:e_commerce/core/helper/spacing/spacing.dart';
import 'package:e_commerce/domain/order/entities/product_ordered.dart';
import 'package:e_commerce/presentation/cart/bloc/cubit/cart_product_display_cubit.dart';
import 'package:e_commerce/presentation/cart/widgets/check_out.dart';
import 'package:e_commerce/presentation/cart/widgets/product_ordered_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Text(context.get('cart.cart'))),
      body: BlocProvider(
        create: (context) => CartProductDisplayCubit()..displayCartProduct(),
        child: BlocBuilder<CartProductDisplayCubit, CartProductDisplayState>(
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () => Container(),
              loaded: (product) {
                return product.isEmpty
                    ? _cartIsImpty(context)
                    : Stack( 
                        children: [
                          _products(product),
                          Align(
                            alignment: AlignmentGeometry.bottomCenter,
                            child: CheckOut(products: product),
                          ),
                        ],
                      );
              },
              error: (msg) => Center(child: Text(msg)),
              loading: () => Center(child: CircularProgressIndicator()),
            );
          },
        ),
      ),
    );
  }

  Widget _products(List<ProductOrderedEntity> products) {
    return ListView.separated(
      padding: EdgeInsets.all(16.sp),
      itemBuilder: (context, index) {
        return ProductOrderedCard(product: products[index]);
      },
      separatorBuilder: (context, index) => verticalSpace(10),
      itemCount: products.length,
    );
  }

  Widget _cartIsImpty(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(AppVectors.appLogo),
        verticalSpace(20),
        Center(
          child: Text(
            context.get('cart.empty_cart'),
            textAlign: TextAlign.center,
            style: AppTextStyles.font18Regular(),
          ),
        ),
      ],
    );
  }
}
