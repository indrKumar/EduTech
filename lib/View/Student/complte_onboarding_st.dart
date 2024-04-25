import 'package:edushalaacademy/View/Student/Student_main/main_actity_student.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../theme/custom_button_style.dart';
import '../../theme/custom_text_style.dart';
import '../widgets/custom_elevated_button.dart';

class StudentOnboardingSuccess extends StatefulWidget {
  const StudentOnboardingSuccess({super.key});

  @override
  State<StudentOnboardingSuccess> createState() =>
      _StudentOnboardingSuccessState();
}

class _StudentOnboardingSuccessState extends State<StudentOnboardingSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        const Align(
          alignment: Alignment.center,
          child: Image(
            width: double.infinity,
            image: AssetImage("assets/images/student-list.png"),
            height: double.infinity,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          top: 50,
          left: 11,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Great",
                style: TextStyle(
                    fontSize: 35,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: 3.h),
              Text(
                "Here are the next steps",
                style: CustomTextStyles.bodyLargePrimaryContainer,
              ),
              SizedBox(height: 28.h),
              const Image(image: AssetImage("assets/images/Group 46641.png")),
              SizedBox(height: 29.h),
              const Text(
                "There are 2 steps in this video",
                style: TextStyle(
                    fontFamily: "Montserrat", color: Colors.white),
              ),
              SizedBox(height: 28.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: "Step 1: ",
                        ),
                        TextSpan(
                          text: "Introduction There are 2 steps in this video",
                        ),
                      ],
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 10.h),
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: "Step 1: ",
                        ),
                        TextSpan(
                          text: "Problem Solving There are 2 steps in this video",
                        ),
                      ],
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ],
          ),
        ),

        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Container(
            width: double. infinity,
            color: Colors.white,
            height: 100,
          ),
        )
      ]),
      floatingActionButton: _buildContinue(),
    );
  }

  Widget _buildContinue() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.symmetric(
          // horizontal: 20.w,
          // vertical: 19.h,
        ),
        // decoration: AppDecoration.outlineBlack90011,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Column(

            mainAxisSize: MainAxisSize.min,
            children: [
              CustomElevatedButton(
                onPressed: () {
                  Get.to(()=>const MainActivityStudent());
                },
                text: "Continue",
                decoration: CustomButtonStyles.gradientPrimaryToBlueDecoration,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
