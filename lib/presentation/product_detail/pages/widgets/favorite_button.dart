import 'package:e_commerce/domain/product/entity/product_entity.dart';
import 'package:e_commerce/presentation/product_detail/bloc/cubit/favorite_button_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoriteButton extends StatelessWidget {
  final ProductEntity product;
  const FavoriteButton({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.read<FavoriteIconCubit>().onTap(product);
      },
      icon: Container(
        height: 40.h,
        width: 40.w,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          shape: BoxShape.circle,
        ),
        child: BlocBuilder<FavoriteIconCubit, bool>(
          builder: (context, state) {
            return Icon(
              state ? Icons.favorite : Icons.favorite_outline,
              color: Theme.of(context).colorScheme.onSecondary,
              size: 15.sp,
            );
          },
        ),
      ),
    );
  }
}
