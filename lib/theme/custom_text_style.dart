import 'package:edushalaacademy/theme/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  static get titleMediumff000000SemiBold =>
      theme.textTheme.titleMedium!.copyWith(
        color: Color(0XFF000000),
        fontWeight: FontWeight.w600,
      );
  // Body text style
  static get bodyLarge18 => theme.textTheme.bodyLarge!.copyWith(
        fontSize: 18,
      );
  static get bodySmallGray50001 => theme.textTheme.bodySmall!.copyWith(
    color: appTheme.gray50001,
  );
  static get bodyLargeBlack900 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.black900.withOpacity(0.6),
      );
  static get bodyLargeBlack900_1 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.black900.withOpacity(0.8),
      );
  static get bodyLargeInter => theme.textTheme.bodyLarge!.inter;
  static get bodyLargeInterBluegray500 =>
      theme.textTheme.bodyLarge!.inter.copyWith(
        color: appTheme.blueGray500,
      );
  static get bodyLargeInterBluegray50018 =>
      theme.textTheme.bodyLarge!.inter.copyWith(
        color: appTheme.blueGray500,
        fontSize: 18,
      );
  static get bodyLargeInterPrimary => theme.textTheme.bodyLarge!.inter.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 17,
      );
  static get bodyLargeInterPrimary18 =>
      theme.textTheme.bodyLarge!.inter.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 18,
      );
  static get bodyLargePrimary => theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 18,
      );
  static get bodyLargePrimaryContainer => theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(0.8),
      );
  static get bodyLargePrimaryContainer18 => theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
        fontSize: 18,
      );
  static get bodyLargePrimaryContainer_1 => theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
      );
  static get bodyLargecc000000 => theme.textTheme.bodyLarge!.copyWith(
        color: Color(0XCC000000),
      );
  static get bodyLargeccffffff => theme.textTheme.bodyLarge!.copyWith(
        color: Color(0XCCFFFFFF),
      );
  static get bodyLargeff000000 => theme.textTheme.bodyLarge!.copyWith(
        color: Color(0XFF000000),
      );
  static get bodyLargeff00000018 => theme.textTheme.bodyLarge!.copyWith(
        color: Color(0XFF000000),
        fontSize: 18,
      );
  static get bodyLargeffffffff => theme.textTheme.bodyLarge!.copyWith(
        color: Color(0XFFFFFFFF),
      );
  static get bodyLargeffffffff18 => theme.textTheme.bodyLarge!.copyWith(
        color: Color(0XFFFFFFFF),
        fontSize: 18,
      );
  static get bodyMediumMontserrat => theme.textTheme.bodyMedium!.montserrat;
  static get bodyMediumMontserrat13 =>
      theme.textTheme.bodyMedium!.montserrat.copyWith(
        fontSize: 13,
      );
  static get bodyMediumMontserratBlack900 =>
      theme.textTheme.bodyMedium!.montserrat.copyWith(
        color: appTheme.black900.withOpacity(0.7),
        fontSize: 15,
      );
  static get bodyMediumMontserratBlack900_1 =>
      theme.textTheme.bodyMedium!.montserrat.copyWith(
        color: appTheme.black900.withOpacity(0.6),
      );
  static get bodyMediumMontserratGray600cc =>
      theme.textTheme.bodyMedium!.montserrat.copyWith(
        color: appTheme.gray600Cc,
      );
  static get bodyMediumMontserratGray700 =>
      theme.textTheme.bodyMedium!.montserrat.copyWith(
        color: appTheme.gray700,
      );
  static get bodyMediumMontserratPrimaryContainer =>
      theme.textTheme.bodyMedium!.montserrat.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
      );
  static get bodyMediumMontserratPrimaryContainer_1 =>
      theme.textTheme.bodyMedium!.montserrat.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(0.7),
      );
  static get bodyMediumMontserrat_1 => theme.textTheme.bodyMedium!.montserrat;
  static get bodyMediumMontserratffffffff =>
      theme.textTheme.bodyMedium!.montserrat.copyWith(
        color: Color(0XFFFFFFFF),
      );
  static get bodyMediumMontserratffffffff13 =>
      theme.textTheme.bodyMedium!.montserrat.copyWith(
        color: Color(0XFFFFFFFF),
        fontSize: 13,
      );
  static get bodyMediumPrimaryContainer => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
      );
  static get bodyMediumff000000 => theme.textTheme.bodyMedium!.copyWith(
        color: Color(0XFF000000),
      );
  static get bodySmall10 => theme.textTheme.bodySmall!.copyWith(
        fontSize: 10,
      );
  static get bodySmall8 => theme.textTheme.bodySmall!.copyWith(
        fontSize: 8,
      );
  static get bodySmall8_1 => theme.textTheme.bodySmall!.copyWith(
        fontSize: 8,
      );
  static get bodySmall8_2 => theme.textTheme.bodySmall!.copyWith(
        fontSize: 8,
      );
  static get bodySmall9 => theme.textTheme.bodySmall!.copyWith(
        fontSize: 9,
      );
  static get bodySmallBlack900 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.black900.withOpacity(0.5),
        fontSize: 8,
      );
  static get bodySmallBlack90010 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.black900.withOpacity(0.5),
        fontSize: 10,
      );
  static get bodySmallBluegray100 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.blueGray100,
        fontSize: 10,
      );
  static get bodySmallGray20001 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray20001,
      );
  static get bodySmallGray400 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray400,
      );
  static get bodySmallGray500 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray500,
      );
  static get bodySmallInter => theme.textTheme.bodySmall!.inter;
  static get bodySmallInter2d000000 =>
      theme.textTheme.bodySmall!.inter.copyWith(
        color: Color(0X2D000000),
      );
  static get bodySmallInterBlack900 =>
      theme.textTheme.bodySmall!.inter.copyWith(
        color: appTheme.black900.withOpacity(0.8),
        fontSize: 10,
      );
  static get bodySmallInterBlack900_1 =>
      theme.textTheme.bodySmall!.inter.copyWith(
        color: appTheme.black900.withOpacity(0.6),
      );
  static get bodySmallInterBlack900_2 =>
      theme.textTheme.bodySmall!.inter.copyWith(
        color: appTheme.black900.withOpacity(0.4),
      );
  static get bodySmallInterGray400 => theme.textTheme.bodySmall!.inter.copyWith(
        color: appTheme.gray400,
      );
  static get bodySmallInterPrimary => theme.textTheme.bodySmall!.inter.copyWith(
        color: theme.colorScheme.primary,
      );
  static get bodySmallInterPrimaryContainer =>
      theme.textTheme.bodySmall!.inter.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(0.8),
        fontSize: 10,
      );
  static get bodySmallInterff000000 =>
      theme.textTheme.bodySmall!.inter.copyWith(
        color: Color(0XFF000000),
      );
  static get bodySmallInterff00c1ff =>
      theme.textTheme.bodySmall!.inter.copyWith(
        color: Color(0XFF00C1FF),
      );
  static get bodySmallLight => theme.textTheme.bodySmall!.copyWith(
        fontSize: 9,
        fontWeight: FontWeight.w300,
      );
  static get bodySmallLightblueA400 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.lightBlueA400,
      );
  static get bodySmallOnError => theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.onError,
        fontSize: 8,
      );
  static get bodySmallPoppins => theme.textTheme.bodySmall!.poppins.copyWith(
        fontSize: 8,
      );
  static get bodySmallPoppinsBlack900 =>
      theme.textTheme.bodySmall!.poppins.copyWith(
        color: appTheme.black900.withOpacity(0.53),
        fontSize: 11,
      );
  static get bodySmallPoppinsBlack900_1 =>
      theme.textTheme.bodySmall!.poppins.copyWith(
        color: appTheme.black900.withOpacity(0.4),
      );
  static get bodySmallPrimaryContainer => theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
      );
  static get bodySmallPrimaryContainer10 => theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
        fontSize: 10,
      );
  static get bodySmallPrimaryContainer8 => theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
        fontSize: 8,
      );
  static get bodySmallPrimaryContainer_1 => theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(0.8),
      );
  static get bodySmallRed500 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.red500,
      );
  static get bodySmallff000000 => theme.textTheme.bodySmall!.copyWith(
        color: Color(0XFF000000),
      );
  static get bodySmallff00000010 => theme.textTheme.bodySmall!.copyWith(
        color: Color(0XFF000000),
        fontSize: 10,
      );
  static get bodySmallff0000008 => theme.textTheme.bodySmall!.copyWith(
        color: Color(0XFF000000),
        fontSize: 8,
      );
  static get bodySmallff1356c5 => theme.textTheme.bodySmall!.copyWith(
        color: Color(0XFF1356C5),
        fontSize: 10,
      );
  static get bodySmallffffffff => theme.textTheme.bodySmall!.copyWith(
        color: Color(0XFFFFFFFF),
      );
  static get bodySmallffffffff10 => theme.textTheme.bodySmall!.copyWith(
        color: Color(0XFFFFFFFF),
        fontSize: 10,
      );
  // Display text style
  static get displayMediumMontserrat =>
      theme.textTheme.displayMedium!.montserrat.copyWith(
        fontSize: 40,
        fontWeight: FontWeight.w600,
      );
  static get displayMediumPrimaryContainer =>
      theme.textTheme.displayMedium!.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
        fontSize: 43,
      );
  static get displayMediumPrimaryContainer50 =>
      theme.textTheme.displayMedium!.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
        fontSize: 50,
      );
  static get displaySmallPrimaryContainer =>
      theme.textTheme.displaySmall!.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
        fontSize: 36,
      );
  static get displaySmallPrimaryContainer39 =>
      theme.textTheme.displaySmall!.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
        fontSize: 39,
      );
  // Headline text style
  static get headlineLargeBlack900 => theme.textTheme.headlineLarge!.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w400,
      );
  static get headlineLargeBlack900Bold =>
      theme.textTheme.headlineLarge!.copyWith(
        color: appTheme.black900,
        fontSize: 32,
        fontWeight: FontWeight.w700,
      );
  static get headlineLargeMontserratPrimaryContainer =>
      theme.textTheme.headlineLarge!.montserrat.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
      );
  static get headlineMediumBlack900 => theme.textTheme.headlineMedium!.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w600,
      );
  static get headlineMediumLightblueA400 =>
      theme.textTheme.headlineMedium!.montserrat.copyWith(
        color:  appTheme.lightBlueA400,
        fontSize: 18.h,
        // overflow: TextOverflow.ellipsis
      );

  static get headlineMediumPrimaryContainer =>
      theme.textTheme.headlineMedium!.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
        fontWeight: FontWeight.w400,
      );
  static get headlineMediumffffffff => theme.textTheme.headlineMedium!.copyWith(
        color: const Color(0XFFFFFFFF),
      );
  static get headlineSmallMontserratOnSecondaryContainer =>
      theme.textTheme.headlineSmall!.montserrat.copyWith(
        color: theme.colorScheme.onSecondaryContainer,
        fontSize: 25,
        fontWeight: FontWeight.w700,
      );
  static get headlineSmallPoppinsPrimaryContainer =>
      theme.textTheme.headlineSmall!.poppins.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
        fontSize: 25,
        fontWeight: FontWeight.w500,
      );
  // Label text style
  static get labelLargeBlack900 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.black900,
      );
  static get labelLargeBlack90013 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.black900,
        fontSize: 13,
      );
  static get labelLargeBlack90013_1 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.black900.withOpacity(0.8),
        fontSize: 13,
      );
  static get labelLargeBlack900Bold => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.black900.withOpacity(0.8),
        fontSize: 13,
        fontWeight: FontWeight.w700,
      );
  static get labelLargeBlack900Bold_1 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w700,
      );
  static get labelLargeBlack900Bold_2 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.black900.withOpacity(0.8),
        fontWeight: FontWeight.w700,
      );
  static get labelLargeBlack900Bold_3 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w700,
      );
  static get labelLargeBlack900SemiBold => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w600,
      );
  static get labelLargeBlack900SemiBold_1 =>
      theme.textTheme.labelLarge!.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w600,
      );
  static get labelLargeBlack900SemiBold_2 =>
      theme.textTheme.labelLarge!.copyWith(
        color: appTheme.black900.withOpacity(0.2),
        fontWeight: FontWeight.w600,
      );
  static get labelLargeBlack900SemiBold_3 =>
      theme.textTheme.labelLarge!.copyWith(
        color: appTheme.black900.withOpacity(0.4),
        fontWeight: FontWeight.w600,
      );
  static get labelLargeBlack900_1 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.black900.withOpacity(0.4),
      );
  static get labelLargeBlack900_2 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.black900,
      );
  static get labelLargeBlack900_3 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.black900.withOpacity(0.5),
      );
  static get labelLargeBlack900_4 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.black900,
      );
  static get labelLargeBlack900_5 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.black900.withOpacity(0.8),
      );
  static get labelLargeBlack900_6 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.black900,
    fontSize: 13.w
      );
  static get labelLargeBluegray40099 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.blueGray40099,
        fontWeight: FontWeight.w600,
      );
  static get labelLargeBluegray4009901 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.blueGray4009901,
        fontWeight: FontWeight.w600,
      );
  static get labelLargeGray500cc => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.gray500Cc,
        fontSize: 13,
      );
  static get labelLargeGray500cc13 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.gray500Cc,
        fontSize: 13,
      );
  static get labelLargeGreenA700 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.greenA700,
        fontWeight: FontWeight.w700,
      );
  static get labelLargeGreenA700Bold => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.greenA700,
        fontWeight: FontWeight.w700,
      );
  static get labelLargeGreenA700_1 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.greenA700,
      );
  static get labelLargeInterLightblueA400 =>
      theme.textTheme.labelLarge!.inter.copyWith(
        color: appTheme.lightBlueA400,
        fontWeight: FontWeight.w700,
      );
  static get labelLargeInterff00c1ff =>
      theme.textTheme.labelLarge!.inter.copyWith(
        color: Color(0XFF00C1FF),
        fontWeight: FontWeight.w700,
      );
  static get labelLargeLightblueA400 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.lightBlueA400,
        fontWeight: FontWeight.w700,
      );
  static get labelLargeLightblueA400SemiBold =>
      theme.textTheme.labelLarge!.copyWith(
        color: appTheme.lightBlueA400,
        fontWeight: FontWeight.w600,
      );
  static get labelLargeOnPrimary => theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.onPrimary,
        fontWeight: FontWeight.w600,
      );
  static get labelLargePoppinsBlack900 =>
      theme.textTheme.labelLarge!.poppins.copyWith(
        color: appTheme.black900,
        fontSize: 13,
        fontWeight: FontWeight.w600,
      );
  static get labelLargePrimary => theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w700,
      );
  static get labelLargePrimaryBold => theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w700,
      );
  static get labelLargePrimaryContainer => theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
      );
  static get labelLargePrimaryContainerBold =>
      theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
        fontWeight: FontWeight.w700,
      );
  static get labelLargePrimaryContainerSemiBold =>
      theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
        fontSize: 13,
        fontWeight: FontWeight.w600,
      );
  static get labelLargePrimaryContainerSemiBold_1 =>
      theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
        fontWeight: FontWeight.w600,
      );
  static get labelLargePrimaryContainerSemiBold_2 =>
      theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
        fontWeight: FontWeight.w600,
      );
  static get labelLargePrimary_1 => theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get labelLargeRedA700 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.redA700,
      );
  static get labelLargeRedA700Bold => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.redA700,
        fontWeight: FontWeight.w700,
      );
  static get labelLargeSecondaryContainer =>
      theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.secondaryContainer,
      );
  static get labelLargeSemiBold => theme.textTheme.labelLarge!.copyWith(
        fontWeight: FontWeight.w600,
      );
  static get labelLargeff000000 => theme.textTheme.labelLarge!.copyWith(
        color: Color(0XFF000000),
        fontWeight: FontWeight.w700,
      );
  static get labelLargeff000000_1 => theme.textTheme.labelLarge!.copyWith(
        color: Color(0XFF000000),
      );
  static get labelLargeff00c1ff => theme.textTheme.labelLarge!.copyWith(
        color: Color(0XFF00C1FF),
      );
  static get labelLargeff00c1ffBold => theme.textTheme.labelLarge!.copyWith(
        color: Color(0XFF00C1FF),
        fontWeight: FontWeight.w700,
      );
  static get labelLargeff00c838 => theme.textTheme.labelLarge!.copyWith(
        color: Color(0XFF00C838),
        fontWeight: FontWeight.w700,
      );
  static get labelMediumBlack900 => theme.textTheme.labelMedium!.copyWith(
        color: appTheme.black900.withOpacity(0.6),
        fontWeight: FontWeight.w500,
      );
  static get labelMediumBlack90011 => theme.textTheme.labelMedium!.copyWith(
        color: appTheme.black900,
        fontSize: 11,
      );
  static get labelMediumBlack900Medium => theme.textTheme.labelMedium!.copyWith(
        color: appTheme.black900.withOpacity(0.6),
        fontWeight: FontWeight.w500,
      );
  static get labelMediumBlack900Medium11 =>
      theme.textTheme.labelMedium!.copyWith(
        color: appTheme.black900,
        fontSize: 11,
        fontWeight: FontWeight.w500,
      );
  static get labelMediumBlack900Medium_1 =>
      theme.textTheme.labelMedium!.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w500,
      );
  static get labelMediumBlack900Medium_2 =>
      theme.textTheme.labelMedium!.copyWith(
        color: appTheme.black900.withOpacity(0.5),
        fontWeight: FontWeight.w500,
      );
  static get labelMediumBlack900Medium_3 =>
      theme.textTheme.labelMedium!.copyWith(
        color: appTheme.black900.withOpacity(0.7),
        fontWeight: FontWeight.w500,
      );
  static get labelMediumBlack900Medium_4 =>
      theme.textTheme.labelMedium!.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w500,
      );
  static get labelMediumBlack900_1 => theme.textTheme.labelMedium!.copyWith(
        color: appTheme.black900,
      );
  static get labelMediumGreenA700 => theme.textTheme.labelMedium!.copyWith(
        color: appTheme.greenA700,
        fontWeight: FontWeight.w600,
      );
  static get labelMediumInterPrimaryContainer =>
      theme.textTheme.labelMedium!.inter.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
        fontWeight: FontWeight.w500,
      );
  static get labelMediumPrimary => theme.textTheme.labelMedium!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get labelMediumPrimaryContainer =>
      theme.textTheme.labelMedium!.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(0.6),
      );
  static get labelMediumPrimaryContainerMedium =>
      theme.textTheme.labelMedium!.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(0.5),
        fontWeight: FontWeight.w500,
      );
  static get labelMediumPrimaryContainerMedium_1 =>
      theme.textTheme.labelMedium!.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
        fontWeight: FontWeight.w500,
      );
  static get labelMediumPrimaryContainer_1 =>
      theme.textTheme.labelMedium!.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
      );
  static get labelMediumPrimaryContainer_2 =>
      theme.textTheme.labelMedium!.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
      );
  static get labelMediumRed500 => theme.textTheme.labelMedium!.copyWith(
        color: appTheme.red500,
        fontWeight: FontWeight.w600,
      );
  static get labelMediumff000000 => theme.textTheme.labelMedium!.copyWith(
        color: Color(0XFF000000),
      );
  static get labelSmallBlack900 => theme.textTheme.labelSmall!.copyWith(
        color: appTheme.black900,
        fontSize: 9,
        fontWeight: FontWeight.w600,
      );
  static get labelSmallBlack900Medium => theme.textTheme.labelSmall!.copyWith(
        color: appTheme.black900,
        fontSize: 9,
        fontWeight: FontWeight.w500,
      );
  static get labelSmallBlack900_1 => theme.textTheme.labelSmall!.copyWith(
        color: appTheme.black900,
      );
  static get labelSmallPoppinsPrimaryContainer =>
      theme.textTheme.labelSmall!.poppins.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
        fontWeight: FontWeight.w600,
      );
  static get labelSmallPrimaryContainer => theme.textTheme.labelSmall!.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
        fontWeight: FontWeight.w500,
      );
  static get labelSmallPrimaryContainerMedium =>
      theme.textTheme.labelSmall!.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
        fontWeight: FontWeight.w500,
      );
  static get labelSmallPrimaryContainer_1 =>
      theme.textTheme.labelSmall!.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
      );
  static get labelSmallff1356c5 => theme.textTheme.labelSmall!.copyWith(
        color: Color(0XFF1356C5),
      );
  // Montserrat text style
  static get montserratBlack900 => TextStyle(
        color: appTheme.black900,
        fontSize: 5.r,
        fontWeight: FontWeight.w500,

      ).montserrat;
  static get montserratBlack900Bold => TextStyle(
        color: appTheme.black900,
        fontSize: 7,
        fontWeight: FontWeight.w700,
      ).montserrat;
  static get montserratBlack900Medium => TextStyle(
        color: appTheme.black900,
        fontSize: 7,
        fontWeight: FontWeight.w500,
      ).montserrat;
  static get montserratBlack900Medium7 => TextStyle(

        color: appTheme.black900,
        fontSize: 7,
        fontWeight: FontWeight.w500,
      ).montserrat;
  static get montserratBlack900Regular => TextStyle(
        color: appTheme.black900,
        fontSize: 7,
        fontWeight: FontWeight.w400,
      ).montserrat;
  static get montserratBlack900SemiBold => TextStyle(
        color: appTheme.black900.withOpacity(0.6),
        fontSize: 6,
        fontWeight: FontWeight.w600,
      ).montserrat;
  static get montserratOnError => TextStyle(
        color: theme.colorScheme.onError,
        fontSize: 7,
        fontWeight: FontWeight.w400,
      ).montserrat;
  static get montserratPrimaryContainer => TextStyle(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
        fontSize: 7,
        fontWeight: FontWeight.w700,
      ).montserrat;
  static get montserratPrimaryContainerBold => TextStyle(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
        fontSize: 7,
        fontWeight: FontWeight.w700,
      ).montserrat;
  static get montserratPrimaryContainerRegular => TextStyle(
        color: theme.colorScheme.primaryContainer.withOpacity(0.8),
        fontSize: 7,
        fontWeight: FontWeight.w400,
      ).montserrat;
  static get montserratPrimaryContainerRegular5 => TextStyle(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
        fontSize: 5,
        fontWeight: FontWeight.w400,
      ).montserrat;
  static get montserratPrimaryContainerRegular5_1 => TextStyle(
        color: theme.colorScheme.primaryContainer.withOpacity(0.5),
        fontSize: 5,
        fontWeight: FontWeight.w400,
      ).montserrat;
  // Poppins text style
  static get poppinsBlack900 => TextStyle(
        color: appTheme.black900.withOpacity(0.53),
        fontSize: 7,
        fontWeight: FontWeight.w400,
      ).poppins;
  static get poppinsBlack900Regular => TextStyle(
        color: appTheme.black900,
        fontSize: 6,
        fontWeight: FontWeight.w400,
      ).poppins;
  // Title text style
  static get titleLarge20 => theme.textTheme.titleLarge!.copyWith(
        fontSize: 20,
      );
  static get titleLargeBlack900 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.black900.withOpacity(0.6),
        fontSize: 20,
      );
  static get titleLargeBlack900Bold => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.black900.withOpacity(0.8),
        fontSize: 20,
        fontWeight: FontWeight.w700,
      );

  static get titleLargeff1356c5Bold => theme.textTheme.titleLarge!.copyWith(
        color: theme.primaryColor,
        fontSize: 20,
        fontWeight: FontWeight.w700,
      );
  static get titleLargeBold => theme.textTheme.titleLarge!.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.w700,
      );
  static get titleLargeBold23 => theme.textTheme.titleLarge!.copyWith(
        fontSize: 23,
        fontWeight: FontWeight.w700,
      );
  static get titleLargeInter => theme.textTheme.titleLarge!.inter.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.w700,
      );
  static get titleLargeInterGray90001 =>
      theme.textTheme.titleLarge!.inter.copyWith(
        color: appTheme.gray90001,
        fontSize: 20,
      );
  static get titleLargeInterPrimaryContainer =>
      theme.textTheme.titleLarge!.inter.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
        fontSize: 20,
        fontWeight: FontWeight.w700,
      );
  static get titleLargeLightblueA400 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.lightBlueA400,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      );
  static get titleLargeLightblueA40020 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.lightBlueA400,
        fontSize: 20,
      );
  static get titleLargeLightblueA400Bold =>
      theme.textTheme.titleLarge!.copyWith(
        color: appTheme.lightBlueA400,
        fontWeight: FontWeight.w700,
      );
  static get titleLargeOnSecondaryContainer =>
      theme.textTheme.titleLarge!.copyWith(
        color: theme.colorScheme.onSecondaryContainer,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      );
  static get titleLargePoppinsLightgreenA700 =>
      theme.textTheme.titleLarge!.poppins.copyWith(
        color: appTheme.lightGreenA700,
        fontSize: 20,
      );
  static get titleLargePrimaryContainer => theme.textTheme.titleLarge!.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
        fontSize: 21,
        fontWeight: FontWeight.w700,
      );
  static get titleLargePrimaryContainerBold =>
      theme.textTheme.titleLarge!.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
        fontWeight: FontWeight.w700,
      );
  static get titleLargePrimaryContainerSemiBold =>
      theme.textTheme.titleLarge!.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
        fontSize: 20,
        fontWeight: FontWeight.w600,
      );
  static get titleLargeff000000 => theme.textTheme.titleLarge!.copyWith(
        color: Color(0XFF000000),
        fontSize: 20,
        fontWeight: FontWeight.w700,
      );
  static get titleLargeff00c1ff => theme.textTheme.titleLarge!.copyWith(
        color: Color(0XFF00C1FF),
        fontSize: 20,
        fontWeight: FontWeight.w600,
      );
  static get titleLargeff140202 => theme.textTheme.titleLarge!.copyWith(
        color: Color(0XFF140202),
        fontSize: 20,
        fontWeight: FontWeight.w600,
      );
  static get titleLargeffffffff => theme.textTheme.titleLarge!.copyWith(
        color: Color(0XFFFFFFFF),
        fontSize: 20,
      );
  static get titleLargeffffffffBold => theme.textTheme.titleLarge!.copyWith(
        color: Color(0XFFFFFFFF),
        fontSize: 20,
        fontWeight: FontWeight.w700,
      );
  static get titleMedium16 => theme.textTheme.titleMedium!.copyWith(
        fontSize: 16,
      );
  static get titleMedium16_1 => theme.textTheme.titleMedium!.copyWith(
        fontSize: 16,
      );
  static get titleMedium19 => theme.textTheme.titleMedium!.copyWith(
        fontSize: 19,
      );
  static get titleMediumBlack900 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.black900.withOpacity(0.8),
        fontSize: 16,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumBlack90016 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.black900.withOpacity(0.8),
        fontSize: 16,
      );
  static get titleMediumBlack90016_1 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.black900.withOpacity(0.6),
        fontSize: 16,
      );
  static get titleMediumBlack900Bold => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.black900.withOpacity(0.8),
        fontWeight: FontWeight.w700,
      );
  static get titleMediumBlack900SemiBold =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.black900.withOpacity(0.6),
        fontSize: 16,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumBold => theme.textTheme.titleMedium!.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumBold16 => theme.textTheme.titleMedium!.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumBold_1 => theme.textTheme.titleMedium!.copyWith(
        fontWeight: FontWeight.w700,
      );
  static get titleMediumBold_2 => theme.textTheme.titleMedium!.copyWith(
        fontWeight: FontWeight.w700,
      );
  static get titleMediumGray500cc => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray500Cc,
        fontSize: 19,
      );
  static get titleMediumGray500cc19 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray500Cc,
        fontSize: 19,
      );
  static get titleMediumGray500cc_1 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray500Cc,
      );
  static get titleMediumGray500cc_2 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray500Cc,
      );
  static get titleMediumGray500cc_3 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray500Cc,
      );
  static get titleMediumGray500cc_4 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray500Cc,
      );
  static get titleMediumInter => theme.textTheme.titleMedium!.inter.copyWith(
        fontWeight: FontWeight.w700,
      );
  static get titleMediumInterGray90001 =>
      theme.textTheme.titleMedium!.inter.copyWith(
        color: appTheme.gray90001,
      );
  static get titleMediumLightblueA400 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.lightBlueA400,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumLightblueA400Bold =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.lightBlueA400,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumLightgreen600 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.lightGreen600,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumOnSecondaryContainer =>
      theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.onSecondaryContainer.withOpacity(0.8),
        fontSize: 16,
      );
  static get titleMediumPrimary => theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get titleMediumPrimaryBold => theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumPrimaryContainer =>
      theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
        fontSize: 16,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumPrimaryContainer16 =>
      theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(0.8),
        fontSize: 16,
      );
  static get titleMediumPrimaryContainer16_1 =>
      theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
        fontSize: 16,
      );
  static get titleMediumPrimaryContainerBold =>
      theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
        fontWeight: FontWeight.w700,
      );
  static get titleMediumPrimaryContainerBold16 =>
      theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
        fontSize: 16,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumPrimaryContainerSemiBold =>
      theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
        fontSize: 17,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumPrimaryContainerSemiBold17 =>
      theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
        fontSize: 17,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumPrimaryContainerSemiBold_1 =>
      theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
        fontWeight: FontWeight.w600,
      );
  static get titleMediumPrimaryContainer_1 =>
      theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(0.7),
      );
  static get titleMediumPrimaryContainer_2 =>
      theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(0.8),
      );
  static get titleMediumPrimaryContainer_3 =>
      theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
      );
  static get titleMediumPrimary_1 => theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get titleMediumSemiBold => theme.textTheme.titleMedium!.copyWith(
        fontWeight: FontWeight.w600,
      );
  static get titleMediumSemiBold16 => theme.textTheme.titleMedium!.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumcc000000 => theme.textTheme.titleMedium!.copyWith(
        color: Color(0XCC000000),
        fontSize: 16,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumcc00000016 => theme.textTheme.titleMedium!.copyWith(
        color: Color(0XCC000000),
        fontSize: 16,
      );
  static get titleMediumcc000000Bold => theme.textTheme.titleMedium!.copyWith(
        color: Color(0XCC000000),
        fontWeight: FontWeight.w700,
      );
  static get titleMediumcc140202 => theme.textTheme.titleMedium!.copyWith(
        color: Color(0XCC140202),
        fontSize: 16,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumcc14020216 => theme.textTheme.titleMedium!.copyWith(
        color: Color(0XCC140202),
        fontSize: 16.w,
      );
  static get titleMediumccf20606 => theme.textTheme.titleMedium!.copyWith(
        color: Color(0XCCF20606),
        fontSize: 16,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumccffffff => theme.textTheme.titleMedium!.copyWith(
        color: Color(0XCCFFFFFF),
        fontSize: 16,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumccffffff16 => theme.textTheme.titleMedium!.copyWith(
        color: Color(0XCCFFFFFF),
        fontSize: 16,
      );
  static get titleMediumff000000 => theme.textTheme.titleMedium!.copyWith(
        color: Color(0XFF000000),
        fontSize: 16,
      );
  static get titleMediumff00000019 => theme.textTheme.titleMedium!.copyWith(
        color: Color(0XFF000000),
        fontSize: 19,
      );
  static get titleMediumff000000Bold => theme.textTheme.titleMedium!.copyWith(
        color: Color(0XFF000000),
        fontSize: 16,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumff000000Bold_1 => theme.textTheme.titleMedium!.copyWith(
        color: Color(0XFF000000),
        fontWeight: FontWeight.w700,
      );
  static get titleMediumff000000SemiB =>
      theme.textTheme.titleMedium!.copyWith(
        color: Color(0XFF000000),
        fontWeight: FontWeight.w600,
      );
  static get titleMediumff000000_1 => theme.textTheme.titleMedium!.copyWith(
        color: Color(0XFF000000),
      );
  static get titleMediumff1356c5_1 => theme.textTheme.titleMedium!.copyWith(
    color: Color(0XFF1356C5),
  );
  static get titleMediumff00c1ff => theme.textTheme.titleMedium!.copyWith(
        color: Color(0XFF00C1FF),
        fontWeight: FontWeight.w600,
      );
  static get titleMediumff00c1ff16 => theme.textTheme.titleMedium!.copyWith(
        color: Color(0XFF00C1FF),
        fontSize: 16,
      );
  static get titleMediumff00c1ff19 => theme.textTheme.titleMedium!.copyWith(
        color: Color(0XFF00C1FF),
        fontSize: 19,
      );
  static get titleMediumff00c1ffBold => theme.textTheme.titleMedium!.copyWith(
        color: Color(0XFF00C1FF),
        fontSize: 16,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumff00c1ffBold_1 => theme.textTheme.titleMedium!.copyWith(
        color: Color(0XFF00C1FF),
        fontWeight: FontWeight.w700,
      );
  static get titleMediumff01a0e2 => theme.textTheme.titleMedium!.copyWith(
        color: Color(0XFF01A0E2),
        fontWeight: FontWeight.w700,
      );
  static get titleMediumff264588 => theme.textTheme.titleMedium!.copyWith(
        color: Color(0XFF264588),
        fontSize: 16,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumffffffff => theme.textTheme.titleMedium!.copyWith(
        color: Color(0XFFFFFFFF),
        fontWeight: FontWeight.w600,
      );
  static get titleMediumffffffffBold => theme.textTheme.titleMedium!.copyWith(
        color: Color(0XFFFFFFFF),
        fontSize: 16,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumffffffffSemiBold =>
      theme.textTheme.titleMedium!.copyWith(
        color: const Color(0XFFFFFFFF),
        fontSize: 19,
        fontWeight: FontWeight.w700,
      );
  static get titleSmallBlack900 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.black900.withOpacity(0.7),
        fontWeight: FontWeight.w600,
      );
  static get titleSmallBlack90015 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.black900.withOpacity(0.7),
        fontSize: 15,
      );
  static get titleSmallBlack900_1 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.black900.withOpacity(0.8),
      );
  static get titleSmallBlack900_2 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.black900.withOpacity(0.4),
      );
  static get titleSmallBlack900_3 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.black900.withOpacity(0.6),
      );
  static get titleSmallBlack900_4 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.black900.withOpacity(0.8),
      );
  static get titleSmallBluegray80001 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.blueGray80001,
        fontSize: 15.w,
        fontWeight: FontWeight.w700,
      );
  static get titleSmallBold => theme.textTheme.titleSmall!.copyWith(
        fontWeight: FontWeight.w700,
      );
  static get titleSmallInterBlack900 =>
      theme.textTheme.titleSmall!.inter.copyWith(
        color: appTheme.black900.withOpacity(0.85),
      );
  static get titleSmallInterPrimary =>
      theme.textTheme.titleSmall!.inter.copyWith(
        color: theme.colorScheme.primary,
      );
  static get titleSmallInterPrimaryContainer =>
      theme.textTheme.titleSmall!.inter.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
        fontWeight: FontWeight.w700,
      );
  static get titleSmallInterff000000 =>
      theme.textTheme.titleSmall!.inter.copyWith(
        color: Color(0XFF000000),
        fontWeight: FontWeight.w700,
      );
  static get titleSmallInterff00c1ff =>
      theme.textTheme.titleSmall!.inter.copyWith(
        color: Color(0XFF00C1FF),
        fontWeight: FontWeight.w700,
      );
  static get titleSmallLightblueA400 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.lightBlueA400,
        fontWeight: FontWeight.w700,
      );
  static get titleSmallLightblueA400_1 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.lightBlueA400,
      );
  static get titleSmallLightgreenA700 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.lightGreenA700,
        fontWeight: FontWeight.w700,
      );
  static get titleSmallPrimary => theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get titleSmallPrimaryContainer => theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
        fontSize: 15,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallPrimaryContainerBold =>
      theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
        fontWeight: FontWeight.w700,
      );
  static get titleSmallPrimaryContainerSemiBold =>
      theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
        fontSize: 15,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallPrimaryContainerSemiBold_1 =>
      theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
        fontWeight: FontWeight.w600,
      );
  static get titleSmallPrimaryContainer_1 =>
      theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
      );
  static get titleSmallPrimarySemiBold => theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallRed500 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.red500,
        fontWeight: FontWeight.w700,
      );
  static get titleSmallff000000 => theme.textTheme.titleSmall!.copyWith(
        color: Color(0XFF000000),
        fontWeight: FontWeight.w700,
      );
  static get titleSmallff000000_1 => theme.textTheme.titleSmall!.copyWith(
        color: Color(0XFF000000),
      );
}

extension on TextStyle {
  TextStyle get montserrat {
    return copyWith(
      fontFamily: 'Montserrat',
    );
  }

  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }

  TextStyle get palanquin {
    return copyWith(
      fontFamily: 'Palanquin',
    );
  }

  TextStyle get montez {
    return copyWith(
      fontFamily: 'Montez',
    );
  }

  TextStyle get poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }
}
