import 'package:edushalaacademy/View/widgets/class_attandencehistory_details_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart' show CalendarCarousel;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../theme/app_decoration.dart';
import '../../theme/custom_button_style.dart';
import '../../theme/custom_text_style.dart';
import '../../theme/theme_helper.dart';
import '../../utils/image_constant.dart';
import '../widgets/custom_image_view.dart';
import '../widgets/custom_outlined_button.dart';

class AttendanceHistory extends StatefulWidget {
  const AttendanceHistory({super.key});

  @override
  State<AttendanceHistory> createState() => _AttendanceHistoryState();
}

class _AttendanceHistoryState extends State<AttendanceHistory>  with SingleTickerProviderStateMixin{
  // ClassManagementTwoController controller =
  // Get.put(ClassManagementTwoController(ClassManagementTwoModel().obs));
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(Icons.arrow_back_ios,color: Colors.white,)),
        centerTitle: true,
        title: const Text("Arvind Kumar Pandey",style: TextStyle(color: Colors.white,fontSize: 21,fontWeight: FontWeight.bold),),
        backgroundColor: theme.primaryColor,
      ),
      backgroundColor: theme.colorScheme.primary,
      body: SizedBox(
        child: Padding(
          padding: const EdgeInsets.only(top:10),
          child: Container(
            decoration: AppDecoration.fillGray.copyWith(
              borderRadius: BorderRadiusStyle.customBorderTL25,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  25.h.verticalSpace,
              SingleChildScrollView(

              scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    5,
                        (index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index; // U// pdate the selected index
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.grey.shade300),
                            color: selectedIndex == index ? theme.primaryColor : Colors.grey.shade200, // Color based on selection
                          ),
                          // height: 30,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                            child: Center(
                              child: Text(
                                "Cycle ${index-1}", // Display items starting from the last index
                                style: TextStyle(color: selectedIndex == index ? Colors.white : Colors.black, fontSize: 16, fontFamily: "Montserrat"),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ).toList().reversed.toList(), // Reverse the list
                ),
              ),
                  25.h.verticalSpace,
                  _buildTotalHours1(),
                  25.h.verticalSpace,
                  Divider(
                    color: appTheme.gray50001,
                  ),
                  const SizedBox(height: 19),
                  TabBar(
                    controller: _controller,
                    indicatorColor: Colors.white,
                    labelColor: Colors.white,
                    indicator: BoxDecoration(color: theme.primaryColor,borderRadius: BorderRadius.circular(2)),
                    tabs: [
                      Tab(child: Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.list_outlined),
                          10.h.horizontalSpace,
                        const Text("List View",
                          // style: theme.textTheme.titleSmall,
                        ),

                      ],)),
                      Tab(child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.calendar_month),
                        10.h.horizontalSpace,
                        const Text("Grid View",
                        ),
                      ],),),
                    ],),
                  20.h.verticalSpace,
                  Expanded(
                    child: TabBarView(
                      controller: _controller,
                      children: [
                       Column(children: [
                         const SizedBox(height: 17),
                         _buildStudentAbsent3(),
                         const SizedBox(height: 14),
                         GestureDetector(
                             onTap: () {
                               showModalBottomSheet(
                                 isScrollControlled: true,
                                 context: context, builder: (context) {
                                 return customDetails(context);
                               },);
                             },
                             child: _buildTwo11()),
                       ],),
                        SizedBox(
                          // height: 400,
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  height:350,
                                  child: CalendarCarousel(
                                    showOnlyCurrentMonthDate: false,
                                    showHeader: false,
                                  ),
                                ),
                                10.h.verticalSpace,
                                Padding(
                                  padding: const EdgeInsets.only(right: 11),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                          color: appTheme.greenA700,
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: appTheme.black900.withOpacity(0.25),
                                              spreadRadius: 2,
                                              blurRadius: 2,
                                              offset: const Offset(
                                                0,
                                                0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 8,
                                          top: 2,
                                        ),
                                        child: Text(
                                          "Regular (12)",
                                          style: theme.textTheme.bodySmall,
                                        ),
                                      ),
                                      Container(
                                        height: 20,
                                        width: 20,
                                        margin: const EdgeInsets.only(left: 16),
                                        decoration: BoxDecoration(
                                          color: appTheme.amber600,
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: appTheme.black900.withOpacity(0.25),
                                              spreadRadius: 2,
                                              blurRadius: 2,
                                              offset: const Offset(
                                                0,
                                                0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 8,
                                          top: 2,
                                        ),
                                        child: Text(
                                          "Leave(5)",
                                          style: theme.textTheme.bodySmall,
                                        ),
                                      ),
                                      const Spacer(),
                                      Container(
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                          color: appTheme.redA700,
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: appTheme.black900.withOpacity(0.25),
                                              spreadRadius: 2,
                                              blurRadius: 2,
                                              offset: const Offset(
                                                0,
                                                0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 8,
                                          top: 2,
                                        ),
                                        child: Text(
                                          "Recovery Class",
                                          style: theme.textTheme.bodySmall,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


  /// Section Widget
  Widget _buildTotalHours1() {
    return Container(
      decoration: AppDecoration.fillGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "This Cycle",
            style: theme.textTheme.titleSmall,
          ),
          const SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                // margin: const EdgeInsets.only(left: 12),
                padding: const EdgeInsets.symmetric(
                  horizontal: 43,
                  vertical: 2,
                ),
                decoration: AppDecoration.fillPrimary.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder7,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 6),
                    SizedBox(
                      height: 40,
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "30\n",
                              style:
                              CustomTextStyles.titleMediumffffffffSemiBold,
                            ),
                            TextSpan(
                              text: "Total Hours",
                              style: CustomTextStyles
                                  .bodyMediumMontserratffffffff13,
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                margin: const EdgeInsets.only(left: 12),
                padding: const EdgeInsets.symmetric(
                  horizontal: 43,
                  vertical: 2,
                ),
                decoration: AppDecoration.fillPrimary.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder7,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 6),
                    SizedBox(
                      height: 40,
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "30\n",
                              style:
                              CustomTextStyles.titleMediumffffffffSemiBold,
                            ),
                            TextSpan(
                              text: "Hours Left",
                              style: CustomTextStyles
                                  .bodyMediumMontserratffffffff13,
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Text(
                      "(13 Regular + 2 Recovery)",
                      style:
                      CustomTextStyles.montserratPrimaryContainerRegular5_1,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 2),
        ],
      ),
    );
  }



  /// Section Widget
  Widget _buildStudentAbsent() {
    return CustomOutlinedButton(
      height: 14,
      width: 78,
      text: "Student Absent",
      buttonStyle: CustomButtonStyles.outlineRedA,
      buttonTextStyle: CustomTextStyles.montserratBlack900Medium,
    );
  }



  /// Section Widget
  Widget _buildStudentAbsent3() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 13,
      ),
      decoration: AppDecoration.fillRedA.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 327,
            margin: const EdgeInsets.only(
              left: 4,
              right: 17,
            ),
            child: Text(
              "2 h 45 min Recovery Class added in Total hours left for this cycle!",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodyLarge!.copyWith(
                height: 1.31,
              ),
            ),
          ),
          const SizedBox(height: 23),
          Padding(
            padding: const EdgeInsets.only(
              left: 4,
              right: 76,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTwo(
                  dynamicText1: "02",
                  dynamicText2: "JAN",
                  dynamicText3: "Monday",
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 17,
                    top: 13,
                    bottom: 17,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildStudentAbsent(),
                      const SizedBox(height: 12),
                      Text(
                        "50% Recovery Class Applicable!",
                        style: theme.textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 17),
          Divider(
            color: appTheme.gray50001,
            indent: 4,
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }





  Widget _buildTwo11() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: AppDecoration.fillGreenA700.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 1),
            child: _buildTwo(
              dynamicText1: "02",
              dynamicText2: "JAN",
              dynamicText3: "Monday",
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 17,
              top: 13,
              bottom: 4,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 1),
                  child: _buildRegular(
                    regular: "Regular",
                    regular1: "Regular",
                    extra: "Extra",
                    extra1: "Extra",
                  ),
                ),

                const SizedBox(height: 8),
                SizedBox(
                  height: 9,
                  // width: 263,
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 3),
                          child: SizedBox(
                            width: 263,
                            child: Divider(
                              color: appTheme.black900.withOpacity(0.2),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: 194,
                          margin: const EdgeInsets.only(
                            left: 25,
                            right: 43,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 9,
                                width: 9,
                                decoration: BoxDecoration(
                                  color: appTheme.redA700,
                                  borderRadius: BorderRadius.circular(
                                    4,
                                  ),
                                ),
                              ),
                              Container(
                                height: 9,
                                width: 9,
                                decoration: BoxDecoration(
                                  color: appTheme.greenA700,
                                  borderRadius: BorderRadius.circular(
                                    4,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 3),
                Container(
                  width: 242,
                  margin: const EdgeInsets.only(right: 20),
                  child: Row(
                    children: [
                      Padding(
                        padding:

                        const EdgeInsets.only(top: 4),
                        child: Text(
                          "08:30 PM",
                          style: theme.textTheme.bodySmall,
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Text(
                          "1 h 27 min",
                          style: theme.textTheme.titleSmall,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 26,
                          top: 4,
                        ),
                        child: Text(
                          "09:42 PM",
                          style: theme.textTheme.bodySmall,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildTwo({
    required String dynamicText1,
    required String dynamicText2,
    required String dynamicText3,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 13,
        vertical: 7,
      ),
      decoration: AppDecoration.outlineBlack90011.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder7,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            dynamicText1,
            style: theme.textTheme.titleLarge!.copyWith(
              color: appTheme.black900,
            ),
          ),
          Text(
            dynamicText2,
            style: CustomTextStyles.labelLargeBlack900_3.copyWith(
              color: appTheme.black900.withOpacity(0.5),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            dynamicText3,
            style: CustomTextStyles.labelSmallBlack900Medium.copyWith(
              color: appTheme.black900,
            ),
          ),
        ],
      ),
    );
  }



  /// Common widget
  Widget _buildRegular({
    required String regular,
    required String regular1,
    required String extra,
    required String extra1,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                // vertical: 2,
              ),
              decoration: AppDecoration.outlinePrimary.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder7,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 1),
                  Text(
                    regular,
                    style: CustomTextStyles.montserratBlack900Medium
                        .copyWith(
                      color: appTheme.black900,
                    ),
                  ),
                ],
              ),
            ),
            20.h.horizontalSpace,
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                // vertical: 2,
              ),
              decoration: AppDecoration.outlineGreenA700.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder7,),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 1),
                  Text(
                    extra,
                    style: CustomTextStyles.montserratBlack900Medium
                        .copyWith(
                      color: appTheme.black900,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        CustomImageView(
          imagePath: ImageConstant.imgArrowRightBlueGray100,
          height: 12,
          width: 7,
          color: Colors.black38,
          margin: const EdgeInsets.only(bottom: 3),
        ),
      ],
    );
  }
}
