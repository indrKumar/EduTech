import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../theme/custom_text_style.dart';
import 'base_button.dart';

class CustomElevatedButton extends BaseButton {
  CustomElevatedButton({
    Key? key,
    this.decoration,
  this.mainAxisAlignment,
    this.leftIcon,
    this.rightIcon,
    EdgeInsets? margin,
    void Function()? onPressed,
    Alignment? alignment,
    TextStyle? buttonTextStyle,
    bool? isDisabled,
    double? height,
    double? width,
    required String text,
  }) : super(
          text: text,
          onPressed: onPressed,
          isDisabled: isDisabled,
          buttonTextStyle: buttonTextStyle,
          height: height,
          width: width,
          alignment: alignment,
          margin: margin,
        );
  MainAxisAlignment? mainAxisAlignment;
  final BoxDecoration? decoration;

  final Widget? leftIcon;

  final Widget? rightIcon;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: buildElevatedButtonWidget,
          )
        : buildElevatedButtonWidget;
  }

  Widget get buildElevatedButtonWidget => GestureDetector(
    onTap: onPressed,
    child: Container(
          height: height ?? 50.h,
          width: width ?? double.maxFinite,
          margin: margin,
          decoration: decoration?? BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(23.h)),
              gradient: const LinearGradient(colors: [
            Color(0xFF1356C5),
            Color(0xFF093C90),
          ])),
          child: Row(
            mainAxisAlignment: mainAxisAlignment??MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              leftIcon ?? const SizedBox.shrink(),
              Text(
                text,
                style: buttonTextStyle ??
                    CustomTextStyles.titleMediumPrimaryContainer16_1,
              ),
              rightIcon ?? const SizedBox.shrink(),
            ],
          ),
        ),
  );
}
