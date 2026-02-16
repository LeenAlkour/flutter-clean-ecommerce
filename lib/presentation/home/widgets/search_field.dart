import 'package:e_commerce/core/configs/assets/app_vectors.dart';
import 'package:e_commerce/core/extensions/localization_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50.h,
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(50.r),
        border: Border.all(color: Colors.grey.shade300, width: 1.w),
      ),
      child: Align(alignment: Alignment.centerLeft, child: Row(children: [
        SvgPicture.asset(AppVectors.appLogo),
        Text(context.get('home.search')),
      ],)),
    );
  }
}
