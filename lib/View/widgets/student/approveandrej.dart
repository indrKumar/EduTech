import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../theme/app_decoration.dart';
import '../../../theme/custom_text_style.dart';
import '../../../theme/theme_helper.dart';
import '../../../utils/store_local_data.dart';
import '../custom_elevated_button.dart';
Widget buildApprove(context,{id,controller,feedBack,name,decoration,style,height}) {
  DateTime selectedDate = DateTime.now(); // Initialize with current date
  var dob;
  TimeOfDay _selectedTime = TimeOfDay.now();
  var timeController;
  return Flexible(
    child: CustomElevatedButton(
      decoration: decoration,
      height: height ?? 41.h,
      text: name,
      margin: EdgeInsets.only(left: 9.w),
      buttonTextStyle: style,
      onPressed: () {
        showModalBottomSheet(
            context: context,
            builder: (context) => StatefulBuilder(
              builder: (context, setSState) => Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 19.w,
                  vertical: 15.h,
                ),
                decoration: AppDecoration.fillPrimaryContainer.copyWith(
                  borderRadius: BorderRadiusStyle.customBorderTL25,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 66.h,
                      child: Divider(
                        color: appTheme.black900.withOpacity(0.4),
                      ),
                    ),
                    SizedBox(height: 24.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 1.h),
                        child: Text(
                          "Schedule Demo",
                          style: CustomTextStyles.titleMediumBlack900,
                        ),
                      ),
                    ),
                    SizedBox(height: 28.w),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.h),
                        child: GestureDetector(
                          onTap: () async {
                            await showDatePicker(
                                context: context,
                                initialDate: selectedDate,
                                firstDate: DateTime(1970),
                                lastDate: DateTime(
                                    DateTime.now().year,
                                    DateTime.now().month,
                                    DateTime.now().day))
                                .then((DateTime? pickedDate) {
                              if (pickedDate != null) {
                                selectedDate = pickedDate;
                                String formattedDate =
                                SharedPref.format(selectedDate);
                                setSState(() {
                                  dob = formattedDate;
                                });
                              }
                            });
                          },
                          child: Card(
                            margin: EdgeInsets.zero,
                            elevation: 0,
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: theme.primaryColor),
                                  borderRadius:
                                  BorderRadius.circular(22.h)),
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 12, right: 12),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        dob == null
                                            ? const Text(
                                          "Preferred Date",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontFamily:
                                              "Montserrat"),
                                        )
                                            : Text(
                                          dob,
                                          style: const TextStyle(
                                              fontSize: 12,
                                              fontFamily:
                                              "Montserrat"),
                                        ),
                                        const Icon(
                                          Icons
                                              .keyboard_arrow_down_rounded,
                                          color: Color(0xFF00C2FF),
                                        ),
                                      ],
                                    ),
                                  )),
                            ),
                          ),
                        )),
                    SizedBox(height: 18.h),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.h),
                        child: GestureDetector(
                          onTap: () async {
                            final TimeOfDay? picked =
                            await showTimePicker(
                              context: context,
                              initialTime: _selectedTime,
                            );
                            if (picked != null &&
                                picked != _selectedTime) {
                              setSState(() {
                                _selectedTime = picked;
                                timeController = DateFormat('hh:mm a')
                                    .format(DateTime(2021, 1, 1,
                                    picked.hour, picked.minute));
                              });
                            }
                          },
                          child: Card(
                            margin: EdgeInsets.zero,
                            elevation: 0,
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: theme.primaryColor),
                                  borderRadius:
                                  BorderRadius.circular(22.h)),
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 12, right: 12),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        timeController == null
                                            ? const Text(
                                          "Preferred Time",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontFamily:
                                              "Montserrat"),
                                        )
                                            : Text(
                                          timeController,
                                          style: const TextStyle(
                                              fontSize: 12,
                                              fontFamily:
                                              "Montserrat"),
                                        ),
                                        const Icon(
                                          Icons
                                              .keyboard_arrow_down_rounded,
                                          color: Color(0xFF00C2FF),
                                        ),
                                      ],
                                    ),
                                  )),
                            ),
                          ),
                        )),
                    SizedBox(height: 40.h),
                    CustomElevatedButton(
                      onPressed: () {
                        controller
                            .approveListedTutors(
                            id: id,
                            status: "a",
                            demoDate: dob,
                            demoTime: timeController)
                            .then((value) {
                          if (value != null) {
                            if (value["is_error"] == false) {
                              Fluttertoast.showToast(msg: "Approved");
                              Get.back();
                              Get.back();
                            } else {
                              // feedBack.clear();
                              Get.back();
                              Fluttertoast.showToast(
                                  msg: "Internal issue");
                            }
                          }
                          print(value);
                        });
                      },
                      text: "Approve & Schedule Demo",
                      // buttonTextStyle: CustomTextStyles.titleMediumPrimaryContainerMedium,
                    ),
                    SizedBox(height: 15.h),
                  ],
                ),
              ),
            ));
      },
    ),
  );
}