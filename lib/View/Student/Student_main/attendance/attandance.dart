import 'package:edushalaacademy/View/Student/Student_main/attendance/attendance_info.dart';
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
    super.initState();
    futureStudentData = controller.fetchStudentData();
  }

  @override
  Widget build(BuildContext context) {
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
              return
                Expanded(
                  child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) =>  Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: GestureDetector(
                            onTap: () {
                              Get.to(()=>const AttendanceInfo());
                            },
                            child:Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 19.w,
                                  vertical: 15.h,
                                ),
                                decoration: AppDecoration.outlineBlueGray.copyWith(
                                  borderRadius: BorderRadiusStyle.roundedBorder10,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(top: 1.h),
                                          height: 70,
                                          width: 70,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(8.h),
                                              color: Colors.grey),
                                          child: const Icon(Icons.person),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: 21.w,
                                            bottom: 2.w,
                                          ),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                               Text(
                                                snapshot.data![index].name??'',
                                                style: const TextStyle(fontSize: 16,fontFamily: "Montserrat"),
                                              ),
                                              SizedBox(height: 2.h),
                                              const Text(
                                                "Mathematics",
                                                // style: CustomTextStyles.bodyMediumGray700,
                                              ),
                                              SizedBox(height: 10.h),
                                              RichText(
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: "Level : ",
                                                      style: CustomTextStyles.bodyMediumff000000,
                                                    ),
                                                     TextSpan(
                                                      text: snapshot.data![index].badge,
                                                       style: CustomTextStyles.bodyMediumff000000,
                                                    ),
                                                  ],
                                                ),
                                                textAlign: TextAlign.left,
                                              ),
                                            ],
                                          ),
                                        ),
                                        const Spacer(),
                                        const Icon(Icons.arrow_forward_ios,color: Color(0xFF00C2FF),)
                                      ],
                                    ),
                                    SizedBox(height: 17.h),
                                    Row(
                                      children: [
                                        const Text("Days",style: TextStyle(fontSize: 14,fontFamily: "Montserrat"),),
                                        SizedBox(width: 17.h),
                                        Wrap(
                                          runSpacing: 55.h,
                                          spacing: 10.w,
                                          children: List<Widget>.generate(
                                            3,
                                                (index) {
                                              return Theme(
                                                data: ThemeData(
                                                  canvasColor: Colors.transparent,
                                                ),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: theme.primaryColor,
                                                    borderRadius: BorderRadius.circular(15),
                                                  ),
                                                  child: const Padding(
                                                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 6),
                                                    child: Text(
                                                      "Mon",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 10,
                                                        fontFamily: 'Montserrat',
                                                        fontWeight: FontWeight.bold,
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
                                      padding: EdgeInsets.only(right: 88.w),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(bottom: 1.h),
                                            child:
                                            const Text(
                                              "Duration",
                                              // style: theme.textTheme.bodyMedium,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 27.w),
                                            child: RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: snapshot.data![index].duration.toString()??"",
                                                    style: CustomTextStyles.titleSmallff000000,
                                                  ),
                                                  TextSpan(
                                                    text: "(24 Sessions)",
                                                    style: CustomTextStyles.bodyMediumff000000,
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
                      )),
                );
                ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapshot.data![index].name),
                    subtitle: Text(snapshot.data![index].location),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return CircularProgressIndicator();
          },
        ),
            ],
          ),
        ),
      ),
    );
  }

}
