import 'dart:async';

import 'package:edushalaacademy/View/ClassMenagement/attandance_history.dart';
import 'package:edushalaacademy/View/widgets/class_management_sheets/bottoms_shets.dart';
import 'package:edushalaacademy/controllers/tutor_class_contrpller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../models/tutor_class_model.dart';
import '../../../theme/app_decoration.dart';
import '../../../theme/custom_text_style.dart';
import '../../../utils/image_constant.dart';
import '../../../utils/store_local_data.dart';
import '../../widgets/custom_image_view.dart';

class ActiveTab extends StatefulWidget {
  ActiveTab({super.key, this.type});

  String? type;

  @override
  State<ActiveTab> createState() => _ActiveTabState();
}

class _ActiveTabState extends State<ActiveTab> {
  final TutorController _controller = TutorController();
  int _pageNumber = 1;
  // bool _isLoading = false;

  // late StartDuModel _model;

  @override
  void initState() {
    super.initState();
  }

  var recovery = "";
Future<String>fetchCycle({id,status})async{
   var idCycle = await _controller.getCycle(id: id,status: status).then((value) {
     recovery = value!["data"][0]["remaining_tutor_recovery"].toString();
      return value!["data"][0]["id"].toString();
    },);
   print("CY::::::$idCycle");
   return idCycle ;
}

var startTime = "08:44";
Future<String>fetchAttendance({id,status})async{
   var idCycle = await _controller.getAttendance(id: id,status: status).then((value) {
     startTime = value!["data"][0]["start_time"].toString();
      return value!["data"][0]["id"].toString();
    },);
   print("CY::::::$idCycle");
   return idCycle ;
}

  String totalTime(startTime) {
    // String startTime = "08:44";

    // Parse the start time string into a DateTime object
    DateTime now = DateTime.now();
    DateTime parsedStartTime = DateFormat("HH:mm").parse(startTime);

    // Adjust the parsed start time to today's date
    DateTime startDateTime = DateTime(now.year, now.month, now.day, parsedStartTime.hour, parsedStartTime.minute);

    // Get the current time
    DateTime currentTime = DateTime.now();

    // Calculate the difference between the current time and the start time
    Duration difference = currentTime.difference(startDateTime);

    // Format the difference into hours and minutes
    String elapsedTime = "${difference.inHours.toString().padLeft(2, '0')} : ${(difference.inMinutes % 60).toString().padLeft(2, '0')} hrs";

    return elapsedTime;
  }

Future<String>getTime({id,status})async{
   var idCycle = await _controller.getCycle(id: id,status: status).then((value) {
      return value!["data"][0]["id"].toString();
    },);
   print("CY::::::$idCycle");
   return idCycle ;
}

  String _convert24to12HourFormat(String time24) {
    final hour = int.parse(time24.split(':')[0]);
    final minute = int.parse(time24.split(':')[1]);
    final period = hour >= 12 ? 'PM' : 'AM';
    final hour12 = hour % 12 == 0 ? 12 : hour % 12;
    return '$hour12:$minute $period';
  }
  @override
  Widget build(BuildContext context) {
    totalTime(startTime);
    return Scaffold(
      body: FutureBuilder<List<TutorClass>>(
        future: _controller.fetchTutorClasses(
            type: widget.type, pageNumber: _pageNumber),
        builder: (context, snapshot) {
          print(SharedPref.accessToken);
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            final tutorClasses = snapshot.data ?? [];
            return  snapshot.data!.length >0 ? SingleChildScrollView(
              child: Column(
                children: [
                  _buildUserProfile(tutorClasses),
                  if (tutorClasses.isNotEmpty && tutorClasses.length % 10 == 0)
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _pageNumber++;
                          });
                        },
                        child: const Text('Load More'),
                      ),
                    ),
                ],
              ),
            ):widget.type == "Demo"? const Center(child: Text("No Demo class found"),):widget.type == null?const Center(child: Text("No Inactive class found"),):const Center(child: Text("No Active class found"),);
          }
        },
      ),
    );
  }

  Widget _buildUserProfile(List<TutorClass> tutorClasses) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 11.w),
      child: Column(
        children: [
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: tutorClasses.length,
            itemBuilder: (context, index) {
              print(tutorClasses[index].state);
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 7.h),
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => const AttendanceHistory());
                  },
                  child: classList(
                    context,
                    index,
                    tutorClass: tutorClasses[index],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget classList(BuildContext context, index,{required TutorClass tutorClass,}) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 7.w,
        vertical: 9.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.1, 1),
            spreadRadius: 2,
            blurRadius: 5,
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 3.h),
          Padding(
            padding: EdgeInsets.only(
              left: 8.w,
              right: 18.w,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgOutdoorsManPo,
                  height: 83.h,
                  width: 83.w,
                  radius: BorderRadius.circular(
                    8.w,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 14.w,
                      bottom: 6.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tutorClass.parent ?? "",
                          style: CustomTextStyles.titleMedium16_1,
                        ),
                        SizedBox(height: 9.h),
                        // SizedBox(
                        //   child: Text(
                        //     "State: ${tutorClass.state ?? ''}, City: ${tutorClass.city ?? ''}, Location: ${tutorClass.location ?? ''}, Parent: ${tutorClass.parent ?? ''}, Tutor: ${tutorClass.tutor ?? ''}, Badge: ${tutorClass.badge ?? ''}, Type: ${tutorClass.type ?? ''}, Start Time: ${tutorClass.startTime ?? ''}, End Time: ${tutorClass.endTime ?? ''}, Number of Sessions: ${tutorClass.numberOfSession ?? ''}, Days: ${tutorClass.days ?? ''}, Sessions per Month: ${tutorClass.sessionPerMonth ?? ''}, Hours: ${tutorClass.hours ?? ''}, Duration: ${tutorClass.duration ?? ''}, Mode: ${tutorClass.mode ?? ''}, Status: ${tutorClass.status ?? ''}, Created On: ${tutorClass.createdOn ?? ''}",
                        //     style: CustomTextStyles.bodyMediumMontserrat_1.copyWith(
                        //       height: 1.57,
                        //     ),
                        //   ),
                        // ),
                        if (tutorClass.studentData != null &&
                            tutorClass.studentData!.isNotEmpty)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // SizedBox(height: 9.h),
                              // Text(
                              //   'Student Data:',
                              //   style: CustomTextStyles.titleMedium16_1,
                              // ),
                              ...tutorClass.studentData!.map((studentData) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // SizedBox(height: 9.h),
                                    // Text(
                                    //   'Student Name: ${studentData.name ?? ''}',
                                    //   style: CustomTextStyles.bodyMediumMontserrat_1,
                                    // ),
                                    if (studentData.subjects != null &&
                                        studentData.subjects!.isNotEmpty)
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // SizedBox(height: 6.h),
                                          // Text(
                                          //   'Subjects:',
                                          //   style: CustomTextStyles.bodyMediumMontserrat_1,
                                          // ),
                                          // ...studentData.subjects!.map((subject) {
                                          //   return
                                          Column(children: [
                                            Padding(
                                              padding: EdgeInsets.only(right: 8.w),
                                              child: Text(
                                                studentData.subjects!
                                                    .map((subject) => subject.name ?? '')
                                                    .toList()
                                                    .reversed
                                                    .join(', '),
                                                style: CustomTextStyles.bodyMediumMontserrat_1,
                                              ),
                                            ),
                                          ]),
                                          // }).toList(),
                                        ],
                                      ),
                                  ],
                                );
                              }).toList(),
                            ],
                          ),
                        Row(
                          children: [
                            if (tutorClass.mode != null)
                            Text(
                              tutorClass.mode ?? '',
                              style: CustomTextStyles.bodyMediumMontserrat_1,
                            ),
                            if (tutorClass.hours != null)
                              Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Text(
                                '|',
                                style: CustomTextStyles.bodyMediumMontserrat_1,
                              ),
                            ),
                            if (tutorClass.type == "Demo")
                            if (tutorClass.start_date != null)
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 5),
                                child: Text(
                                  '|',
                                  style: CustomTextStyles.bodyMediumMontserrat_1,
                                ),
                              ),
                            if (tutorClass.type == "Demo")
                              if (tutorClass.start_date != null)
                              Text(
                                tutorClass.start_date ?? '',
                                style: CustomTextStyles.bodyMediumMontserrat_1,
                              ),

                            if (tutorClass.type == "Demo")
                              if (tutorClass.startTime != null && tutorClass.endTime != null)
                                Padding(
                                  padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                                  child: Text(
                                    '|',
                                    style: CustomTextStyles.bodyMediumMontserrat_1,
                                  ),
                                ),
                            if (tutorClass.type == "Demo")
                              if (tutorClass.startTime != null && tutorClass.endTime != null)
                                Flexible(
                                  child: Row(
                                    children: [
                                      Flexible(
                                        child: Text(
                                          _convert24to12HourFormat(tutorClass.startTime.toString()),
                                          style: CustomTextStyles.bodyMediumMontserrat_1,
                                        ),
                                      ),
                                      //
                                      //   Text(
                                      //     ' - ',
                                      //   style: CustomTextStyles.bodyMediumMontserrat_1,
                                      // ),
                                      //
                                      // Flexible(
                                      //   child: Text(
                                      //     _convert24to12HourFormat(tutorClass.endTime.toString())  ?? '',
                                      //     style: CustomTextStyles.bodyMediumMontserrat_1,
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ),

                            if (tutorClass.hours != null)
                            Text(
                              convertToHoursMinutes(double.parse(
                                  tutorClass.hours != null
                                      ? tutorClass.hours.toString()
                                      : '0')),
                              style: CustomTextStyles.bodyMediumMontserrat_1,
                            ),
                            if (tutorClass.sessionPerMonth != null&& tutorClass.sessionPerMonth.toString().isNotEmpty)
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Text(
                                  '|',
                                  style:
                                      CustomTextStyles.bodyMediumMontserrat_1,
                                ),
                              ),
                            Text(
                              (tutorClass.sessionPerMonth != null
                                      ? "${tutorClass.sessionPerMonth} Days"
                                      : ""),
                              style: CustomTextStyles.bodyMediumMontserrat_1,
                            ),
                              // if (tutorClass.days != null)
                            //   Padding(
                            //     padding:
                            //         const EdgeInsets.symmetric(horizontal: 5),
                            //     child: Text(
                            //       '|',
                            //       style:
                            //           CustomTextStyles.bodyMediumMontserrat_1,
                            //     ),
                            //   ),
                            // Text(
                            //   (tutorClass.days != null
                            //           ? "${tutorClass.days} Days"
                            //           : "") ??
                            //       '',
                            //   style: CustomTextStyles.bodyMediumMontserrat_1,
                            // ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15.h),
          Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () async{
                    var n = await fetchCycle(id:tutorClass.id.toString(),status:tutorClass.status);
                    print("CDDD::${n}");
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return SheetsHelper().startClass(context,id: tutorClass.id,controller: _controller,cycle_id: n,);
                      },
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 7.w,
                      vertical: 5.h,
                    ),
                    decoration: AppDecoration.outlineBlack90013.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder13,
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 1.h),
                          child: SvgPicture.asset(
                            ImageConstant.imgStart3,
                            height: 20.h,
                            width: 20.w,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 2.w,
                            top: 3.h,
                            bottom: 2.h,
                          ),
                          child: Text(
                            "Start",
                            style: CustomTextStyles.labelLargeBlack900_2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async{
                    var n = await fetchCycle(id:tutorClass.id.toString(),status:tutorClass.status);
                  var d =  totalTime(startTime);
                    showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: SheetsHelper().groupPunchOut(context,controller: _controller,id: tutorClass.id,cycleId: n,totalTime: d),
                        );
                      },
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 17.w),
                    padding: EdgeInsets.symmetric(
                      horizontal: 9.w,
                      vertical: 7.h,
                    ),
                    decoration: AppDecoration.outlineBlack90013.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder13,
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 1.h),
                          child: SvgPicture.asset(
                            ImageConstant.imgStop2,
                            height: 20.h,
                            width: 20.w,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 4.w,
                            top: 1.h,
                          ),
                          child: Text(
                            "End",
                            style: CustomTextStyles.labelLargeBlack900_2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async{
                    var n = await fetchCycle(id:tutorClass.id.toString(),status:tutorClass.status);

                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return SheetsHelper().extendClass(context,controller: _controller,id: tutorClass.id,recoveryFor: "tutor",cycleId: n,recoveryDuration:recovery);
                      },
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 11.w),
                    padding: EdgeInsets.symmetric(
                      horizontal: 9.w,
                      vertical: 7.h,
                    ),
                    decoration: AppDecoration.outlineBlack90013.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder13,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          ImageConstant.imgExtension2,
                          height: 20.h,
                          width: 20.w,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 3.w),
                          child: Text(
                            "Extend",
                            style: CustomTextStyles.labelLargeBlack900_2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) {
                        return SheetsHelper().leaveMark(context,id: tutorClass.id,controller: _controller,cycleId: "18",);
                      },
                    );
                  },
                  child: Container(
                    // width: 77.w,
                    margin: EdgeInsets.only(left: 15.w),
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 7.h,
                    ),
                    decoration: AppDecoration.outlineBlack90013.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder13,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 2.h),
                          child: SvgPicture.asset(
                            ImageConstant.imgSettingsRedA700,
                            height: 11.h,
                            width: 15.w,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5.w),
                          child: Text(
                            'Leave',
                            style: CustomTextStyles.labelLargeBlack900_2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  String convertToHoursMinutes(double totalHours) {
    int hours = totalHours.toInt();
    int minutes = ((totalHours - hours) * 60).round();
    return "${hours}h ${minutes}m";
  }
}
