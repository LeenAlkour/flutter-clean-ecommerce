import 'package:e_commerce/common/bloc/button/cubit/button_state_cubit.dart';
import 'package:e_commerce/common/widgets/app_bar/custom_app_bar.dart';
import 'package:e_commerce/common/widgets/spacing/spacing.dart';
import 'package:e_commerce/domain/product/entity/product_entity.dart';
import 'package:e_commerce/presentation/product_detail/bloc/cubit/favorite_button_cubit.dart'
    show FavoriteIconCubit;
import 'package:e_commerce/presentation/product_detail/bloc/cubit/product_color_selection_cubit.dart';
import 'package:e_commerce/presentation/product_detail/bloc/cubit/product_size_selection_cubit.dart';
import 'package:e_commerce/presentation/product_detail/bloc/cubit/product_quantity_cubit.dart';
import 'package:e_commerce/presentation/product_detail/pages/widgets/add_to_bag.dart';
import 'package:e_commerce/presentation/product_detail/pages/widgets/favorite_button.dart';
import 'package:e_commerce/presentation/product_detail/pages/widgets/product_images.dart';
import 'package:e_commerce/presentation/product_detail/pages/widgets/product_price.dart';
import 'package:e_commerce/presentation/product_detail/pages/widgets/product_quantity.dart';
import 'package:e_commerce/presentation/product_detail/pages/widgets/product_title.dart';
import 'package:e_commerce/presentation/product_detail/pages/widgets/selected_color.dart';
import 'package:e_commerce/presentation/product_detail/pages/widgets/selected_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetail extends StatelessWidget {
  final ProductEntity product;
  ProductDetail({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ProductQuantityCubit()),
        BlocProvider(create: (context) => ProductColorSelectionCubit()),
        BlocProvider(create: (context) => ProductSizeSelectionCubit()),
        BlocProvider(create: (context) => ButtonStateCubit()),
        BlocProvider(create: (context) => FavoriteIconCubit()..isFavorite(product.productId)),
      ],
      child: Scaffold(
        bottomNavigationBar: AddToBag(product: product),

        appBar: CustomAppBar(hideBackButton: false, actions: FavoriteButton(product:  product)),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductImages(product: product),
              verticalSpace(10),
              ProductTitle(product: product),
              verticalSpace(10),
              ProductPrice(product: product),
              verticalSpace(20),
              SelectedSize(product: product),
              verticalSpace(15),
              SelectedColor(product: product),
              verticalSpace(15),
              ProductQuantity(product: product),
            ],
          ),
        ),
      ),
    );
  }
}
