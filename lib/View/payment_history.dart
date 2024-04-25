import 'package:dotted_line/dotted_line.dart';
import 'package:edushalaacademy/View/widgets/custom_elevated_button.dart';
import 'package:edushalaacademy/View/widgets/custom_image_view.dart';
import 'package:edushalaacademy/View/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../theme/app_decoration.dart';
import '../theme/custom_button_style.dart';
import '../theme/custom_text_style.dart';
import '../theme/theme_helper.dart';
import '../utils/image_constant.dart';
class PaymentsHistory extends StatefulWidget {
  const PaymentsHistory({super.key});

  @override
  State<PaymentsHistory> createState() => _PaymentsHistoryState();
}

class _PaymentsHistoryState extends State<PaymentsHistory> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(Icons.arrow_back_ios,color: Colors.white,size: 20,)),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title:  Text(
        "Payments History",
        style: TextStyle(
          color: Colors.white,
          fontSize: 21,
          fontFamily: "Montserrat",
          fontWeight: FontWeight.bold
        )
      ),),
      backgroundColor: theme.primaryColor,
      body: Container(
        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))),
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(
          horizontal: 11,
          vertical: 11,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 14),

            SizedBox(height: 31),
            _buildUserProfile(),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildUserProfile() {
    return Expanded(
      child:  ListView.separated(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (
              context,
              index,
              ) {
            return SizedBox(
              height: 14,
            );
          },
          itemCount:6,
          itemBuilder: (context, index) {
            return GestureDetector(
             onTap: () {
               showModalBottomSheet(context: context, builder: (context) {
                 return bottomSheet();
               },);
             },
              child: Container(
                decoration: AppDecoration.fillPrimary2.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder13,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(right: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomOutlinedButton(
                              height: 19,
                              width: 74,
                              text: "DUE",
                              margin: EdgeInsets.only(bottom: 3),
                              buttonStyle: CustomButtonStyles.outlineRedATL15,
                              buttonTextStyle: CustomTextStyles.labelSmallBlack900_1,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 9),
                              child:
                                    Text(
                                      "Jan 12, 2023  08:14PM",
                                  style: CustomTextStyles.bodySmallBluegray100,
                                ),
                              ),

                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 11),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 19,
                        right: 11,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                        "Student 1, Student 2, Student 3",
                              style: CustomTextStyles.labelLargeBlack900_4,
                            ),
                                 Text(
                                   'Rs 8500',
                              style: CustomTextStyles.labelLargeRedA700Bold,
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 19),
                        child:
                        Text(
                          'Cycle',
                            style: CustomTextStyles.bodySmallOnError,
                          ),
                        ),
                      ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                        vertical: 6
                      ),
                      child: SizedBox(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            const DottedLine(
                              direction: Axis.horizontal,
                              alignment: WrapAlignment.center,
                              lineLength: double.infinity,
                              lineThickness: 2.0,
                              dashLength: 10.0,
                              dashColor: Colors.black38,
                              dashRadius: 2.0,
                              dashGapLength: 5.0,
                              dashGapColor: Colors.transparent,
                              dashGapRadius: 2.0,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: 39,
                                  right: 42,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 15,
                                  width: 15,
                                  decoration: BoxDecoration(
                                    color: appTheme.redA700,
                                    borderRadius: BorderRadius.circular(
                                      7,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 15,
                                  width: 15,
                                  decoration: BoxDecoration(
                                    color: appTheme.greenA700,
                                    borderRadius: BorderRadius.circular(
                                      7,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 11),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 19,
                        right: 14,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 57,
                            margin: EdgeInsets.only(bottom: 1),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Jan 11, 2024\n",
                                    style: CustomTextStyles.bodySmallff00000010,
                                  ),
                                  TextSpan(
                                    text: "Started",
                                    style: CustomTextStyles.labelMediumff000000,
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            width: 58,
                            margin: EdgeInsets.only(left: 199),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Jan 11, 2024",
                                    style: CustomTextStyles.bodySmallff00000010,
                                  ),
                                  TextSpan(
                                    text: "Completed",
                                    style: CustomTextStyles.labelMediumff000000,
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 11),
                  ],
                ),
              ),
            );
          },
        ),
    );
  }


  Widget bottomSheet(){
    return  Padding(
      padding: EdgeInsets.only(
        left: 20,
        top: 17,
        right: 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgLine88,
            color: Colors.black,
            height: 2,
            width: 42,
          ),
          SizedBox(height: 39),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Payments Details",
              style: CustomTextStyles.titleMediumBold,
            ),
          ),
          SizedBox(height: 23),
          _buildLeaveBonusFour(
            leaveBonusText: "Regular Classes (14)",
            rsCounterText: "Rs 1300",
          ),
          SizedBox(height: 7),
          _buildLeaveBonusFour(
            leaveBonusText: "Leave Bonus (4)",
            rsCounterText: "Rs 1300",
          ),
          SizedBox(height: 7),
          _buildLeaveBonusFour(
            leaveBonusText: "Random Leave (2)",
            rsCounterText: "Rs 1300",
          ),
          SizedBox(height: 17),
          _buildLeaveBonusFour(
            leaveBonusText: "Total",
            rsCounterText: "Rs 3900",
          ),
          SizedBox(height: 37),
          CustomElevatedButton(
            text: "View Attendance for this Cycle",
            buttonTextStyle:
            CustomTextStyles.titleMediumPrimaryContainer_3,
          ),
          25.h.verticalSpace,
        ],
      ),
    );
  }
  Widget _buildLeaveBonusFour({
    required String leaveBonusText,
    required String rsCounterText,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 1),
          child: Text(
            leaveBonusText,
            style: CustomTextStyles.bodyMediumMontserrat_1.copyWith(
              color: appTheme.black900,
            ),
          ),
        ),
        Text(
          rsCounterText,
          style: theme.textTheme.titleSmall!.copyWith(
            color: appTheme.black900,
          ),
        ),
      ],
    );
  }

}
