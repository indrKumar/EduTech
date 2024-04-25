import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../theme/theme_helper.dart';

// Import other dependencies and models if needed

// CustomTextFormField widget
class CustomTextFormField extends StatelessWidget {
   CustomTextFormField({
    Key? key,
    this.alignment,
    this.width,
    this.scrollPadding,
    this.controller,
    this.focusNode,
    this.autofocus = true,
    this.textStyle,
    this.obscureText = false,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.maxLines,
    this.hintText,
    this.hintStyle,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.contentPadding,
    this.borderDecoration,
    this.fillColor,
    this.filled = true,
    this.validator,
    this.inputFormatter,
    this.readOnly,
    this.onTap,
    this.onFieldSubmitted,
    this.textCapitalization,
  }) : super(key: key);

  final Alignment? alignment;
  final double? width;
  final TextEditingController? scrollPadding;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool? autofocus;
  final TextStyle? textStyle;
  final bool? obscureText;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final int? maxLines;
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? prefix;
  final BoxConstraints? prefixConstraints;
  final Widget? suffix;
  final BoxConstraints? suffixConstraints;
  final EdgeInsets? contentPadding;
  final InputBorder? borderDecoration;
  final Color? fillColor;
  final bool? filled;
  final TextInputFormatter? inputFormatter;
  final bool? readOnly;
  final void Function()? onTap;
  final TextCapitalization? textCapitalization;
  final FormFieldValidator<String>? validator;
    void Function(String)? onFieldSubmitted;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.maxFinite,
      child: TextFormField(
        onFieldSubmitted: onFieldSubmitted,
        textCapitalization: textCapitalization ?? TextCapitalization.sentences,
        onTap: onTap,
        readOnly: readOnly ?? false,
        inputFormatters: inputFormatter != null ? [inputFormatter!] : null,
        scrollPadding: EdgeInsets.only(
          bottom: MediaQuery.of(Get.context!).viewInsets.bottom,
        ),
        controller: controller,
        focusNode: focusNode ?? FocusNode(),
        autofocus: autofocus!,
        style: textStyle ?? TextStyle(fontSize: 15, color: Colors.black),
        obscureText: obscureText!,
        textInputAction: textInputAction!,
        keyboardType: textInputType!,
        maxLines: maxLines ?? 1,
        decoration: InputDecoration(
          hintText: hintText ?? '',
          hintStyle: hintStyle ?? TextStyle(fontSize: 15, color: Colors.grey),
          prefixIcon: prefix,
          prefixIconConstraints: prefixConstraints,
          suffixIcon: suffix,
          suffixIconConstraints: suffixConstraints,
          isDense: true,
          contentPadding: contentPadding ?? EdgeInsets.all(15.h),
          fillColor: fillColor ?? Colors.white,
          filled: filled!,
          border: borderDecoration ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(22.h),
                borderSide: BorderSide(
                  color: theme.colorScheme.primary,
                  width: 1,
                ),
              ),
          enabledBorder: borderDecoration ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(22.h),
                borderSide: BorderSide(
                  color: theme.colorScheme.primary,
                  width: 1,
                ),
              ),
          focusedBorder: borderDecoration ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(22.h),
                borderSide:  BorderSide(
                  color: theme.colorScheme.primary,
                  width: 1,
                ),
              ),
        ),
        validator: validator,
      ),
    );
  }
}
/// Extension on [CustomTextFormField] to facilitate inclusion of all types of border style etc
extension TextFormFieldStyleHelper on CustomTextFormField {
  static OutlineInputBorder get outlinePrimaryTL22 => OutlineInputBorder(
    borderRadius: BorderRadius.circular(22.h),
    borderSide: BorderSide(
      color: theme.colorScheme.primary.withOpacity(0.08),
      width: 1,
    ),
  );
  static OutlineInputBorder get outlinePrimaryTL14 => OutlineInputBorder(
    borderRadius: BorderRadius.circular(14.h),
    borderSide: BorderSide(
      color: theme.colorScheme.primary,
      width: 1,
    ),
  );
  static OutlineInputBorder get outlinePrimaryTL10 => OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.h),
    borderSide: BorderSide(
      color: theme.colorScheme.primary,
      width: 1,
    ),
  );
  static OutlineInputBorder get fillGray => OutlineInputBorder(
    borderRadius: BorderRadius.circular(5.h),
    borderSide: BorderSide.none,
  );
  static OutlineInputBorder get fillPrimaryContainer => OutlineInputBorder(
    borderRadius: BorderRadius.circular(12.h),
    borderSide: BorderSide.none,
  );
}
