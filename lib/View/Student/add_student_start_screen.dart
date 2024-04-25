import 'package:edushalaacademy/View/onBoarding/kyc_step_1/select_cat.dart';
import'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../theme/custom_button_style.dart';
import '../../theme/custom_text_style.dart';
import '../../utils/image_constant.dart';
import '../widgets/custom_elevated_button.dart';
class AddStudentStartScreen extends StatefulWidget {
  const AddStudentStartScreen({super.key});

  @override
  State<AddStudentStartScreen> createState() => _AddStudentStartScreenState();
}

class _AddStudentStartScreenState extends State<AddStudentStartScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 40,
        ),
        child: Column(
          children: [
            const Spacer(
              flex: 52,
            ),
            SvgPicture.asset(
              ImageConstant.imgUndrawOnlineL,
              height: 192,
              // width: 266,
            ),
            const SizedBox(height: 56),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Add your first ",
                    style: CustomTextStyles.titleMediumff000000Bold_1,
                  ),
                  TextSpan(
                    text: "Student",
                    style: CustomTextStyles.titleMediumff00c1ffBold_1,
                  ),
                ],
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 37),
            Container(
              // width: 314,
              margin: const EdgeInsets.only(
                left: 12,
                right: 22,
              ),
              child: Text(
                "You need to complete the KYC to respond on Leads. It may take up to 10 minutes.",
                // maxLines: 2,
                // overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: CustomTextStyles.bodyMediumMontserrat_1,
              ),
            ),
            const Spacer(
              flex: 47,
            ),
            CustomElevatedButton(
              onPressed: () {
                Get.to(()=> SelectCategory(isParent: true,));
              },
              text: "Add Student",
              decoration: CustomButtonStyles.gradientPrimaryToBlueDecoration,
            ),
            const SizedBox(height: 21),
            Text(
              "I’ll do it later",
              style: CustomTextStyles.bodyLargeBlack900,
            ),
          ],
        ),
      ),
    );
  }
}
