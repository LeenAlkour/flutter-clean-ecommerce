import 'package:flutter/material.dart';

enum Language {
  english('en', 'English'),
  arabic('ar', 'العربية');

  final String code;
  final String name;

  const Language(this.code, this.name);

  Locale get locale => Locale(code);

  static Language fromCode(String code) {
    return Language.values.firstWhere(
      (lang) => lang.code == code,
      orElse: () => Language.english,
    );
  }
}
