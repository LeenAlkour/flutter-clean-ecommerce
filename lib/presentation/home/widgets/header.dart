import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/extensions/localization_extension.dart';
import 'package:e_commerce/core/routing/routes.dart';
import 'package:e_commerce/domain/auth/entity/user_entity.dart';
import 'package:e_commerce/presentation/home/bloc/cubit/user_info_display_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserInfoDisplayCubit()..displayUserInfo(),
      child: BlocBuilder<UserInfoDisplayCubit, UserInfoDisplayState>(
        builder: (context, state) {
          return state.maybeWhen(
            loaded: (userInfo) {
              return Padding(
                padding: EdgeInsets.all(16.0.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _profileImage(userInfo, context),
                    _gender(userInfo, context),
                    _card(context),
                  ],
                ),
              );
            },
            loading: () => Center(child: CircularProgressIndicator()),
            error: (msg) => Text(msg),
            orElse: () => SizedBox.shrink(),
          );
        },
      ),
    );
  }

  Widget _profileImage(UserEntity user, BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(Routes.settingsPage);
      },
      child: ClipOval(
        child: CachedNetworkImage(
          imageUrl: user.image,
          width: 40.w,
          height: 40.h,
          fit: BoxFit.cover,
          placeholder: (context, url) =>
              const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) =>
              const Icon(Icons.person, size: 40),
        ),
      ),
    );
  }

  Widget _gender(UserEntity user, BuildContext context) {
    return Container(
      height: 40.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(100.r),
      ),
      child: Center(child: Text(user.gender == 1 ? context.get('auth.men') : context.get('auth.women'))),
    );
  }

  Widget _card(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(Routes.cartPage);
      },
      child: Container(
        height: 40.h,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          shape: BoxShape.circle,
        ),

        child: Icon(Icons.card_travel_outlined),
      ),
    );
  }
}
