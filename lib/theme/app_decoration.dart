import 'package:edushalaacademy/theme/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDecoration {
  static BoxDecoration get outlineGray300031 => BoxDecoration(
    color: Colors.grey.shade100,
    border: Border.all(
      color: appTheme.gray30003,
      width: 1.h,
    ),
  );
  static BoxDecoration get outlineGray30003 => BoxDecoration(
    color: theme.colorScheme.primaryContainer,
    border: Border.all(
      color: appTheme.gray30003,
      width: 1.h,
    ),
  );
  // Fill decorations
  static BoxDecoration get fillAmber => BoxDecoration(
        color: appTheme.amber600.withOpacity(0.06),
      );
  static BoxDecoration get fillAmber600 => BoxDecoration(
        color: appTheme.amber600.withOpacity(0.07),
      );
  static BoxDecoration get fillAmber6001 => BoxDecoration(
        color: appTheme.amber600.withOpacity(0.03),
      );
  static BoxDecoration get fillAmber6002 => BoxDecoration(
        color: appTheme.amber600.withOpacity(0.08),
      );
  static BoxDecoration get fillBlack => BoxDecoration(
        color: appTheme.black900.withOpacity(0.58),
      );
  static BoxDecoration get fillBlueGray => BoxDecoration(
        color: appTheme.blueGray10004.withOpacity(0.3),
      );
  static BoxDecoration get fillBluegray50 => BoxDecoration(
        color: appTheme.blueGray50,
      );
  static BoxDecoration get fillBluegray5001 => BoxDecoration(
        color: appTheme.blueGray5001,
      );
  static BoxDecoration get fillDeepOrange => BoxDecoration(
        color: appTheme.deepOrange500,
      );
  static BoxDecoration get fillDeepOrangeA => BoxDecoration(
        color: appTheme.deepOrangeA40001,
      );
  static BoxDecoration get fillDeepPurpleA => BoxDecoration(
        color: appTheme.deepPurpleA200.withOpacity(0.09),
      );
  static BoxDecoration get fillDeeporangeA400 => BoxDecoration(
        color: appTheme.deepOrangeA400,
      );
  static BoxDecoration get fillGray => BoxDecoration(
        color: appTheme.gray5002,
      );
  static BoxDecoration get fillGray100 => BoxDecoration(
        color: appTheme.gray100,
      );
  static BoxDecoration get fillGray10003 => BoxDecoration(
        color: appTheme.gray10003,
      );
  static BoxDecoration get fillGray10004 => BoxDecoration(
        color: appTheme.gray10004,
      );
  static BoxDecoration get fillGray10005 => BoxDecoration(
        color: appTheme.gray10005,
      );
  static BoxDecoration get fillGray30001 => BoxDecoration(
        color: appTheme.gray30001,
      );
  static BoxDecoration get fillGray50 => BoxDecoration(
        color: appTheme.gray50,
      );
  static BoxDecoration get fillGray5001 => BoxDecoration(
        color: appTheme.gray5001,
      );
  static BoxDecoration get fillGreen => BoxDecoration(
        color: appTheme.green500,
      );
  static BoxDecoration get fillGreenA => BoxDecoration(
        color: appTheme.greenA700.withOpacity(0.04),
      );
  static BoxDecoration get fillGreenA700 => BoxDecoration(
        color: appTheme.greenA700.withOpacity(0.1),
      );
  static BoxDecoration get fillGreenA7001 => BoxDecoration(
        color: appTheme.greenA700,
      );
  static BoxDecoration get fillLightBlue => BoxDecoration(
        color: appTheme.lightBlue600.withOpacity(0.36),
      );
  static BoxDecoration get fillLightBlueA => BoxDecoration(
        color: appTheme.lightBlueA400.withOpacity(0.05),
      );
  static BoxDecoration get fillLightGreen => BoxDecoration(
        color: appTheme.lightGreen600,
      );
  static BoxDecoration get fillLightblueA400 => BoxDecoration(
        color: appTheme.lightBlueA400.withOpacity(0.08),
      );
  static BoxDecoration get fillLightblueA4001 => BoxDecoration(
        color: appTheme.lightBlueA400,
      );
  static BoxDecoration get fillLime => BoxDecoration(
        color: appTheme.lime700,
      );
  static BoxDecoration get fillPrimary => BoxDecoration(
        color: theme.colorScheme.primary,
      );
  static BoxDecoration get fillPrimaryContainer => BoxDecoration(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
      );
  static BoxDecoration get fillPrimaryContainer1 => BoxDecoration(
        color: theme.colorScheme.primaryContainer.withOpacity(0.1),
      );
  static BoxDecoration get fillPrimaryContainer2 => BoxDecoration(
        color: theme.colorScheme.primaryContainer.withOpacity(0.05),
      );
  static BoxDecoration get fillPrimaryContainer3 => BoxDecoration(
        color: theme.colorScheme.primaryContainer,
      );
  static BoxDecoration get fillPrimary1 => BoxDecoration(
        color: theme.colorScheme.primary.withOpacity(0.1),
      );
  static BoxDecoration get fillPrimary2 => BoxDecoration(
        color: theme.colorScheme.primary.withOpacity(0.04),
      );
  static BoxDecoration get fillPrimary3 => BoxDecoration(
        color: theme.colorScheme.primary.withOpacity(0.05),
      );
  static BoxDecoration get fillPrimary4 => BoxDecoration(
        color: theme.colorScheme.primary.withOpacity(0.08),
      );
  static BoxDecoration get fillRed => BoxDecoration(
        color: appTheme.red500,
      );
  static BoxDecoration get fillRedA => BoxDecoration(
        color: appTheme.redA700.withOpacity(0.1),
      );
  static BoxDecoration get fillRedA700 => BoxDecoration(
        color: appTheme.redA700,
      );
  static BoxDecoration get fillYellow => BoxDecoration(
        color: appTheme.yellow900,
      );
  static BoxDecoration get fillYellow80001 => BoxDecoration(
        color: appTheme.yellow80001,
      );
  static BoxDecoration get fillYellow80002 => BoxDecoration(
        color: appTheme.yellow80002,
      );

  // Gradient decorations
  static BoxDecoration get gradientBlackToBlack => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.5, 0),
          end: Alignment(0.5, 1),
          colors: [
            appTheme.black900.withOpacity(0),
            appTheme.black900,
          ],
        ),
      );
  static BoxDecoration get gradientErrorContainerToErrorContainer =>
      BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.04, 0.14),
          end: Alignment(0.94, 0.95),
          colors: [
            theme.colorScheme.errorContainer.withOpacity(0.04),
            theme.colorScheme.errorContainer.withOpacity(0.04),
          ],
        ),
      );
  static BoxDecoration get gradientErrorContainerToErrorContainer1 =>
      BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.04, 0.14),
          end: Alignment(0.94, 0.95),
          colors: [
            theme.colorScheme.errorContainer,
            theme.colorScheme.errorContainer,
          ],
        ),
      );
  static BoxDecoration get gradientGrayToGray => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.5, 0.35),
          end: Alignment(0.5, 1),
          colors: [
            appTheme.gray5002,
            appTheme.gray5002,
          ],
        ),
      );
  static BoxDecoration get gradientGrayToGreenA => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0, -0.01),
          end: Alignment(1.03, 1.02),
          colors: [
            appTheme.gray900,
            appTheme.greenA70001,
          ],
        ),
      );
  static BoxDecoration get gradientPrimaryContainerToPrimaryContainer =>
      BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.33, 0.5),
          end: Alignment(0.84, 0.53),
          colors: [
            theme.colorScheme.primaryContainer.withOpacity(1),
            theme.colorScheme.primaryContainer.withOpacity(0),
          ],
        ),
      );
  static BoxDecoration get gradientPrimaryContainerToPrimaryContainer1 =>
      BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.02, 0.5),
          end: Alignment(0.97, 0.5),
          colors: [
            theme.colorScheme.primaryContainer.withOpacity(1),
            theme.colorScheme.primaryContainer.withOpacity(0),
          ],
        ),
      );
  static BoxDecoration get gradientPrimaryToBlue => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.08, 0.33),
          end: Alignment(0.99, 0.91),
          colors: [
            theme.colorScheme.primary.withOpacity(0.2),
            appTheme.blue90002.withOpacity(0.2),
          ],
        ),
      );
  static BoxDecoration get gradientPrimaryToBlue90001 => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0, -0.01),
          end: Alignment(1.03, 1.02),
          colors: [
            theme.colorScheme.primary,
            appTheme.blue90001,
          ],
        ),
      );
  static BoxDecoration get gradientPrimaryToBlue90003 => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.03, 0.07),
          end: Alignment(0.94, 0.94),
          colors: [
            theme.colorScheme.primary,
            appTheme.blue90003,
          ],
        ),
      );
  static BoxDecoration get gradientPrimaryToIndigo => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(-0.09, 0),
          end: Alignment(0.94, 0.6),
          colors: [
            theme.colorScheme.primary,
            appTheme.indigo700,
          ],
        ),
      );

  // Outline decorations
  static BoxDecoration get outlineBlack => BoxDecoration(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.13),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              3,
              -6,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineBlack900 => BoxDecoration(
        color: appTheme.black900.withOpacity(0.5),
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.13),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              3,
              -6,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineBlack9001 => BoxDecoration(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.25),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              2,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineBlack90010 => BoxDecoration(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.03),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              0,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineBlack90011 => BoxDecoration(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.25),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              1.18,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineBlack90012 => BoxDecoration(
        color: theme.colorScheme.primary.withOpacity(0.04),
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.25),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              1,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineBlack90013 => BoxDecoration(
        color: appTheme.indigo50,
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.25),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              1,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineBlack90014 => BoxDecoration(
        color: appTheme.gray5002,
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.25),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              1,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineBlack90015 => BoxDecoration(
        color: theme.colorScheme.primary,
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.25),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              0,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineBlack900115 => BoxDecoration(
    color: theme.colorScheme.primaryContainer.withOpacity(1),
    boxShadow: [
      BoxShadow(
        color: appTheme.black900.withOpacity(0.25),
        spreadRadius: 2.h,
        blurRadius: 2.h,
        offset: Offset(
          0,
          0,
        ),
      ),
    ],
  );
  static BoxDecoration get outlineBlack90016 => BoxDecoration(
        color: theme.colorScheme.primaryContainer.withOpacity(0.07),
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.1),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              0,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineBlack90017 => BoxDecoration(
        color: appTheme.whiteA70023,
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.25),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              0,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineBlack90018 => BoxDecoration(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.05),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              0,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineBlack90019 => BoxDecoration(
        color: theme.colorScheme.primary,
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.25),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              1,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineBlack9002 => BoxDecoration(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.13),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              3,
              -6,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineBlack90020 => BoxDecoration(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
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
      );
  static BoxDecoration get outlineBlack90021 => BoxDecoration(
        color: appTheme.lightBlueA400.withOpacity(0.08),
      );
  static BoxDecoration get outlineBlack90022 => BoxDecoration();
  static BoxDecoration get outlineBlack90023 => BoxDecoration();
  static BoxDecoration get outlineBlack90024 => BoxDecoration(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.25),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              -5,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineBlack90025 => BoxDecoration();
  static BoxDecoration get outlineBlack90026 => BoxDecoration(
        color: theme.colorScheme.primary,
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.25),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              0,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineBlack90027 => BoxDecoration(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.25),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              0,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineBlack90028 => BoxDecoration(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.1),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              0,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineBlack90029 => BoxDecoration(
        color: theme.colorScheme.primary,
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.1),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              0,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineBlack9003 => BoxDecoration(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.13),
            spreadRadius: 1.5.h,
            blurRadius: 1.5.h,
            offset: Offset(
              0,
              -5,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineBlack90030 => BoxDecoration(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.25),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              0,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineBlack90031 => BoxDecoration(
        color: theme.colorScheme.primary,
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.25),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              0,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineBlack90032 => BoxDecoration(
        color: appTheme.lightBlueA400,
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
      );
  static BoxDecoration get outlineBlack90033 => BoxDecoration(
        color: appTheme.amber600,
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.25),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              0,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineBlack90034 => BoxDecoration(
        color: appTheme.redA700,
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.25),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              0,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineBlack90035 => BoxDecoration(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.05),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              0,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineBlack9004 => BoxDecoration(
        color: appTheme.gray10002,
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.25),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              0,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineBlack9005 => BoxDecoration();
  static BoxDecoration get outlineBlack9006 => BoxDecoration(
        color: appTheme.lightBlueA400,
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.25),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              0,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineBlack9007 => BoxDecoration(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.25),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              0,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineBlack9008 => BoxDecoration(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.1),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              0,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineBlack9009 => BoxDecoration(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.07),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              3,
              0,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineBlue => BoxDecoration(
        border: Border.all(
          color: appTheme.blue90004,
          width: 4.h,
          strokeAlign: strokeAlignOutside,
        ),
      );
  static BoxDecoration get outlineBlueGray => BoxDecoration(
        border: Border.all(
          color: appTheme.blueGray10003,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineDeepPurple => BoxDecoration(
        border: Border.all(
          color: appTheme.deepPurple900,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineGray => BoxDecoration(
        border: Border.all(
          color: appTheme.gray300,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineGreenA => BoxDecoration(
        border: Border.all(
          color: appTheme.greenA700,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineGreenA700 => BoxDecoration(
        border: Border.all(
          color: appTheme.greenA700,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineLightBlue => BoxDecoration(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
        boxShadow: [
          BoxShadow(
            color: appTheme.lightBlue50,
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              4,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineLightBlueA => BoxDecoration(
        border: Border.all(
          color: appTheme.lightBlueA400,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineLightblue50 => BoxDecoration(
        color: appTheme.lightBlueA400,
        boxShadow: [
          BoxShadow(
            color: appTheme.lightBlue50,
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              4,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineLightblueA400 => BoxDecoration(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
        border: Border.all(
          color: appTheme.lightBlueA400,
          width: 2.h,
        ),
      );
  static BoxDecoration get outlineLightblueA4001 => BoxDecoration(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
        border: Border.all(
          color: appTheme.lightBlueA400,
          width: 2.h,
        ),
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.1),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              0,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineLightblueA4002 => BoxDecoration(
        color: appTheme.lightBlueA400,
        border: Border.all(
          color: appTheme.lightBlueA400,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineLightblueA4003 => BoxDecoration(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
        border: Border.all(
          color: appTheme.lightBlueA400,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlinePrimary => BoxDecoration(
        border: Border.all(
          color: theme.colorScheme.primary,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlinePrimaryContainer => BoxDecoration();
  static BoxDecoration get outlinePrimary1 => BoxDecoration(
        border: Border.all(
          color: theme.colorScheme.primary.withOpacity(0.08),
          width: 1.h,
        ),
      );
  static BoxDecoration get outlinePrimary2 => BoxDecoration(
        color: appTheme.gray5002,
        border: Border.all(
          color: theme.colorScheme.primary,
          width: 1.h,
        ),
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.25),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              1,
            ),
          ),
        ],
      );
  static BoxDecoration get outlinePrimary3 => BoxDecoration(
        color: theme.colorScheme.primary,
        border: Border.all(
          color: theme.colorScheme.primary,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlinePrimary4 => BoxDecoration(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
        border: Border.all(
          color: theme.colorScheme.primary,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlinePrimary5 => BoxDecoration();
  static BoxDecoration get outlinePrimary6 => BoxDecoration(
        color: appTheme.gray5002,
        border: Border.all(
          color: theme.colorScheme.primary,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineRed => BoxDecoration(
        color: appTheme.red500,
        border: Border.all(
          color: appTheme.red500,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineRed500 => BoxDecoration(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
        border: Border.all(
          color: appTheme.red500,
          width: 1.h,
        ),
      );
}

class BorderRadiusStyle {
  // Circle borders
  static BorderRadius get customBorderTL40 => BorderRadius.only(
    topLeft: Radius.circular(40.h),
    bottomRight: Radius.circular(40.h),
  );
  static BorderRadius get circleBorder108 => BorderRadius.circular(
        108.h,
      );
  static BorderRadius get circleBorder25 => BorderRadius.circular(
        25.h,
      );
  static BorderRadius get circleBorder29 => BorderRadius.circular(
        29.h,
      );
  static BorderRadius get circleBorder76 => BorderRadius.circular(
        76.h,
      );
  static BorderRadius get circleBorder92 => BorderRadius.circular(
        92.h,
      );

  // Custom borders
  static BorderRadius get customBorderBL7 => BorderRadius.vertical(
        bottom: Radius.circular(7.h),
      );
  static BorderRadius get customBorderBL9 => BorderRadius.only(
        topRight: Radius.circular(9.h),
        bottomLeft: Radius.circular(9.h),
      );
  static BorderRadius get customBorderTL10 => BorderRadius.vertical(
        top: Radius.circular(10.h),
      );
  static BorderRadius get customBorderTL25 => BorderRadius.vertical(
        top: Radius.circular(25.h),
      );

  // Rounded borders
  static BorderRadius get roundedBorder10 => BorderRadius.circular(
        10.h,
      );
  static BorderRadius get roundedBorder105 => BorderRadius.circular(
        105.h,
      );
  static BorderRadius get roundedBorder13 => BorderRadius.circular(
        13.h,
      );
  static BorderRadius get roundedBorder16 => BorderRadius.circular(
        16.h,
      );
  static BorderRadius get roundedBorder22 => BorderRadius.circular(
        22.h,
      );
  static BorderRadius get roundedBorder3 => BorderRadius.circular(
        3.h,
      );
  static BorderRadius get roundedBorder36 => BorderRadius.circular(
        36.h,
      );
  static BorderRadius get roundedBorder45 => BorderRadius.circular(
        45.h,
      );
  static BorderRadius get roundedBorder60 => BorderRadius.circular(
        60.h,
      );
  static BorderRadius get roundedBorder67 => BorderRadius.circular(
        67.h,
      );
  static BorderRadius get roundedBorder7 => BorderRadius.circular(
        7.h,
      );
  static BorderRadius get roundedBorder73 => BorderRadius.circular(
        73.h,
      );
  static BorderRadius get roundedBorder95 => BorderRadius.circular(
        95.h,
      );
}

// Comment/Uncomment the below code based on your Flutter SDK version.
    
// For Flutter SDK Version 3.7.2 or greater.
    
double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
    