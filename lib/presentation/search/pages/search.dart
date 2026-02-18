import 'package:e_commerce/common/bloc/product/cubit/products_display_cubit.dart';
import 'package:e_commerce/common/widgets/app_bar/custom_app_bar.dart';
import 'package:e_commerce/common/widgets/product_card.dart';
import 'package:e_commerce/core/configs/assets/app_vectors.dart';
import 'package:e_commerce/core/configs/theme/styles.dart';
import 'package:e_commerce/core/extensions/localization_extension.dart';
import 'package:e_commerce/domain/product/entity/product_entity.dart';
import 'package:e_commerce/domain/product/usecase/get_products_by_title.dart';
import 'package:e_commerce/presentation/home/widgets/search_field.dart';
import 'package:e_commerce/core/di/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductsDisplayCubit(useCase: sl<GetProductsByTitleUseCase>()),
      child: Scaffold(
        appBar: CustomAppBar(),
        body: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            children: [
              Builder(
                builder: (context) {
                  return TextField(
                    onChanged: (value) {
                      if (value.isEmpty) {
                        context.read<ProductsDisplayCubit>().displayInitial();
                      } else {
                        context.read<ProductsDisplayCubit>().displayProducts(
                          param: value,
                        );
                      }
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(12.sp),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.r),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.r),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      prefixIcon: SvgPicture.asset(
                        AppVectors.appLogo,
                        height: 20.h,
                        width: 20.w,
                        fit: BoxFit.scaleDown,
                      ),
                      hintText: context.get('home.search'),
                      hintStyle: TextStyle(color: Colors.grey.shade400),
                    ),
                  );
                },
              ),
              SizedBox(height: 16.h),
              Expanded(
                child: BlocBuilder<ProductsDisplayCubit, ProductsDisplayState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                      loaded: (data) =>
                          data.isEmpty ? _notFound(context) : _products(data),
                      error: (message) => Center(
                        child: Text(
                          message,
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                      initial: () => _initialState(context),
                      orElse: () => const SizedBox.shrink(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _initialState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppVectors.appLogo,
            height: 100.h,
            width: 100.w,
            color: Colors.grey.shade300,
          ),
          SizedBox(height: 16.h),
          Text(
            context.get('home.search_for_products'),
            style: AppTextStyles.font18Regular(color: Colors.grey.shade500)
          ),
        ],
      ),
    );
  }

  Widget _notFound(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(AppVectors.appLogo, height: 120.h, width: 120.w),
          SizedBox(height: 16.h),
          Text(
            context.get('home.no_products') ,
            textAlign: TextAlign.center,
            style: AppTextStyles.font24SemiBold(),
          ),
        ],
      ),
    );
  }

  Widget _products(List<ProductEntity> products) {
    return GridView.builder(
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.6,
        crossAxisSpacing: 10.w,
        mainAxisSpacing: 10.h,
      ),
      itemBuilder: (BuildContext context, int index) {
        return ProductCard(product: products[index]);
      },
    );
  }
}
