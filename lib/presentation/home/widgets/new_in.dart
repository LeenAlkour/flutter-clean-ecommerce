import 'package:e_commerce/common/widgets/product_card.dart';
import 'package:e_commerce/core/configs/theme/styles.dart';
import 'package:e_commerce/core/extensions/localization_extension.dart';
import 'package:e_commerce/core/helper/spacing/spacing.dart';
import 'package:e_commerce/presentation/home/bloc/cubit/cubit/new_in_display_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocProvider, BlocBuilder;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewIn extends StatelessWidget {
  const NewIn({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewInDisplayCubit()..displayNewInProducts(),
      child: BlocBuilder<NewInDisplayCubit, NewInDisplayState>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const Center(child: CircularProgressIndicator()),
            orElse: () => const SizedBox(),
            loaded: (products) =>products.isNotEmpty? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [_newIn(context), verticalSpace(20), _products(products)],
            ):Container(),
            error: (msg) {
              return Center(child: Text(msg));
            },
          );
        },
      ),
    );
  }

  Widget _newIn(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
      child: Text(context.get('home.new_products'), style: AppTextStyles.font16Bold()),
    );
  }

  Widget _products(List<dynamic> products) {
    return SizedBox(
      height: 300.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 16.0.h),
        itemBuilder: (context, index) {
          return ProductCard(product: products[index]);
        },
        separatorBuilder: (context, index) {
          return horizontalSpace(16);
        },
        itemCount: products.length,
      ),
    );
  }
}
