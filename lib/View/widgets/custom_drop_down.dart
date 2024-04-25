


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../models/dropdown_popup.dart';
import '../../theme/theme_helper.dart';

class CustomDropDown extends StatelessWidget {
  CustomDropDown({
    Key? key,
    this.alignment,
    this.width,
    this.focusNode,
    this.icon,
    this.autofocus = true,
    this.textStyle,
    this.items,
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
    this.value,
    this.validator,
    this.onChanged,
    this.sub,
  }) : super(
    key: key,
  );

  final Alignment? alignment;

  final double? width;
   bool? sub = false;
  final FocusNode? focusNode;

  final Widget? icon;

  final bool? autofocus;

  final TextStyle? textStyle;

  final List<SelectionPopupModel>? items;

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

  final FormFieldValidator<SelectionPopupModel>? validator;
var value;
  final Function(SelectionPopupModel)? onChanged;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
      alignment: alignment ?? Alignment.center,
      child: dropDownWidget,
    )
        : dropDownWidget;
  }

  Widget get dropDownWidget => SizedBox(
    width: width ?? double.maxFinite,
    child: DropdownButtonFormField<SelectionPopupModel>(
      value: value,
      focusNode: focusNode ?? FocusNode(),
      icon: icon?? const Icon(
      Icons.keyboard_arrow_down_sharp,
      size: 32,
      color: Color(0xFF00C2FF),
    ),
      autofocus: autofocus!,
      style: textStyle ?? const TextStyle(fontSize: 15, color: Colors.black26),
      items: items?.map((SelectionPopupModel item) {
        return DropdownMenuItem<SelectionPopupModel>(
          value: item,
          child: Text(
              sub == true ? item.title.substring(0, item.title.toString().length - 2):item.title,
            overflow: TextOverflow.ellipsis,
            style: hintStyle ?? const TextStyle(fontSize: 15, color: Colors.black),
          ),
        );
      }).toList(),
      isExpanded: true,
      decoration: decoration,
      validator: validator,
      onChanged: (value) {
        onChanged!(value!);
      },
    ),
  );
  InputDecoration get decoration => InputDecoration(
    hintText: hintText ?? "",
    hintStyle: hintStyle ?? const TextStyle(fontSize: 15, color: Colors.grey),
    prefixIcon: prefix,
    prefixIconConstraints: prefixConstraints,
    suffixIcon: suffix,
    suffixIconConstraints: suffixConstraints,
    isDense: true,
    contentPadding: contentPadding ?? EdgeInsets.all(15.h),
    fillColor:
    fillColor ?? theme.colorScheme.primaryContainer.withOpacity(1),
    filled: filled,
    border: borderDecoration ??
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(22.h),
          borderSide: BorderSide(
            color: theme.colorScheme.primary.withOpacity(0.08),
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
          borderSide: BorderSide(
            color: theme.colorScheme.primary,
            width: 1,
          ),
        ),
  );
}

/// Extension on [CustomDropDown] to facilitate inclusion of all types of border style etc
extension DropDownStyleHelper on CustomDropDown {

  static OutlineInputBorder get fillGray => OutlineInputBorder(
    borderRadius: BorderRadius.circular(12.h),
    borderSide: BorderSide.none,
  );
}

