import 'package:edushalaacademy/utils/size_utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../theme/theme_helper.dart';

class CustomPinCodeTextField extends StatelessWidget {
  CustomPinCodeTextField({
    Key? key,
    required this.context,
    required this.onChanged,
    this.alignment,
    this.controller,
    this.textStyle,
    this.hintStyle,
    this.validator,
  }) : super(
          key: key,
        );

  final Alignment? alignment;

  final BuildContext context;

  final TextEditingController? controller;

  final TextStyle? textStyle;

  final TextStyle? hintStyle;

  Function(String) onChanged;

  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: pinCodeTextFieldWidget,
          )
        : pinCodeTextFieldWidget;
  }

  Widget get pinCodeTextFieldWidget => GestureDetector(
    onTap: () {
      // Ensure the keyboard opens when the container is tapped
      FocusScope.of(context).requestFocus(FocusNode());
    },
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(color: theme.colorScheme.primary),
        borderRadius: BorderRadius.circular(25.w),
        color: theme.colorScheme.primaryContainer.withOpacity(1),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 7, left: 50, right: 50),
        child: PinCodeTextField(
          appContext: context,
          controller: controller,
          length: 4,
          keyboardType: TextInputType.number,
          textStyle: textStyle,
          hintStyle: hintStyle,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
          ],
          pinTheme: PinTheme(
            fieldHeight: 26.h,
            fieldWidth: 26.h,
            inactiveFillColor: appTheme.greenA700,
            activeFillColor: appTheme.greenA700,
            inactiveColor: Colors.grey,
          ),
          onChanged: (value) => onChanged(value),
          validator: validator,
        ),
      ),
    ),
  );

}
