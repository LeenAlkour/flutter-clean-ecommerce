import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final Widget? actions;
  final double? hight;
  final Color? backgroundColor;
  final bool hideBackButton;
  const CustomAppBar({
    super.key,
    this.hight=50,
    this.title,
    this.actions,
    this.backgroundColor,
    this.hideBackButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title ?? Text(""),
      actions: actions != null ? [actions!] : [],
      backgroundColor: backgroundColor ?? Colors.transparent,
      centerTitle: true,
      elevation: 0,
      leading: hideBackButton
          ? null
          : IconButton(
              icon: Container(
                height: hight?.h,
                width: 50.w,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.arrow_back_ios_new,
                  size: 20.sp,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
              onPressed: () => context.pop(),
            ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
