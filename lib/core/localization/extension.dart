import 'package:e_commerce/core/localization/app_localizations.dart';
import 'package:flutter/material.dart';

extension LocalizationExtension on BuildContext {
  String get(String key) => AppLocalizations.of(this).translate(key);
}
