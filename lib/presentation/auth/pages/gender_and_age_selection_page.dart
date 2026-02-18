import 'package:e_commerce/common/bloc/button/cubit/button_state_cubit.dart';
import 'package:e_commerce/common/widgets/dialogs.dart';
import 'package:e_commerce/common/widgets/button/custom_reactive_button.dart';
import 'package:e_commerce/core/extensions/localization_extension.dart';
import 'package:e_commerce/core/routing/routes.dart';
import 'package:e_commerce/data/auth/models/user_creation-req.dart';
import 'package:e_commerce/domain/auth/usecases/signup.dart';
import 'package:e_commerce/presentation/auth/ages.dart';
import 'package:e_commerce/common/widgets/app_bar/custom_app_bar.dart';
import 'package:e_commerce/core/configs/theme/styles.dart';
import 'package:e_commerce/common/widgets/bottomsheet/app_bottomsheet.dart';
import 'package:e_commerce/common/widgets/spacing/spacing.dart';
import 'package:e_commerce/presentation/auth/bloc/cubit/age_selection_cubit.dart';
import 'package:e_commerce/presentation/auth/bloc/cubit/cubit/ages_display_cubit.dart';
import 'package:e_commerce/presentation/auth/bloc/cubit/gender_selection_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class GenderAndAgeSelectionPage extends StatelessWidget {
  final UserCreationReq userCreationReq;
  const GenderAndAgeSelectionPage({super.key, required this.userCreationReq});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => GenderSelectionCubit()),
          BlocProvider(create: (context) => AgeSelectionCubit()),
          BlocProvider(create: (context) => AgesDisplayCubit()),
          BlocProvider(create: (context) => ButtonStateCubit()),
        ],
        child: BlocListener<ButtonStateCubit, ButtonState>(
          listener: (context, state) {
            state.whenOrNull(
              error: (errorMessage) {
                Dialogs.showErrorSnackBar(context, errorMessage);
              },
              success: () => context.go(Routes.homePage),
            );
          },
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0.w,
                  vertical: 40.0.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _tellUs(context),
                    verticalSpace(30),
                    _genders(context),
                    verticalSpace(30),
                    _ageSelection(context),
                  ],
                ),
              ),
              Spacer(),
              _finitshButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tellUs(BuildContext context) {
    return Text(
      context.get('auth.tell_us_about_yourself'),
      style: AppTextStyles.font24SemiBold(color:Theme.of(context).colorScheme.onSecondary),
    );
  }

  Widget _genders(BuildContext context) {
    return BlocBuilder<GenderSelectionCubit, int>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _genderTile(context, 1, context.get('auth.men')),
            horizontalSpace(20),
            _genderTile(context, 2, context.get('auth.women')),
          ],
        );
      },
    );
  }

  Expanded _genderTile(BuildContext context, int genderIndex, String gender) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          context.read<GenderSelectionCubit>().selectGender(genderIndex);
        },
        child: Container(
          height: 60.h,
          decoration: BoxDecoration(
            color: context.read<GenderSelectionCubit>().state == genderIndex
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(30.r),
          ),
          child: Center(
            child: Text(
              gender,
              style: AppTextStyles.font16SemiBold(
                color: context.read<GenderSelectionCubit>().state == genderIndex
                    ? Theme.of(context).colorScheme.onPrimary
                    : Theme.of(context).colorScheme.onSecondary,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _ageSelection(BuildContext context) {
    return BlocBuilder<AgeSelectionCubit, String>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            AppBottomsheet.display(
              context,
              MultiBlocProvider(
                providers: [
                  BlocProvider.value(value: context.read<AgeSelectionCubit>()),
                  BlocProvider.value(
                    value: context.read<AgesDisplayCubit>()..displayAges(),
                  ),
                ],
                child: Ages(),
              ),
            );
          },
          child: Container(
            height: 60.h,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(30.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  state,
                  style: AppTextStyles.font16SemiBold(
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_down,
                  color:Theme.of(context).colorScheme.onSecondary,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _finitshButton(BuildContext context) {
    return Container(
      height: 100.h,
      color: Theme.of(context).colorScheme.secondary,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Builder(
        builder: (context) {
          return Center(
            child: CustomReactiveButton(
              onPressed: () {
                userCreationReq.gender = context
                    .read<GenderSelectionCubit>()
                    .selectedGender;
                userCreationReq.age = context
                    .read<AgeSelectionCubit>()
                    .selectedAge;
                context.read<ButtonStateCubit>().execute(
                  usecase: SignUpUseCase(),
                  params: userCreationReq,
                );
              },
              title: context.get('common.finish'),
            ),
          );
        },
      ),
    );
  }
}
