import 'package:e_commerce/core/configs/theme/app_colors.dart';
import 'package:e_commerce/core/configs/theme/styles.dart';
import 'package:e_commerce/core/helper/spacing/spacing.dart';
import 'package:e_commerce/presentation/auth/bloc/cubit/age_selection_cubit.dart';
import 'package:e_commerce/presentation/auth/bloc/cubit/cubit/ages_display_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class Ages extends StatelessWidget {
  const Ages({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1.sh / 2.5,
      child: BlocBuilder<AgesDisplayCubit, AgesDisplayState>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (msg) => Center(child: Text(msg)),
            loaded: (data) => _ages(data),
            orElse: () => Container(),
          );
        },
      ),
    );
  }

  Widget _ages(data) {
    return ListView.separated(
      padding: EdgeInsets.all(16.sp),
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          context.pop();  
          context.read<AgeSelectionCubit>().selectAge(
            data[index].data()['value'],
          );
        },
        child: Center(
          child: Text(
            data[index].data()['value'],
            style: AppTextStyles.font18Regular(color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
        ),
      ),
      separatorBuilder: (context, index) => verticalSpace(26),
      itemCount: data.length,
    );
  }
}
