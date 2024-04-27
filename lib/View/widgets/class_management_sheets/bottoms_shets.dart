import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../../controllers/tutor_class_contrpller.dart';
import '../../../theme/app_decoration.dart';
import '../../../theme/custom_button_style.dart';
import '../../../theme/custom_text_style.dart';
import '../../../theme/theme_helper.dart';
import '../../../utils/image_constant.dart';
import '../custom_elevated_button.dart';
import '../custom_image_view.dart';
import '../custom_outlined_button.dart';
import '../custom_pin_code_text_field.dart';
import '../custom_text_form_field.dart';
import '../succesfull_dilog.dart';

class SheetsHelper {
  Widget groupPunchOut(BuildContext context,
      {required TutorController controller, id, cycleId,
        String? totalTime
      }) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 30,
      ),
      decoration: AppDecoration.fillPrimaryContainer.copyWith(
        borderRadius: BorderRadiusStyle.customBorderTL25,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 4),
          Text(
            "Mark Group Punch out",
            style: CustomTextStyles.titleMediumBlack900,
          ),
          const SizedBox(height: 9),
          Text(
            totalTime.toString(),
            style: CustomTextStyles.bodyLarge18,
          ),
          const SizedBox(height: 13),
          CustomTextFormField(
            // controller: controller.abhisheksTopicsCoveredvalueController,
            hintText: "Abhishek’s Topics Covered",
            maxLines: 3,
            contentPadding: const EdgeInsets.all(20),
            borderDecoration: TextFormFieldStyleHelper.outlinePrimaryTL10,
          ),
          const SizedBox(height: 11),
          CustomTextFormField(
            // controller: controller.abhisheksTopicsCoveredvalueController1,
            hintText: "Indra’s Topics Covered",
            textInputAction: TextInputAction.done,
            maxLines: 3,
            contentPadding: EdgeInsets.all(20),
            borderDecoration: TextFormFieldStyleHelper.outlinePrimaryTL10,
          ),
          const SizedBox(height: 40),
          CustomElevatedButton(
            onPressed: () async {
              print("object");
              await controller
                  .classEnd(classId: id.toString(), cycleId: cycleId)
                  .then(
                (value) async {
                  print(value);
                  if (value!["is_error"] == false) {
                    Get.back();
                    await showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return confirmation(context);
                      },
                    );
                  } else {
                    Fluttertoast.showToast(msg: value["message"].toString());
                  }
                },
              );
            },
            text: "End Class",
            buttonTextStyle: CustomTextStyles.titleMediumPrimaryContainer_3,
          ),
        ],
      ),
    );
  }

  Widget confirmation(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 33,
      ),
      decoration: AppDecoration.fillPrimaryContainer.copyWith(
        borderRadius: BorderRadiusStyle.customBorderTL25,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 3),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Are you sure you want to end Abhishek’s class?",
                    style: CustomTextStyles.titleMediumcc000000Bold,
                  ),
                ],
              ),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(height: 28),
          CustomElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => buildCustomDialog(
                  context,
                  title: "Attendance Ended Successfully!",
                ),
              );
            },
            text: "End Class (91 min)",
          ),
          SizedBox(height: 23),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Cancel",
              style: theme.textTheme.bodyMedium,
            ),
          ),
          SizedBox(height: 12),
        ],
      ),
    );
  }

  Widget startClass(BuildContext context,
      {required int id, required TutorController controller, cycle_id}) {
    late Future<StartDuModel?> _modelFuture;
    bool isRegularClassSelected = true;
    bool isCheck = true;
    _modelFuture = controller.fetchDataDur(id: id);
    double value = 0;
    print("repeat");
    return FutureBuilder<StartDuModel?>(
      future: _modelFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        }
        value = double.parse(snapshot.data!.duration.toString());
        print("Duration${snapshot.data!.duration}");

        return StatefulBuilder(
          builder: (context, setStatte) {
            return Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 17),
              decoration: AppDecoration.fillPrimaryContainer.copyWith(
                borderRadius: BorderRadiusStyle.customBorderTL25,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 4),
                    child: Text(
                      "Mark Abhishek's Attendance",
                      style: CustomTextStyles.titleMediumBlack900,
                    ),
                  ),
                  const SizedBox(height: 21),
                  Padding(
                    padding: const EdgeInsets.only(left: 4, right: 62),
                    child: Row(
                      children: [
                        buildClassContainer(
                            "Regular Class",
                            ImageConstant.imgCheckmark8Gray300,
                            isRegularClassSelected, () {
                          setStatte(() {
                            _modelFuture = controller.fetchDataDur(id: id);
                            isRegularClassSelected = true;
                            print(isRegularClassSelected);
                          });
                        }),
                        const SizedBox(
                          width: 5,
                        ),
                        buildClassContainer(
                            "Recovery Class",
                            ImageConstant.imgClock,
                            !isRegularClassSelected, () {
                          setStatte(() {
                            _modelFuture =
                                controller.fetchDataDur(id: id, recovery: "1");
                            isRegularClassSelected = false;
                          });
                        }),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  if (isRegularClassSelected == false)
                    Padding(
                      padding: EdgeInsets.only(left: 4.h),
                      child: Text(
                        "Type of Recovery Class".tr,
                        style: CustomTextStyles.labelLargeBlack900Bold_1,
                      ),
                    ),
                  if (isRegularClassSelected == false) SizedBox(height: 15),
                  if (isRegularClassSelected == false)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        4.h.horizontalSpace,
                        SizedBox(
                          height: 15,
                          width: 15,
                          child: Checkbox(
                            value: !isCheck,
                            activeColor: theme.primaryColor,
                            onChanged: (value) {
                              setStatte(() {
                                isCheck = !isCheck;
                                _modelFuture = controller.fetchDataDur(
                                    id: id, recovery: "1");
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(
                            "For Student",
                            style: CustomTextStyles.labelLargeBlack90013_1,
                          ),
                        ),
                        40.h.horizontalSpace,
                        SizedBox(
                          height: 15,
                          width: 15,
                          child: Checkbox(
                            value: isCheck,
                            activeColor: theme.primaryColor,
                            onChanged: (value) {
                              setStatte(() {
                                isCheck = !isCheck;
                                _modelFuture = controller.fetchDataDur(
                                    id: id, recovery: "1", teacher: "1");
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 9),
                          child: Text(
                            "For Teacher",
                            style: CustomTextStyles.labelLargeBlack90013_1,
                          ),
                        ),
                      ],
                    ),
                  if (isRegularClassSelected == false)
                    const SizedBox(height: 32),
                  if (isRegularClassSelected == false)
                    SfSlider(
                      shouldAlwaysShowTooltip: true,
                      thumbShape: const SfThumbShape(),
                      value: value,
                      min: 0.0,
                      max: 100,
                      thumbIcon: const ImageIcon(
                        AssetImage("assets/icon/eduicon.png"),
                        color: Colors.white,
                      ),
                      onChanged: (dynamic newValue) {
                        setStatte(() {
                          value = newValue;
                        });
                      },
                    ),
                  CustomElevatedButton(
                    onPressed: () async {
                      controller
                          .markAttendance(
                              classId: id.toString(),
                              type: "regular",
                              cycleId: cycle_id)
                          .then(
                        (value) async {
                          print(value);
                          if (value!["is_error"] == false) {
                            Get.back();
                            await showDialog(
                              context: context,
                              builder: (context) => buildCustomDialog(
                                context,
                                title: "Attendance Marked Successfully!",
                              ),
                            );
                          } else {
                            Fluttertoast.showToast(
                                msg: value["message"].toString());
                          }
                        },
                      );
                    },
                    text: "Start Class (${isRegularClassSelected == false?value.toInt():snapshot.data!.duration ?? ''} min)",
                    buttonTextStyle:
                        CustomTextStyles.titleMediumPrimaryContainer_3,
                  ),
                  const SizedBox(height: 17),
                  CustomOutlinedButton(
                    onPressed: () {
                      Get.back();
                    },
                    text: "Cancel",
                  ),
                  const SizedBox(height: 19),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget buildClassContainer(
      String title, String imagePath, bool isSelected, Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
        margin: EdgeInsets.only(left: isSelected ? 0 : 21),
        decoration: isSelected == false
            ? AppDecoration.fillGray
                .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10)
            : AppDecoration.outlinePrimary6
                .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 6),
            CustomImageView(
              color: Colors.black38,
              imagePath: imagePath,
              height: 29,
              // width: 29,
              margin: EdgeInsets.only(left: isSelected == true ? 8 : 0),
            ),
            const SizedBox(height: 9),
            Text(
              title,
              style: theme.textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget extendClass(BuildContext context,
      {id,
      cycleId,
      extendType,
      extendTime,
      recoveryFor,
      required TutorController controller,
        String? recoveryDuration

      }) {
    bool isRegularClassSelected = true;
    double value1 = 0.0;
    return StatefulBuilder(
      builder: (context, setState) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 17),
          decoration: AppDecoration.fillPrimaryContainer.copyWith(
            borderRadius: BorderRadiusStyle.customBorderTL25,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: Text(
                  "Extend Class",
                  style: CustomTextStyles.titleMediumBlack900,
                ),
              ),
              const SizedBox(height: 21),
              Padding(
                padding: EdgeInsets.only(left: 4, right: 62),
                child: Row(
                  children: [
                    buildClassContainer(
                        "Extra Class",
                        ImageConstant.imgCheckmark8Gray300,
                        isRegularClassSelected, () {
                      setState(() {
                        isRegularClassSelected = true;
                        print(isRegularClassSelected);
                      });
                    }),
                    buildClassContainer("Recovery\nClass",
                        ImageConstant.imgClock, !isRegularClassSelected, () {
                      setState(() {
                        isRegularClassSelected = false;
                      });
                    }),
                  ],
                ),
              ),
              // SizedBox(height: 32),
              // if(isRegularClassSelected == false) Padding(
              //   padding: EdgeInsets.only(left: 4.h),
              //   child: Text(
              //     "Type of Recovery Class".tr,
              //     style: CustomTextStyles.labelLargeBlack900Bold_1,
              //   ),
              // ),
              // if(isRegularClassSelected == false)  SizedBox(height: 15),
              // if(isRegularClassSelected == false)   Row(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     4.h.horizontalSpace,
              //     SizedBox(
              //       height: 15,
              //       width: 15,
              //       child: Checkbox(value: true,
              //         activeColor: theme.primaryColor,
              //         onChanged: (value) {
              //         },),
              //     ),
              //     Padding(
              //       padding: EdgeInsets.only(left: 8),
              //       child: Text(
              //         "For Student",
              //         style: CustomTextStyles.labelLargeBlack90013_1,
              //       ),
              //     ),
              //     // Spacer(),
              //     40.h.horizontalSpace,
              //     SizedBox(
              //       height: 15,
              //       width: 15,
              //       child: Checkbox(value: true,
              //         activeColor: theme.primaryColor,
              //         onChanged: (value) {
              //         },),
              //     ),
              //     Padding(
              //       padding: EdgeInsets.only(left: 9),
              //       child: Text(
              //         "For Teacher",
              //         style: CustomTextStyles.labelLargeBlack90013_1,
              //       ),
              //     ),
              //   ],
              // ),
              if (isRegularClassSelected == false) const SizedBox(height: 32),

              if (isRegularClassSelected == false)
                 Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: Row(children: [
                    const Text("Select hour ",style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                    ),),
                    Text("($recoveryDuration min Available)",style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF00C838)
                    ),)
                  ],),
                ),
              // if (isRegularClassSelected == false)
                SfSlider(
                  shouldAlwaysShowTooltip: true,
                  thumbShape: const SfThumbShape(),
                  value: value1,
                  min: 0.0,
                  max: 100.0,
                  interval: 15.0,
                  thumbIcon: const ImageIcon(
                    AssetImage("assets/icon/eduicon.png"),
                    color: Colors.white,
                  ),
                  onChanged: (value) {
                    setState(() {
                      value1 = value;
                    });

                  },
                ),
              CustomElevatedButton(
                onPressed: () async {
                  controller
                      .extendClass(
                          classId: id.toString(),
                          cycleId: cycleId,
                          recoveryFor: recoveryFor,
                          extendTime: value1.toInt(),
                          extendType: isRegularClassSelected == true
                              ? "extra"
                              : "recovery")
                      .then(
                    (value) async {
                      print(value);
                      if (value!["is_error"] == false) {
                        Get.back();
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (context) {
                            return Padding(
                              padding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom),
                              child: otp(context),
                            );
                          },
                        );
                      } else {
                        Fluttertoast.showToast(
                            msg: value["message"].toString());
                      }
                    },
                  );
                },
                text: "Start Class (${value1.toInt()} min)",
                buttonTextStyle: CustomTextStyles.titleMediumPrimaryContainer_3,
              ),
              const SizedBox(height: 17),
              CustomOutlinedButton(
                text: "Cancel",
              ),
              const SizedBox(height: 19),
            ],
          ),
        );
      },
    );
  }

  Widget otp(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 24,
      ),
      decoration: AppDecoration.fillPrimaryContainer.copyWith(
        borderRadius: BorderRadiusStyle.customBorderTL25,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            // width: 276,
            margin: EdgeInsets.only(
              left: 1,
              right: 72,
            ),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text:
                        "Please enter 4 digit code shared to the Parent’s registered mobile number +91 8887674564 | . ",
                    style: CustomTextStyles.titleMediumcc000000,
                  ),
                  TextSpan(
                    text: "Other No",
                    style: CustomTextStyles.titleMediumccf20606,
                  ),
                ],
              ),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(height: 9),
          CustomPinCodeTextField(
            context: context,
            onChanged: (p0) {},
          ),
          SizedBox(height: 45),
          CustomElevatedButton(
            onPressed: () async {
              Get.back();
              await showDialog(
                context: context,
                builder: (context) => buildCustomDialog(
                  context,
                  title: "Attendance Extended Successfully!",
                ),
              );
            },
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(20)),
            text: "Confirm Overtime".tr,
            buttonTextStyle: CustomTextStyles.titleMediumPrimaryContainer_3,
          ),
          SizedBox(height: 5),
        ],
      ),
    );
  }

  Widget leaveMark(BuildContext context,
      {id,
      cycleId,
      leaveBy,
      List<String>? leaveDays,
      required TutorController controller}) {
    bool isRegularClassSelected = true;
    bool isTodayOrSelected = true;
    List<String> listOfLeaveDay = [];

    void addDates(List<DateTime> dates) {
      DateFormat dateFormat = DateFormat('yyyy-MM-dd');

      for (var date in dates) {
        listOfLeaveDay.add(dateFormat.format(date));
      }
    }

    List<String> generateNext10Days() {
      List<String> listOfGenrate = [];
      DateFormat dateFormat = DateFormat('yyyy-MM-dd (E)');

      DateTime currentDate = DateTime.now();
      for (int i = 0; i <= 10; i++) {
        DateTime nextDate = currentDate.add(Duration(days: i));
        listOfGenrate.add(dateFormat.format(nextDate));
      }

      return listOfGenrate;
    }

    return StatefulBuilder(
      builder: (context, sestState) {
        List<String> listOfGenrate = generateNext10Days();
        List<String> selectedDates = [];

        void toggleDateSelection(String date) {
          sestState(() {
            if (selectedDates.contains(date)) {
              selectedDates.remove(date);
            } else {
              selectedDates.add(date);
            }
          });
        }

        return Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 17),
          decoration: AppDecoration.fillPrimaryContainer.copyWith(
            borderRadius: BorderRadiusStyle.customBorderTL25,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Align(
                alignment: Alignment.center,
                child: SizedBox(width: 50, child: Divider(color: Colors.black)),
              ),
              25.h.verticalSpace,
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: Text(
                  "Mark Leave",
                  style: CustomTextStyles.titleMediumBlack900,
                ),
              ),
              const SizedBox(height: 21),
              Padding(
                padding: const EdgeInsets.only(left: 4, right: 62),
                child: Row(
                  children: [
                    buildClassContainer(
                        "Leave by Parent",
                        ImageConstant.imgCheckmark8Gray300,
                        isRegularClassSelected, () {
                      sestState(() {
                        isRegularClassSelected = true;
                        if (kDebugMode) {
                          print(isRegularClassSelected);
                        }
                      });
                    }),
                    buildClassContainer("Leave by Tutor",
                        ImageConstant.imgClock, !isRegularClassSelected, () {
                      sestState(() {
                        isRegularClassSelected = false;
                      });
                    }),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.only(left: 4, right: 42),
                child: Row(
                  children: [
                    CustomOutlinedButton(
                      onPressed: () {
                        sestState(() {
                          isTodayOrSelected = true;
                        });
                      },
                      height: 47,
                      width: 127,
                      text: "Today",
                      buttonStyle: isTodayOrSelected
                          ? CustomButtonStyles.outlinePrimaryTL11
                          : CustomButtonStyles.outlineBlueGray,
                      buttonTextStyle: CustomTextStyles.labelLargeBlack90013,
                    ),
                    42.h.horizontalSpace,
                    CustomOutlinedButton(
                      onPressed: () {
                        sestState(() {
                          isTodayOrSelected = false;
                        });
                      },
                      height: 47,
                      width: 127,
                      text: "Leave by Date",
                      buttonStyle: isTodayOrSelected
                          ? CustomButtonStyles.outlineBlueGray
                          : CustomButtonStyles.outlinePrimaryTL11,
                      buttonTextStyle: CustomTextStyles.labelLargeBlack90013,
                    ),
                  ],
                ),
              ),
              20.h.verticalSpace,
              if (!isTodayOrSelected)
                Text(
                  "Select Leave Dates",
                  style: CustomTextStyles.labelLargeBlack900Bold_1,
                ),
              if (!isTodayOrSelected) 10.h.verticalSpace,
              if (!isTodayOrSelected)
                GridView.builder(
                  itemCount: listOfGenrate.length,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, mainAxisExtent: 23),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => toggleDateSelection(listOfGenrate[index]),
                      child: datesWidget(listOfGenrate[index],
                          selectedDates.contains(listOfGenrate[index])),
                    );
                  },
                ),
              20.h.verticalSpace,
              CustomElevatedButton(
                onPressed: () async {
                  controller
                      .markLeave(
                          classId: id.toString(),
                          leaveBy: "tutor",
                          leaveDays: selectedDates)
                      .then((value) async {
                    print(value);
                    if (value!["is_error"] == false) {
                      Get.back();
                      await showDialog(
                        context: context,
                        builder: (context) => buildCustomDialog(
                          context,
                          title: "Marked Leave Successfully!",
                        ),
                      );
                    } else {
                      Fluttertoast.showToast(msg: value["message"].toString());
                    }
                  });
                },
                text: "Mark Leave",
                buttonTextStyle: CustomTextStyles.titleMediumPrimaryContainer_3,
              ),
              SizedBox(height: 17),
              CustomOutlinedButton(
                text: "Cancel",
              ),
              SizedBox(height: 19),
            ],
          ),
        );
      },
    );
  }

  Widget datesWidget(String dates, bool isSelected) {
    print("CHECK::$dates");
    return Row(children: [
      Container(
        height: 12,
        width: 12,
        margin: EdgeInsets.only(bottom: 2),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : theme.colorScheme.primary,
          // Change color based on selection
          borderRadius: BorderRadius.circular(2),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(left: 8),
        child: Text(
          dates.toString(),
          style: CustomTextStyles.labelLargeBlack900Bold.copyWith(
            color: isSelected
                ? Colors.blue
                : Colors.black, // Change text color based on selection
          ),
        ),
      ),
    ]);
  }
}
