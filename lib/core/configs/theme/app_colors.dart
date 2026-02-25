import 'package:flutter/material.dart';

class AppColors {
  
  static const Color bgLightColor = Color(0xFFFFFFFF);
  static const Color bgDarkColor = Color(0xFF1D182A);
  static const Color primaryLight = Color.fromARGB(255, 31, 139, 227); 
  static const Color primaryDark = Color(0xFF8E6CEF);
  static const Color secondaryDark = Color(0xFF342F3F);
  static const Color secondaryLight = Color(0xFFF4F4F4);


  static const Color surfaceColor = Color(0xFFFFFFFF);
  static const Color errorColor = Color(0xFFEF4444);
  static const Color warningColor = Color(0xFFF59E0B);
  static const Color successColor = Color(0xFF10B981);
  static const Color infoColor = Color(0xFF3B82F6);

  // ========== ألوان النصوص ==========
  static const Color textPrimaryColor = Color(0xFF1F2937); // Gray 900
  static const Color textSecondaryColor = Color(0xFF6B7280); // Gray 500
  static const Color textTertiaryColor = Color(0xFF9CA3AF); // Gray 400
  static const Color textHintColor = Color(0xFFD1D5DB); // Gray 300

  // ========== ألوان الحدود والفاصل ==========
  static const Color borderColor = Color(0xFFE5E7EB); // Gray 200
  static const Color dividerColor = Color(0xFFF3F4F6); // Gray 100

  
    // ========== ColorScheme للوضع الفاتح ==========
  static ColorScheme lightColorScheme = const ColorScheme.light(
    primary: primaryLight,
    onPrimary: Colors.white,
    primaryContainer: primaryLight,
    onPrimaryContainer: Colors.white,

    secondary: secondaryLight,
    onSecondary: textSecondaryColor,
    secondaryContainer: secondaryLight,
    onSecondaryContainer: textSecondaryColor,

    onTertiary: Colors.white,

    background: bgLightColor,
    onBackground: textPrimaryColor,

    surface: bgLightColor,
    onSurface: textPrimaryColor,

    error: errorColor,
    onError: Colors.white,

    brightness: Brightness.light,
  );

  // ========== ColorScheme للوضع الداكن ==========
  static ColorScheme darkColorScheme = const ColorScheme.dark(
    primary: primaryDark,
    onPrimary: Colors.white,
    primaryContainer: primaryDark,
    onPrimaryContainer: Colors.white,

    secondary: secondaryDark,
    onSecondary: textSecondaryColor,
    secondaryContainer: secondaryDark,
    onSecondaryContainer: textSecondaryColor,

    onTertiary: Colors.white,

    background: bgDarkColor,
    onBackground: textPrimaryColor,

    surface: bgDarkColor,
    onSurface: textPrimaryColor,

    error: errorColor,
    onError: Colors.white,

    brightness: Brightness.dark,
  );
}
