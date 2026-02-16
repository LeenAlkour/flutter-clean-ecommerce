import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  late Map<String, dynamic> _localizedValues;

  Future<bool> load(Locale locale) async {
    try {
      String jsonContent = await rootBundle.loadString(
        'assets/i18n/${locale.languageCode}.json',
      );
      _localizedValues = json.decode(jsonContent);
      return true;
    } catch (e) {
      print('Error loading language: $e');
      return false;
    }
  }

  String translate(String key) {
    List<String> keys = key.split('.');
    dynamic value = _localizedValues;

    for (String k in keys) {
      if (value is Map) {
        value = value[k];
      } else {
        return key;
      }
    }

    return value?.toString() ?? key;
  }

  String get(String key) => translate(key);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ar'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations localizations = AppLocalizations();
    await localizations.load(locale);
    return localizations;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
