import 'package:e_commerce/common/widgets/product_card.dart';
import 'package:e_commerce/core/configs/theme/styles.dart';
import 'package:e_commerce/core/extensions/localization_extension.dart';
import 'package:e_commerce/common/widgets/spacing/spacing.dart';
import 'package:e_commerce/presentation/home/bloc/cubit/top_selling_display_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocProvider, BlocBuilder;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopSelling extends StatelessWidget {
  const TopSelling({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TopSellingDisplayCubit()..displayTopSelligProducts(),
      child: BlocBuilder<TopSellingDisplayCubit, TopSellingDisplayState>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const Center(child: CircularProgressIndicator()),
            orElse: () => const SizedBox(),
            loaded: (products) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [_topSelling(context), verticalSpace(20), _products(products)],
            ),
            error: (msg) {
              return Center(child: Text(msg));
            },
          );
        },
      ),
    );
  }

  Widget _topSelling(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
      child: Text(context.get('home.top_selling'), style: AppTextStyles.font16Bold()),
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
