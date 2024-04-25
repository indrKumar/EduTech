import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../theme/app_decoration.dart';
import '../../../theme/custom_button_style.dart';
import '../../widgets/custom_elevated_button.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:_buildStartRecording(),
    );
  }
  Widget _buildStartRecording() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 11.h,
          vertical: 19.w,
        ),
        decoration: AppDecoration.outlineBlack9003,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 7.w),
            CustomElevatedButton(
              text: "Start Recording",
              decoration: CustomButtonStyles.gradientPrimaryToBlueDecoration,
            ),
          ],
        ),
      ),
    );

  }
}
