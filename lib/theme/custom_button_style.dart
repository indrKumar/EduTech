import 'package:edushalaacademy/theme/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// A class that offers pre-defined button styles for customizing button appearance.
class CustomButtonStyles {
  // Filled button style
  static ButtonStyle get fillDeepPurpleA => ElevatedButton.styleFrom(
        backgroundColor: appTheme.deepPurpleA700,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              23.h,
            ),
            topRight: Radius.circular(
              22.h,
            ),
            bottomLeft: Radius.circular(
              23.h,
            ),
            bottomRight: Radius.circular(
              22.h,
            ),
          ),
        ),
      );
  static ButtonStyle get fillGray => ElevatedButton.styleFrom(
        backgroundColor: appTheme.gray5002,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.h),
        ),
      );
  static ButtonStyle get fillGreenA => ElevatedButton.styleFrom(
        backgroundColor: appTheme.greenA700,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              23.h,
            ),
            topRight: Radius.circular(
              22.h,
            ),
            bottomLeft: Radius.circular(
              23.h,
            ),
            bottomRight: Radius.circular(
              22.h,
            ),
          ),
        ),
      );
  static ButtonStyle get fillLightBlueA => ElevatedButton.styleFrom(
        backgroundColor: appTheme.lightBlueA400,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(11.h),
        ),
      );
  static ButtonStyle get fillLightBlueATL14 => ElevatedButton.styleFrom(
        backgroundColor: appTheme.lightBlueA400,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.h),
        ),
      );
  static ButtonStyle get fillPrimaryContainer => ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.primaryContainer.withOpacity(1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(11.h),
        ),
      );
  static ButtonStyle get fillPrimaryTL10 => ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.h),
        ),
      );
  static ButtonStyle get fillPrimaryTL23 => ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.primary.withOpacity(0.2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              23.h,
            ),
            topRight: Radius.circular(
              22.h,
            ),
            bottomLeft: Radius.circular(
              23.h,
            ),
            bottomRight: Radius.circular(
              22.h,
            ),
          ),
        ),
      );
  static ButtonStyle get fillPrimaryTL5 => ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.h),
        ),
      );

  // Gradient button style
  static BoxDecoration get gradientBlueToIndigoDecoration => BoxDecoration(
        borderRadius: BorderRadius.circular(15.h),
        gradient: LinearGradient(
          begin: Alignment(0.5, 0),
          end: Alignment(0.5, 1),
          colors: [
            appTheme.blue800,
            appTheme.indigo80001,
          ],
        ),
      );
  static BoxDecoration get gradientBlueToIndigoTL5Decoration => BoxDecoration(
        borderRadius: BorderRadius.circular(5.h),
        gradient: LinearGradient(
          begin: Alignment(0.5, 0),
          end: Alignment(0.5, 1),
          colors: [
            appTheme.blue800,
            appTheme.indigo80001,
          ],
        ),
      );
  static BoxDecoration get gradientPrimaryToBlueDecoration => BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            23.h,
          ),
          topRight: Radius.circular(
            22.h,
          ),
          bottomLeft: Radius.circular(
            23.h,
          ),
          bottomRight: Radius.circular(
            22.h,
          ),
        ),
        gradient: LinearGradient(
          begin: Alignment(0.08, 0),
          end: Alignment(0.99, 0),
          colors: [
            theme.colorScheme.primary,
            appTheme.blue90002,
          ],
        ),
      );
  static BoxDecoration get gradientPrimaryToBlueTL15Decoration => BoxDecoration(
        borderRadius: BorderRadius.circular(15.h),
        border: Border.all(
          color: theme.colorScheme.primaryContainer.withOpacity(1),
          width: 1.h,
        ),
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.25),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              4,
            ),
          ),
        ],
        gradient: LinearGradient(
          begin: Alignment(0.04, 0),
          end: Alignment(1.02, 0),
          colors: [
            theme.colorScheme.primary,
            appTheme.blue900,
          ],
        ),
      );
  static BoxDecoration get gradientPrimaryToBlueTL23Decoration => BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            23.h,
          ),
          topRight: Radius.circular(
            22.h,
          ),
          bottomLeft: Radius.circular(
            23.h,
          ),
          bottomRight: Radius.circular(
            22.h,
          ),
        ),
        gradient: LinearGradient(
          begin: Alignment(0.08, 0),
          end: Alignment(0.99, 0),
          colors: [
            theme.colorScheme.primary.withOpacity(0.2),
            appTheme.blue90002.withOpacity(0.2),
          ],
        ),
      );
  static BoxDecoration get gradientPrimaryToIndigoDecoration => BoxDecoration(
        borderRadius: BorderRadius.circular(5.h),
        gradient: LinearGradient(
          begin: Alignment(0.5, 0),
          end: Alignment(0.5, 1),
          colors: [
            theme.colorScheme.primary,
            appTheme.indigo800,
          ],
        ),
      );

  // Outline button style
  static ButtonStyle get outlineBlack => ElevatedButton.styleFrom(
        backgroundColor: appTheme.lightBlueA400,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.h),
        ),
        shadowColor: appTheme.black900.withOpacity(0.25),
        elevation: 4,
      );
  static ButtonStyle get outlineBlackTL11 => ElevatedButton.styleFrom(
        backgroundColor: appTheme.gray5002,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(11.h),
        ),
        shadowColor: appTheme.black900.withOpacity(0.25),
        elevation: 1,
      );
  static ButtonStyle get outlineBlackTL15 => ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.primaryContainer.withOpacity(1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.h),
        ),
        shadowColor: appTheme.black900.withOpacity(0.25),
        elevation: 4,
      );
  static ButtonStyle get outlineBlackTL20 => ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.onPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.h),
        ),
        shadowColor: appTheme.black900.withOpacity(0.25),
        elevation: 4,
      );
  static ButtonStyle get outlineBlueGray => OutlinedButton.styleFrom(
        backgroundColor: theme.colorScheme.primaryContainer.withOpacity(1),
        side: BorderSide(
          color: appTheme.blueGray10003,
          width: 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.h),
        ),
      );
  static ButtonStyle get outlineGreenA => OutlinedButton.styleFrom(
        backgroundColor: Colors.transparent,
        side: BorderSide(
          color: appTheme.greenA700,
          width: 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              15.h,
            ),
            bottomRight: Radius.circular(
              15.h,
            ),
          ),
        ),
      );
  static ButtonStyle get outlineLightBlueA => OutlinedButton.styleFrom(
        backgroundColor: theme.colorScheme.primaryContainer.withOpacity(1),
        side: BorderSide(
          color: appTheme.lightBlueA400,
          width: 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(11.h),
        ),
      );
  static ButtonStyle get outlineLightBlueATL14 => OutlinedButton.styleFrom(
        backgroundColor: appTheme.lightBlueA400,
        side: BorderSide(
          color: appTheme.lightBlueA400,
          width: 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.h),
        ),
      );
  static ButtonStyle get outlinePrimary => OutlinedButton.styleFrom(
        backgroundColor: theme.colorScheme.primary,
        side: BorderSide(
          color: theme.colorScheme.primary,
          width: 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(
            right: Radius.circular(
              22.h,
            ),
          ),
        ),
      );
  static ButtonStyle get outlinePrimaryContainer => OutlinedButton.styleFrom(
        backgroundColor: theme.colorScheme.primary,
        side: BorderSide(
          color: theme.colorScheme.primaryContainer.withOpacity(1),
          width: 3,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.h),
        ),
      );
  static ButtonStyle get outlinePrimaryTL11 => OutlinedButton.styleFrom(
        backgroundColor: appTheme.gray5002,
        side: BorderSide(
          color: theme.colorScheme.primary,
          width: 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(11.h),
        ),
      );
  static ButtonStyle get outlinePrimaryTL23 => OutlinedButton.styleFrom(
        backgroundColor: theme.colorScheme.primaryContainer.withOpacity(1),
        side: BorderSide(
          color: theme.colorScheme.primary,
          width: 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              23.h,
            ),
            topRight: Radius.circular(
              22.h,
            ),
            bottomLeft: Radius.circular(
              23.h,
            ),
            bottomRight: Radius.circular(
              22.h,
            ),
          ),
        ),
      );
  static ButtonStyle get outlineRedA => OutlinedButton.styleFrom(
        backgroundColor: Colors.transparent,
        side: BorderSide(
          color: appTheme.redA700,
          width: 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7.h),
        ),
      );
  static ButtonStyle get outlineRedATL15 => OutlinedButton.styleFrom(
        backgroundColor: Colors.transparent,
        side: BorderSide(
          color: appTheme.redA700,
          width: 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              15.h,
            ),
            bottomRight: Radius.circular(
              15.h,
            ),
          ),
        ),
      );
  // text button style
  static ButtonStyle get none => ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
        elevation: MaterialStateProperty.all<double>(0),
      );
}
