import 'package:edushalaacademy/View/Student/Student_main/attendance/attendance_info.dart';
import 'package:edushalaacademy/View/widgets/circularindicaror.dart';
import 'package:edushalaacademy/models/student_class_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../controllers/StudentController/pakege_details_controller.dart';
import '../../../../theme/app_decoration.dart';
import '../../../../theme/custom_text_style.dart';
import '../../../../theme/theme_helper.dart';

class AttendanceTab extends StatefulWidget {
  const AttendanceTab({super.key});

  @override
  State<AttendanceTab> createState() => _AttendanceTabState();
}

class _AttendanceTabState extends State<AttendanceTab> {
  final PackageDetails controller = Get.put(PackageDetails());

  late Future<List<StudentClassM>> futureStudentData;

  @override
  void initState() {
    futureStudentData = controller.fetchStudentData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
     // SharedPref.setStringSp(SharedPref.STUDENTID, "272");
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 10.w,
            vertical: 25.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 9.w),
                child: RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                          text: "Your ",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontFamily: "Montserrat")),
                      TextSpan(
                        text: "Tutors",
                        style: CustomTextStyles.titleMediumcc000000,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: 26.h),
              FutureBuilder<List<StudentClassM>>(
                future: futureStudentData,
                builder: (context, snapshot) {
                  print(snapshot.error);
                  if (snapshot.hasData) {
                    return Expanded(
                      child:  snapshot.data!.length >0 ? ListView.builder(
                          itemCount: snapshot.data!.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: GestureDetector(
                                    onTap: () {
                                      Get.to(() => const AttendanceInfo());
                                    },
                                    child: Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 19.w,
                                          vertical: 15.h,
                                        ),
                                        decoration: AppDecoration
                                            .outlineBlueGray
                                            .copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.roundedBorder10,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(top: 1.h),
                                                  height: 70,
                                                  width: 70,
                                                  decoration: BoxDecoration(
                                                    image: snapshot.data !=
                                                                null &&
                                                            snapshot.data!
                                                                .isNotEmpty &&
                                                            snapshot
                                                                    .data![
                                                                        index]
                                                                    .profilePic !=
                                                                null
                                                        ? DecorationImage(
                                                            image: NetworkImage(
                                                                snapshot
                                                                    .data![
                                                                        index]
                                                                    .profilePic!),
                                                            fit: BoxFit.fill)
                                                        : null,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.h),
                                                    color: Colors.grey,
                                                  ),
                                                  child: snapshot.data !=
                                                              null &&
                                                          snapshot.data!
                                                              .isNotEmpty &&
                                                          snapshot.data![index]
                                                                  .profilePic ==
                                                              null
                                                      ? const Icon(Icons.person)
                                                      : null,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    left: 21.w,
                                                    bottom: 2.w,
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        snapshot.data![index]
                                                                .tutor,
                                                        style: const TextStyle(
                                                            fontSize: 16,
                                                            fontFamily:
                                                                "Montserrat"),
                                                      ),
                                                      SizedBox(height: 2.h),
                                                      if(snapshot.data![index].subjects.length > 0)
                                                      Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          // Text(snapshot.data![index].name),
                                                          // const SizedBox(width: 5),
                                                          Row(
                                                            children:[ Text(
                                                              snapshot.data![index].subjects.map((subject) => subject.name).join(', '),
                                                              // style: TextStyle(fontWeight: FontWeight.bold),
                                                            ),
                                                          ]),
                                                        ],
                                                      ),
                                                      SizedBox(height: 10.h),
                                                      RichText(
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text: "Level : ",
                                                              style: CustomTextStyles
                                                                  .bodyMediumff000000,
                                                            ),
                                                            TextSpan(
                                                              text: snapshot
                                                                  .data![index]
                                                                  .badge,
                                                              style: CustomTextStyles
                                                                  .bodyMediumff000000,
                                                            ),
                                                          ],
                                                        ),
                                                        textAlign:
                                                            TextAlign.left,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const Spacer(),
                                                const Icon(
                                                  Icons.arrow_forward_ios,
                                                  color: Color(0xFF00C2FF),
                                                )
                                              ],
                                            ),
                                            SizedBox(height: 17.h),
                                            Row(
                                              children: [
                                                const Text(
                                                  "Days",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontFamily: "Montserrat"),
                                                ),
                                                SizedBox(width: 17.h),
                                                Wrap(
                                                  runSpacing: 55.h,
                                                  spacing: 10.w,
                                                  children:
                                                      List<Widget>.generate(
                                                    snapshot.data![index].days
                                                        .length,
                                                    (indexx) {
                                                      return Theme(
                                                        data: ThemeData(
                                                          canvasColor: Colors
                                                              .transparent,
                                                        ),
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: theme
                                                                .primaryColor,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                                    horizontal:
                                                                        10,
                                                                    vertical:
                                                                        6),
                                                            child: Text(
                                                              snapshot
                                                                          .data![
                                                                              index]
                                                                          .days[
                                                                      indexx],
                                                              style:
                                                                  const TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 10,
                                                                fontFamily:
                                                                    'Montserrat',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ),
                                                          // selected: (daysItemModelObj.isSelected?.value ?? false),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 17.h),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(right: 88.w),
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        bottom: 1.h),
                                                    child: const Text(
                                                      "Duration",
                                                      // style: theme.textTheme.bodyMedium,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 27.w),
                                                    child: RichText(
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text: convertToHoursMinutes(double.parse( snapshot
                                                                .data![
                                                            index]
                                                                .duration
                                                                .toString(),)),
                                                            style: CustomTextStyles
                                                                .titleSmallff000000,
                                                          ),
                                                          TextSpan(
                                                            text:
                                                                " (${snapshot.data![index].numberOfSessions} Sessions)",
                                                            style: CustomTextStyles
                                                                .bodyMediumff000000,
                                                          ),
                                                        ],
                                                      ),
                                                      textAlign: TextAlign.left,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),

                                          ],
                                        ))),
                              )):const Center(child: Text("No class available"),),
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  return Center(child: MyCircularProgressIndicator());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
  String convertToHoursMinutes(double totalHours) {
    int hours = totalHours.toInt();
    int minutes = ((totalHours - hours) * 60).round();
    return "${hours}h ${minutes}m";
  }
}
