import 'package:dotted_line/dotted_line.dart';
import 'package:edushalaacademy/View/Student/demo_schedule_link.dart';
import 'package:edushalaacademy/View/Student/linup_up_tutor.dart';
import 'package:edushalaacademy/View/Student/procced_payment_page.dart';
import 'package:edushalaacademy/View/widgets/custom_elevated_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controllers/StudentController/pakege_details_controller.dart';
import '../../models/inquiry_data_model.dart';
import '../../theme/custom_text_style.dart';
import '../../theme/theme_helper.dart';
import '../widgets/circularindicaror.dart';

class PendingInquiries extends StatefulWidget {
  const PendingInquiries({super.key});

  @override
  State<PendingInquiries> createState() => _PendingInquiriesState();
}

class _PendingInquiriesState extends State<PendingInquiries> {
  final PackageDetails controller = Get.put(PackageDetails());
  String currentStatus = 'New Enquiry';
  late Future<InquiryDataModel> _inquiryFuture;

  @override
  void initState() {
    super.initState();
    _inquiryFuture = controller.fetchData();
  }

  // bool _isFirstBuild = true;

  Future<void> _refreshData() async {
    await Future.delayed(const Duration(microseconds: 500));

    setState(() {
      _inquiryFuture = controller.fetchData();
    });
  }

  @override
  Widget build(BuildContext context) {
    // setState(() {
    // });
    // if (_isFirstBuild) {
    //   setState(() {
    //     _inquiryFuture = controller.fetchData();
    //   });
    //   setState(() {
    //     _isFirstBuild = false;
    //   });
    // }
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          50.h.verticalSpace,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'Your ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: 'Pending Inquiries',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          FutureBuilder<InquiryDataModel>(
            future: _inquiryFuture,
            builder: (context, snapshot) {
              if (kDebugMode) {
                print("Errrrrrrr::::${snapshot.error}");
                print("Errrrrrrr::::${ConnectionState.values}");
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: MyCircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.hasData) {
                final data = snapshot.data!;
                return Container(
                  margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Card(
                    elevation: 0,
                    shadowColor: Colors.black,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                data.subjects!.classInfo,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              10.h.horizontalSpace,
                              const Text(
                                "|",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              10.h.horizontalSpace,
                              const Icon(Icons.home_outlined),
                              10.h.horizontalSpace,
                              const Icon(Icons.directions_bike_outlined)
                            ],
                          ),
                          Text(
                            data.subjects!.subjects.join(", "),
                            style: const TextStyle(
                              fontSize: 13,
                              fontFamily: "Montserrat",
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            data.location.toString(),
                            style: const TextStyle(fontSize: 12),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            height: 60,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: data.statusList!.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  child: statusHorizontal(
                                      title: data.statusList![index]),
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Divider(color: Colors.grey),
                          const SizedBox(height: 8),
                          Text(
                            data.message.toString(),
                            style: const TextStyle(
                              fontSize: 14,
                              fontFamily: "Montserrat",
                            ),
                          ),
                          const SizedBox(height: 16),
                          if (data.status == "Tutor Shortlisted")
                            CustomElevatedButton(
                              text: "View short-listed tutors",
                              onPressed: () {
                                Get.to(() => const LinedUpTutorsScreen())
                                    ?.then((value) {
                                  setState(() {
                                    _inquiryFuture = controller.fetchData();
                                  });
                                });
                              },
                            ),
                          if (data.status == "Demo Scheduled")
                            CustomElevatedButton(
                              text: "View demo details",
                              onPressed: () {
                                Get.to(() => const DemoScheduleLink())
                                    ?.then((value) {
                                  setState(() {
                                    _inquiryFuture = controller.fetchData();
                                  });
                                });
                              },
                            ),
                          if (data.status == "Demo Given")
                            CustomElevatedButton(
                              onPressed: () {
                                setState(() {
                                  controller
                                      .approveTutorDemo(rejectOrApprove: true)
                                      .then((value) {
                                    _inquiryFuture = controller.fetchData();
                                  });
                                });
                              },
                              text: "Approve Now",
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(23.h)),
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFF038829),
                                    Color(0xFF038829)
                                  ],
                                ),
                              ),
                            ),
                          if (data.status == "Demo Given")
                            const SizedBox(height: 15),
                          if (data.status == "Demo Given")
                            CustomElevatedButton(
                              onPressed: () {
                                setState(() {
                                  controller
                                      .approveTutorDemo(rejectOrApprove: false)
                                      .then((value) {
                                    _inquiryFuture = controller.fetchData();
                                  });
                                });
                              },
                              text: "Reject",
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(23.h)),
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFFD60000),
                                    Color(0xFFD60000)
                                  ],
                                ),
                              ),
                            ),
                          if (data.status == "Offer Given")
                            CustomElevatedButton(
                              text: "View our offerings",
                              onPressed: () {
                                Get.to(() => const ProceedPaymentPage());
                              },
                            ),
                        ],
                      ),
                    ),
                  ),
                );
              } else {
                return Container(); // Return a placeholder or handle the case where data is not available
              }
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _refreshData,
        icon: const Icon(Icons.refresh),
        label: const Text('Refresh'),
      ),
    );
  }

  Widget statusHorizontal({title}) {
    return SizedBox(
      width: 100,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
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
                    left: 39.w,
                    right: 42.w,
                  ),
                  child: Container(
                    height: 15.h,
                    width: 15.w,
                    decoration: BoxDecoration(
                      color: appTheme.blueGray10001,
                      borderRadius: BorderRadius.circular(
                        7.w,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(bottom: 13.h),
            child: Text(
              title ?? '',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: CustomTextStyles.labelLargeBlack900Bold_1.copyWith(
                height: 1.25,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
