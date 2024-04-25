import 'package:dotted_line/dotted_line.dart';
import 'package:edushalaacademy/View/Student/demo_schedule_link.dart';
import 'package:edushalaacademy/View/Student/linup_up_tutor.dart';
import 'package:edushalaacademy/View/Student/procced_payment_page.dart';
import 'package:edushalaacademy/View/widgets/custom_elevated_button.dart';
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

  // get() async {
  //   await controller.fetchData();
  //   setState(() {
  //     currentStatus = controller.inquiryData![0].status ?? 'New Enquiry';
  //   });
  // }
  Future get<InquiryDataModel>() async {
    _inquiryFuture = controller.fetchData();
    setState(() {});
  }

  late Future<InquiryDataModel> _inquiryFuture;
  //
  @override
  void initState() {
    // TODO: implement initState
    _inquiryFuture = controller.fetchData();
    // get(widget.id);
    super.initState();
  }

  List<String> statusList = [
    "New Enquiry",
    "Qualified Enquiry",
    "Disqualified Enquiry",
    "Tutor Shortlisted",
    "Rejected by Parent",
    "Approved by Parent",
    "Demo Scheduled",
    "Demo Given",
    "Demo Approved v Demo Rejected",
    "Offer Given",
    "Payment Done"
  ];

  @override
  Widget build(BuildContext context) {
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
              print(snapshot.data?.message);
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: MyCircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
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
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Card(
                        elevation: 0,
                        shadowColor: Colors.black,
                        // margin: EdgeInsets.all(16),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    snapshot.data!.subjects?.classInfo ?? '',
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
                                snapshot.data!.subjects!.subjects?.join(", ") ??
                                    '',
                                style: const TextStyle(
                                    fontSize: 13, fontFamily: "Montserrat"),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                snapshot.data!.location ?? '',
                                style: const TextStyle(fontSize: 12),
                              ),
                              const SizedBox(height: 10),
                              SizedBox(
                                // width: double.infinity, // Set the width to match the Card's width
                                height: 60,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: snapshot.data!.statusList!.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 4),
                                      child: statusHorizontal(
                                          title: snapshot
                                              .data!.statusList?[index]),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Divider(
                                color: Colors.grey,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                snapshot.data!.message ?? '',
                                style: const TextStyle(
                                    fontSize: 14, fontFamily: "Montserrat"),
                              ),
                              const SizedBox(height: 16),
                              if (snapshot.data!.status == "Tutor Shortlisted")
                                CustomElevatedButton(
                                  text: "View short-listed tutors",
                                  onPressed: () {
                                    Get.to(() => const LinedUpTutorsScreen())
                                        ?.then((value) {
                                      setState(() {
                                        _inquiryFuture = controller.fetchData();
                                      });
                                      // controller
                                      //     .approveTutorDemo(
                                      //         rejectOrApprove: true)
                                      //     .then((value) {
                                      //
                                      // });
                                      // get();
                                    });
                                  },
                                ),
                              if (snapshot.data!.status == "Demo Scheduled")
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
                              if (snapshot.data!.status == "Demo Given")
                                CustomElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      controller
                                          .approveTutorDemo(
                                              rejectOrApprove: true)
                                          .then((value) {
                                        _inquiryFuture = controller.fetchData();
                                      });
                                    });
                                  },
                                  text: "Approve Now",
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(23.h)),
                                      gradient: const LinearGradient(colors: [
                                        Color(0xFF038829),
                                        Color(0xFF038829),
                                      ])),
                                ),
                              if (snapshot.data!.status == "Demo Given")
                                const SizedBox(
                                  height: 15,
                                ),
                              if (snapshot.data!.status == "Demo Given")
                                CustomElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      controller
                                          .approveTutorDemo(
                                          rejectOrApprove: false)
                                          .then((value) {
                                        _inquiryFuture = controller.fetchData();
                                      });
                                    });
                                  },
                                  text: "Reject",
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(23.h)),
                                      gradient: const LinearGradient(colors: [
                                        Color(0xFFD60000),
                                        Color(0xFFD60000),
                                      ])),
                                ),

                              // Text("We’ve got best offers for you."),
                              if (snapshot.data!.status == "Offer Given")
                                CustomElevatedButton(
                                  text: "View our offerings",
                                  onPressed: () {
                                    Get.to(() => const ProceedPaymentPage());
                                  },
                                ),
                            ],
                          ),
                        )));
              }
            })
      ],
    ));
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
