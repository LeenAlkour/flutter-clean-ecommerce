import 'package:flutter/material.dart';
import '../localization/app_localizations.dart';

extension LocalizationExtension on BuildContext {
  AppLocalizations get tr => AppLocalizations.of(this);

  String get(String key) => tr.translate(key);
}
