import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controllers/StudentController/pakege_details_controller.dart';
import '../../models/demo_model_st.dart';
import '../../theme/app_decoration.dart';
import '../../theme/custom_text_style.dart';
import '../../utils/clipboard.dart';
import '../widgets/circularindicaror.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_text_form_field.dart';

class DemoScheduleLink extends StatefulWidget {
  const DemoScheduleLink({super.key});

  @override
  State<DemoScheduleLink> createState() => _DemoScheduleLinkState();
}

class _DemoScheduleLinkState extends State<DemoScheduleLink> {
  final PackageDetails _meetingController = PackageDetails();
  late Future<Meeting> _meetingDetails;

  @override
  void initState() {
    _meetingDetails = _meetingController.fetchMeetingDetails();
    super.initState();
  }
  Future<void> launchMeetingLink(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  Future<void> _launchUrl(_url) async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: FutureBuilder<Meeting>(
        future: _meetingDetails,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: MyCircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            if (kDebugMode) {
              print(snapshot.data!.name,);
            }
            return SizedBox(
              width: double.maxFinite,
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 109.h,
                  ),
                  decoration: AppDecoration.outlineBlack9009.copyWith(
                    borderRadius: BorderRadiusStyle.customBorderTL25,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: const AssetImage(
                            "assets/images/dmoooooo.png"),
                        height: 210.h,
                        alignment: Alignment.centerRight,
                      ),
                      SizedBox(height: 37.h),
                      Align(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          child: Text(
                            "Your demo class has been scheduled with our Tutor",
                            // maxLines: 2,
                            // overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: CustomTextStyles.titleMedium16,
                          ),
                        ),
                      ),
                      SizedBox(height: 36.h),
                      Container(
                        decoration: AppDecoration.outlineBlack90010.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder7,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(height: 11.h),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: 12.w,
                                  right: 53.w,
                                ),
                                child: Row(
                                  children: [
                                    // CustomImageView(
                                    //   imagePath: ImageConstant.imgWaistUpPortrait,
                                    //   height: 58.adaptSize,
                                    //   width: 58.adaptSize,
                                    //   radius: BorderRadius.circular(
                                    //     29.h,
                                    //   ),
                                    //   margin: EdgeInsets.only(
                                    //     top: 5.v,
                                    //     bottom: 1.v,
                                    //   ),
                                    // ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 22.w),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                             Text(
                                              snapshot.data!.name.toString(),
                                              // style: CustomTextStyles.titleMediumSemiBold_1,
                                            ),
                                            SizedBox(height: 4.h),
                                             Text(
                                                snapshot.data!.designation.toString(),
                                              // style: CustomTextStyles.titleSmallBlack900SemiBold,
                                            ),
                                            SizedBox(height: 6.h),
                                            RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: snapshot.data!.date,
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.bold,
                                                        // Example font weight
                                                        fontFamily: "Montserrat"),
                                                  ),
                                                  const TextSpan(
                                                    text: " | ",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.normal,
                                                        fontFamily: "Montserrat"),
                                                  ),
                                                   TextSpan(
                                                    text: snapshot.data!.time,
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.normal,
                                                        fontFamily: "Montserrat"),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            if(snapshot.data!.mode == "Offline") SizedBox(height: 6.h),
                                            if(snapshot.data!.mode == "Offline") RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: snapshot.data!.city,
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.bold,
                                                        // Example font weight
                                                        fontFamily: "Montserrat"),
                                                  ),
                                                  const TextSpan(
                                                    text: " | ",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.normal,
                                                        fontFamily: "Montserrat"),
                                                  ),
                                                  TextSpan(
                                                    text: snapshot.data!.state,
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.normal,
                                                        fontFamily: "Montserrat"),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            SizedBox(height: 20.h),
                          if(snapshot.data!.mode == "Online")  Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15.w),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Demo Link",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xFFA0A0A0),
                                        fontFamily: "Montserrat"),
                                  ),
                                  // Text(
                                  //   "Demo Address",
                                  // style: TextStyle(fontSize: 12,color: Color(0xFFA0A0A0),fontFamily: "Montserrat"),
                                  // ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        top: 11.h,
                                        bottom: 2.h,
                                      ),
                                      child: Divider(
                                        indent: 23.w,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if(snapshot.data!.mode == "Online")    SizedBox(height: 12.h),
                            // Padding(
                            //   padding: EdgeInsets.only(
                            //     left: 16.w,
                            //     right: 15.w,
                            //   ),
                            //   child: const Text("79, Karamveer ZXDDDDNagar, Narela Shankari, Bhopal, Madhya Pradesh, India 567447",style: TextStyle(fontSize: 13,fontFamily: "Montserrat"),),
                            // ),
                            if(snapshot.data!.mode == "Online")  Padding(
                              padding: EdgeInsets.only(
                                left: 16.w,
                                right: 15.w,
                              ),
                              child: CustomTextFormField(
                                onTap: () {
                                    copyTextToClipboard(
                                        snapshot.data!.link.toString());
                                },
                                readOnly: true,
                                hintText: snapshot.data!.link,
                                textInputAction: TextInputAction.done,
                                suffix: Container(
                                    margin: EdgeInsets.fromLTRB(30.w, 10.h, 10.w, 11.h),
                                    child: const Icon(Icons.link_rounded)),
                                suffixConstraints: BoxConstraints(
                                  maxHeight: 45.h,
                                ),
                                contentPadding: EdgeInsets.only(
                                  left: 17.w,
                                  top: 15.h,
                                  bottom: 15.h,
                                ),
                              ),
                            ),
                            SizedBox(height: 24.h),
                            if(snapshot.data!.mode == "Offline") Column(children: [
                              const Text(
                                "Demo Address",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFFA0A0A0),
                                    fontFamily: "Montserrat"),
                              ),
                              Text(snapshot.data!.location.toString(),style: const TextStyle(fontSize: 14),)

                         ],),
                         if(snapshot.data!.mode == "Online") Container(
          padding: EdgeInsets.symmetric(
                                horizontal: 14.w,
                                vertical: 16.h,
                              ),
                              decoration: AppDecoration.fillGray5001.copyWith(
                                borderRadius: BorderRadiusStyle.customBorderBL7,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height: 3.h),
                                  CustomElevatedButton(
                                    onPressed: () {
                                      _launchUrl(Uri.parse(snapshot.data!.link.toString()
                                          )).then((value){
                                        // Get.to(() => const Kyc_Step_Four_Vidio());
                                      });
                                    },
                                    text: "Join Now",
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 22.h),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
