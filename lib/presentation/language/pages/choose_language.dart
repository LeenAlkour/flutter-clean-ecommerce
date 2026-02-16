import 'package:e_commerce/common/widgets/app_bar/custom_app_bar.dart';
import 'package:e_commerce/core/extensions/localization_extension.dart';
import 'package:e_commerce/presentation/language/cubit/language_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChooseLanguagePage extends StatelessWidget {
  ChooseLanguagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Text(context.get('settings.language'))),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: _buildLanguageList(context),
      ),
    );
  }

  Widget _buildLanguageList(BuildContext context) {
    final languageCubit = context.watch<LanguageCubit>();

    final languages = [
      {'code': 'en', 'name': 'English', 'nativeName': 'الانكليزية'},
      {'code': 'ar', 'name': 'Arabic', 'nativeName': 'العربية'},
    ];

    return Column(
      children: languages.map((lang) {
        final isSelected = languageCubit.currentLanguageCode == lang['code'];
        return _buildLanguageItem(
          context: context,
          name: lang['name']!,
          nativeName: lang['nativeName']!,
          code: lang['code']!,
          isSelected: isSelected,
          onTap: () => _changeLanguage(context, lang['code']!),
        );
      }).toList(),
    );
  }

  Widget _buildLanguageItem({
    required BuildContext context,
    required String name,
    required String nativeName,
    required String code,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    nativeName,
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),
            if (isSelected)
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.check, color: Colors.green, size: 20),
              ),
          ],
        ),
      ),
    );
  }

  void _changeLanguage(BuildContext context, String code) {
    context.read<LanguageCubit>().changeLanguage(code);
    Navigator.pop(context);
  }
}
