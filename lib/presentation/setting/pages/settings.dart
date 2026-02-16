import 'package:e_commerce/common/widgets/app_bar/custom_app_bar.dart';
import 'package:e_commerce/core/configs/theme/app_colors.dart';
import 'package:e_commerce/core/configs/theme/styles.dart';
import 'package:e_commerce/core/extensions/localization_extension.dart';
import 'package:e_commerce/core/helper/spacing/spacing.dart';
import 'package:e_commerce/core/routing/routes.dart';
import 'package:e_commerce/presentation/language/cubit/language_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          context.get('settings.settings'),
          style: AppTextStyles.font24Bold(),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionHeader(context.get('common.account')),
            verticalSpace(16),
            _buildMenuItem(
              context,
              icon: Icons.shopping_bag_outlined,
              title: context.get('order.my_orders'),
              subtitle: context.get('order.view_order_history'),
              route: Routes.myOrdersPage,
              color: Colors.blue,
            ),
            _buildMenuItem(
              context,
              icon: Icons.favorite_outline,
              title: context.get('settings.favorite'),
              subtitle: context.get('settings.your_saved_items'),
              route: Routes.myFavoritePage,
              color: Colors.red,
            ),
            // _buildMenuItem(
            //   context,
            //   icon: Icons.location_on_outlined,
            //   title: 'Shipping Addresses',
            //   subtitle: 'Manage your addresses',
            //   route: Routes.addressesPage,
            //   color: Colors.green,
            // ),
            // _buildMenuItem(
            //   context,
            //   icon: Icons.payment_outlined,
            //   title: 'Payment Methods',
            //   subtitle: 'Manage your cards',
            //   route: Routes.paymentMethodsPage,
            //   color: Colors.purple,
            // ),
            
            // verticalSpace(30),
            // _buildSectionHeader('Preferences'),
            // verticalSpace(16),
            // _buildMenuItem(
            //   context,
            //   icon: Icons.notifications_outlined,
            //   title: 'Notifications',
            //   subtitle: 'Manage notification settings',
            //   route: Routes.notificationsPage,
            //   color: Colors.orange,
            //   showSwitch: true,
            // ),
            _buildMenuItem(
              context,
              icon: Icons.language_outlined,
              title: context.get('settings.language'),
              subtitle: context.get(
                context.watch<LanguageCubit>().currentLanguageCode,
              ),
              route: Routes.chooseLanguagePage,
              color: Colors.teal,
            ),
            // _buildMenuItem(
            //   context,
            //   icon: Icons.dark_mode_outlined,
            //   title: 'Dark Mode',
            //   subtitle: 'Toggle theme',
            //   route: Routes.themePage,
            //   color: Colors.indigo,
            //   showSwitch: true,
            // ),
            
            // verticalSpace(30),
            // _buildSectionHeader('Support'),
            // verticalSpace(16),
            // _buildMenuItem(
            //   context,
            //   icon: Icons.help_outline,
            //   title: 'Help Center',
            //   subtitle: 'FAQs and support',
            //   route: Routes.helpPage,
            //   color: Colors.cyan,
            // ),
            // _buildMenuItem(
            //   context,
            //   icon: Icons.privacy_tip_outlined,
            //   title: 'Privacy Policy',
            //   subtitle: 'Read our privacy policy',
            //   route: Routes.privacyPage,
            //   color: Colors.brown,
            // ),
            // _buildMenuItem(
            //   context,
            //   icon: Icons.info_outline,
            //   title: 'About Us',
            //   subtitle: 'Version 1.0.0',
            //   route: Routes.aboutPage,
            //   color: Colors.grey,
            // ),
            
            // verticalSpace(30),
            // _buildLogoutButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: EdgeInsets.only(left: 4.w),
      child: Text(
        title,
        style: AppTextStyles.font14Medium(
          color: Colors.grey.shade600,
        ),
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required String route,
    required Color color,
    bool showSwitch = false,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.h),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: Colors.grey.shade200,
          width: 1.w,
        ),
      ),
      child: ListTile(
        onTap: showSwitch ? null : () => context.pushNamed(route),
        leading: Container(
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Icon(
            icon,
            color: color,
            size: 20.sp,
          ),
        ),
        title: Text(
          title,
          style: AppTextStyles.font16SemiBold(),
        ),
        subtitle: Text(
          subtitle,
          style: AppTextStyles.font14Regular(
            color: Colors.grey.shade600,
          ),
        ),
        trailing: showSwitch
            ? Switch(
                value: false,
                onChanged: (value) {},
                activeColor: AppColors.primaryDark,
              )
            : Icon(
                Icons.arrow_forward_ios,
                size: 16.sp,
                color: Colors.grey.shade400,
              ),
      ),
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 20.h),
      child: ElevatedButton(
        onPressed: () {
          _showLogoutDialog(context);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red.shade50,
          foregroundColor: Colors.red,
          elevation: 0,
          padding: EdgeInsets.symmetric(vertical: 16.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
            side: BorderSide(color: Colors.red.shade200, width: 1.w),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.logout, size: 20.sp),
            horizontalSpace(8),
            Text(
              'Log Out',
              style: AppTextStyles.font16SemiBold(),
            ),
          ],
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Log Out',
            style: AppTextStyles.font18Bold(),
          ),
          content: Text(
            'Are you sure you want to log out?',
            style: AppTextStyles.font16Regular(),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Cancel',
                style: AppTextStyles.font16Regular(
                  color: Colors.grey.shade600,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              child: Text(
                'Log Out',
                style: AppTextStyles.font16SemiBold(),
              ),
            ),
          ],
        );
      },
    );
  }
}