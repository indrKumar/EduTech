import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../utils/pref_utils.dart';

/// Helper class for managing themes and colors.
class ThemeHelper {
  // The current app theme
  final _appTheme = PrefUtils().getThemeData();

  final Map<String, PrimaryColors> _supportedCustomColor = {
    'primary': PrimaryColors()
  };

  final Map<String, ColorScheme> _supportedColorScheme = {
    'primary': ColorSchemes.primaryColorScheme
  };

  /// Changes the app theme to [_newTheme].
  void changeTheme(String _newTheme) {
    PrefUtils().setThemeData(_newTheme);
    Get.forceAppUpdate();
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors _getThemeColors() {
    if (!_supportedCustomColor.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    return _supportedCustomColor[_appTheme] ?? PrimaryColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    if (!_supportedColorScheme.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.primaryColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: colorScheme.primaryContainer.withOpacity(1),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(23.h),
              topRight: Radius.circular(22.h),
              bottomLeft: Radius.circular(23.h),
              bottomRight: Radius.circular(22.h),
            ),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: BorderSide(
            color: colorScheme.primary,
            width: 1.h,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(23.h),
              topRight: Radius.circular(22.h),
              bottomLeft: Radius.circular(23.h),
              bottomRight: Radius.circular(22.h),
            ),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),

          padding: EdgeInsets.zero,
        ),
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return colorScheme.primary;
          }
          return colorScheme.onSurface;
        }),
        visualDensity: const VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return colorScheme.primary;
          }
          return colorScheme.onSurface;
        }),
        side: const BorderSide(
          width: 1,
        ),
        visualDensity: const VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
      ),
      dividerTheme: DividerThemeData(
        thickness: 1,
        space: 1,
        color: appTheme.blueGray5002,
      ),
    );
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyLarge: TextStyle(
          color: appTheme.black900,
          fontSize: 16,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: appTheme.black900,
          fontSize: 14,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: appTheme.black900,
          fontSize: 12,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w400,
        ),
        displayLarge: TextStyle(
          color: colorScheme.primaryContainer.withOpacity(1),
          fontSize: 58,
          fontFamily: 'Palanquin',
          fontWeight: FontWeight.w600,
        ),
        displayMedium: TextStyle(
          color: appTheme.lightBlueA400,
          fontSize: 47,
          fontFamily: 'Montez',
          fontWeight: FontWeight.w400,
        ),
        displaySmall: TextStyle(
          color: appTheme.lightBlueA400,
          fontSize: 37,
          fontFamily: 'Montez',
          fontWeight: FontWeight.w400,
        ),
        headlineLarge: TextStyle(
          color: appTheme.gray90001,
          fontSize: 30,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        ),
        headlineMedium: TextStyle(
          color: appTheme.black900.withOpacity(0.8),
          fontSize: 26,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w700,
        ),
        headlineSmall: TextStyle(
          color: colorScheme.primary,
          fontSize: 24,
          fontFamily: 'Montez',
          fontWeight: FontWeight.w400,
        ),
        labelLarge: TextStyle(
          color: appTheme.black900.withOpacity(0.7),
          fontSize: 12,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w500,
        ),
        labelMedium: const TextStyle(
          color: Color(0XFF1356C5),
          fontSize: 10,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w700,
        ),
        labelSmall: const TextStyle(
          color: Color(0XFF000000),
          fontSize: 8,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w700,
        ),
        titleLarge: TextStyle(
          color: appTheme.black900,
          fontSize: 22,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w500,
        ),
        titleMedium: TextStyle(
          color: appTheme.black900,
          fontSize: 18,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w500,
        ),
        titleSmall: TextStyle(
          color: appTheme.black900,
          fontSize: 14,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w500,
        ),
      );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static const primaryColorScheme = ColorScheme.light(
    // Primary colors
    primary: Color(0XFF1356C5),
    primaryContainer: Color(0XF2FFFFFF),
    secondaryContainer: Color(0XFF4D4D4D),

    // Error colors
    errorContainer: Color(0X14FF0000),
    onError: Color(0XFF5B5B5B),

    // On colors(text colors)
    onPrimary: Color(0XFF000080),
    onPrimaryContainer: Color(0XFF033079),
    onSecondaryContainer: Color(0XFF140202),
  );
}

/// Class containing custom colors for a primary theme.
class PrimaryColors {
  // Amber
  Color get amber600 => const Color(0XFFF3AF00);

  // Black
  Color get black900 => const Color(0XFF000000);

  // Blue
  Color get blue800 => const Color(0XFF1555BE);

  Color get blue900 => const Color(0XFF05378A);

  Color get blue90001 => const Color(0XFF04378B);

  Color get blue90002 => const Color(0XFF083B90);

  Color get blue90003 => const Color(0XFF1950AB);

  Color get blue90004 => const Color(0XFF0E4BAF);

  // BlueGray
  Color get blueGray100 => const Color(0XFFCCCCCC);

  Color get blueGray10001 => const Color(0XFFD3D3D3);

  Color get blueGray10002 => const Color(0XFFCBCBCB);

  Color get blueGray10003 => const Color(0XFFD7D7D7);

  Color get blueGray10004 => const Color(0XFFD9D9D9);

  Color get blueGray40099 => const Color(0X997387A3);

  Color get blueGray4009901 => const Color(0X9975889A);

  Color get blueGray50 => const Color(0XFFECEEF4);

  Color get blueGray500 => const Color(0XFF667084);

  Color get blueGray5001 => const Color(0XFFEDEFF4);

  Color get blueGray5002 => const Color(0XFFEAECF0);

  Color get blueGray800 => const Color(0XFF3F3D56);

  Color get blueGray80001 => const Color(0XFF3C4648);

  // DeepOrange
  Color get deepOrange500 => const Color(0XFFFB6416);

  Color get deepOrangeA400 => const Color(0XFFFC420F);

  Color get deepOrangeA40001 => const Color(0XFFFD2207);

  // DeepPurple
  Color get deepPurple900 => const Color(0XFF1713C5);

  Color get deepPurpleA200 => const Color(0XFF6B5CFF);

  Color get deepPurpleA700 => const Color(0XFF1E0CE5);

  // Gray
  Color get gray100 => const Color(0XFFF4F4F4);

  Color get gray10001 => const Color(0XFFF4F2F2);

  Color get gray10002 => const Color(0XFFF2F3F8);

  Color get gray10003 => const Color(0XFFF3F3F3);

  Color get gray10004 => const Color(0XFFF5F5F5);

  Color get gray10005 => const Color(0XFFF2F2F2);

  Color get gray200 => const Color(0XFFE7E7E7);

  Color get gray20001 => const Color(0XFFEAEAEA);

  Color get gray300 => const Color(0XFFE6E6E6);

  Color get gray30001 => const Color(0XFFD9E0E8);

  Color get gray30002 => const Color(0XFFE2E2E2);

  Color get gray30003 => const Color(0XFFDBDBDB);

  Color get gray400 => const Color(0XFFB8B8B8);

  Color get gray40001 => const Color(0XFFC5C5C5);

  Color get gray50 => const Color(0XFFF8F8F8);

  Color get gray500 => const Color(0XFFA0A0A0);

  Color get gray50001 => const Color(0XFFA7A7A7);

  Color get gray5001 => const Color(0XFFFAFAFA);

  Color get gray5002 => const Color(0XFFF9F9FA);

  Color get gray600 => const Color(0XFF807878);

  Color get gray700 => const Color(0XFF5C5C5C);

  Color get gray800 => const Color(0XFF3E3E3E);

  Color get gray900 => const Color(0XFF003A10);

  Color get gray90001 => const Color(0XFF0F1728);

  Color get gray90002 => const Color(0XFF200E32);

  // GrayCc
  Color get gray500Cc => const Color(0XCCA6A6A6);

  Color get gray600Cc => const Color(0XCC7F7F7F);

  // Green
  Color get green500 => const Color(0XFF3CC033);

  Color get greenA700 => const Color(0XFF00C838);

  Color get greenA70001 => const Color(0XFF00A72E);

  // Indigo
  Color get indigo50 => const Color(0XFFE0E9F8);

  Color get indigo700 => const Color(0XFF244E93);

  Color get indigo800 => const Color(0XFF2D4C7E);

  Color get indigo80001 => const Color(0XFF294D89);

  // LightBlue
  Color get lightBlue50 => const Color(0XFFDEF7FF);

  Color get lightBlue600 => const Color(0XFF01A0E2);

  Color get lightBlueA400 => const Color(0XFF00C1FF);

  // LightGreen
  Color get lightGreen600 => const Color(0XFF75B92F);

  Color get lightGreenA700 => const Color(0XFF48BB02);

  Color get lightGreenA70001 => const Color(0XFF3FC700);

  // Lime
  Color get lime700 => const Color(0XFFA2B32C);

  // Orange
  Color get orange600 => const Color(0XFFE29500);

  Color get orange700 => const Color(0XFFFF7A00);

  // Red
  Color get red500 => const Color(0XFFFF3535);

  Color get red50001 => const Color(0XFFEB4335);

  Color get redA100 => const Color(0XFFFF7D7D);

  Color get redA400 => const Color(0XFFFF2121);

  Color get redA700 => const Color(0XFFF30000);

  // White
  Color get whiteA70023 => const Color(0X23FFFCFC);

  // Yellow
  Color get yellow800 => const Color(0XFFF9A826);

  Color get yellow80001 => const Color(0XFFDBAB28);

  Color get yellow80002 => const Color(0XFFF99C23);

  Color get yellow900 => const Color(0XFFFA7F1C);
}

PrimaryColors get appTheme => ThemeHelper().themeColor();

ThemeData get theme => ThemeHelper().themeData();
