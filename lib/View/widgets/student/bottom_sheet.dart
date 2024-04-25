import 'dart:convert';

import 'package:edushalaacademy/View/Student/pending_inquries.dart';
import 'package:edushalaacademy/controllers/StudentController/pakege_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../theme/app_decoration.dart';
import '../../../theme/custom_button_style.dart';
import '../../../theme/theme_helper.dart';
import '../custom_elevated_button.dart';

class AddBasicDetailsBottomsheet extends StatelessWidget {
  final int? id;
  final List? about;
  final String? name;
  const AddBasicDetailsBottomsheet({super.key,this.id,this.about,this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: 17.w,
        vertical: 19.h,
      ),
      decoration: AppDecoration.fillPrimaryContainer.copyWith(
        borderRadius: BorderRadiusStyle.customBorderTL25,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 66.w,
            child: Divider(
              color: appTheme.black900.withOpacity(0.4),
            ),
          ),
          SizedBox(height: 18.h),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 3.w),
              child: RichText(
                text:  TextSpan(
                  children: [
                    const TextSpan(
                      text: "About ",
                        style: TextStyle(fontSize: 18,fontFamily: "Montserrat",color: Colors.black)
                    ),
                    TextSpan(
                      text: " $name ",
                        style: const TextStyle(fontSize: 18,fontFamily: "Montserrat",color:Colors.black,fontWeight: FontWeight.bold)
                    ),
                    const TextSpan(
                      text: "Tutors",
                        style: TextStyle(fontSize: 18,fontFamily: "Montserrat",color: Colors.black)
                    ),
                  ],
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          SizedBox(height: 9.h),
          if(about!.isNotEmpty) ListView.builder(
            shrinkWrap: true,
            itemCount: about!.length,
            itemBuilder: (context, index) =>  Padding(
              padding: EdgeInsets.only(
                top: 5,bottom: 5,
                left: 3.w,
                right: 11.w,
              ),
              child: _buildLoremIpsumDolor(
                loremIpsumDolor: about![index]??'',
              ),
            ),
          ),
          SizedBox(height: 42.h),
          CustomElevatedButton(
            onPressed: () {
              PackageDetails().createEnquiry(id).then((value) {
                Map<String, dynamic> response = json.decode(value);
                print(response);
                if (response["is_error"] != null && response["is_error"] == false) {
                  Fluttertoast.showToast(msg: response["message"]);
                  Get.to(() => const PendingInquiries());
                } else {
                  String errorMessage = response["message"] ?? "An error occurred";
                  Fluttertoast.showToast(msg: errorMessage);
                }
              });
            },
            text: "Continue with $name",
            margin: EdgeInsets.only(right: 6.w),
            decoration: CustomButtonStyles.gradientPrimaryToBlueDecoration,
          ),
          SizedBox(height: 26.h),
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Text(
              "Cancel",
              style: TextStyle(fontSize: 18,fontFamily: "Montserrat"),
              // style: CustomTextStyles.titleMediumMedium,
            ),
          ),
          SizedBox(height: 15.h),
        ],
      ),
    );
  }

  Widget _buildLoremIpsumDolor({required String loremIpsumDolor}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       const Icon(Icons.check_circle,color: Color(0xFF00C2FF),size: 18,),
        Expanded(
          child: Container(
            width: 309.h,
            margin: EdgeInsets.only(left: 12.h),
            child: Text(
              loremIpsumDolor,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodySmall!.copyWith(
                color: appTheme.black900,
                height: 1.25,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
