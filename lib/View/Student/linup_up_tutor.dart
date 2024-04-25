import 'package:edushalaacademy/View/Student/tutor_profile.dart';
import 'package:edushalaacademy/View/widgets/student/approveandrej.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../controllers/StudentController/pakege_details_controller.dart';
import '../../models/dropdown_popup.dart';
import '../../theme/app_decoration.dart';
import '../../theme/custom_text_style.dart';
import '../../theme/theme_helper.dart';
import '../../utils/store_local_data.dart';
import '../widgets/custom_drop_down.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_text_form_field.dart';

class LinedUpTutorsScreen extends StatefulWidget {
  const LinedUpTutorsScreen({super.key});

  @override
  State<LinedUpTutorsScreen> createState() => _LinedUpTutorsScreenState();
}

class _LinedUpTutorsScreenState extends State<LinedUpTutorsScreen> {
  final PackageDetails controller = Get.put(PackageDetails());
  TextEditingController feedBackController = TextEditingController();

  // String currentStatus = 'New Enquiry';

 Future get() async {
    await controller.fetchShortListedDataList();
    setState(() {});
  }

  // var timePrefString = "";
  var timePref = [
    SelectionPopupModel(
      id: 1,
      title: "12 PM - 3 AM",
      isSelected: true,
    ),
    SelectionPopupModel(
      id: 2,
      title: "11 PM - 12 PM",
    ),
    SelectionPopupModel(
      id: 3,
      title: "11 PM - 12 PM",
    )
  ];

  @override
  void initState() {
    get();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // get();
    return Scaffold(
      body: SizedBox(
        // height: SizeUtils.height,
        width: double.maxFinite,
        child: Column(
          children: [
            50.h.verticalSpace,
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 11),
                child: Text(
                  "Lined-up Tutor",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Montserrat"),
                  // style: theme.textTheme.headlineSmall,
                ),
              ),
            ),
            SizedBox(height: 22.h),
            Expanded(
              child: ListView.builder(
                itemCount: controller.shortListedDataList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) => Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 11.w,
                    vertical: 10.h,
                  ),
                  child: _buildViewProfile1(index),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildViewProfile(id) {

    return GestureDetector(
      onTap: () {
        Get.to(() =>  TutorSProfileDetailsScreen(id:id));
      },
      child: Container(
        height: 50.h,
        width: double.maxFinite,
        // margin: margin,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(23.h)),
            gradient: const LinearGradient(colors: [
              Color(0xFF1356C5),
              Color(0xFF093C90),
            ])),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox.shrink(),
            Text(
              "View Profile",
              style: CustomTextStyles.titleSmallPrimaryContainer,
            ),
            const SizedBox.shrink(),
            10.h.horizontalSpace,
            const Icon(
              Icons.arrow_circle_right,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReject({id}) {
    print(id);
    return Expanded(
      child: CustomElevatedButton(
        decoration: BoxDecoration(
          color: const Color(0xFFF40000).withOpacity(0.10),
          borderRadius: BorderRadius.circular(20),
        ),
        height: 41.h,
        text: "Reject",
        margin: EdgeInsets.only(right: 9.w),
        buttonTextStyle: theme.textTheme.bodyMedium!,
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return SingleChildScrollView(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: Container(
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
                        width: 66.w,
                        child: Divider(
                          color: appTheme.black900.withOpacity(0.4),
                        ),
                      ),
                      SizedBox(height: 26.h),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Reject Tutor",
                          style: CustomTextStyles.titleMediumBlack900,
                        ),
                      ),
                      SizedBox(height: 25.h),
                      CustomTextFormField(
                        controller: feedBackController,
                        hintText:
                            "Please write the reason behind rejecting the tutor.",
                        textInputAction: TextInputAction.done,
                        maxLines: 7,
                        contentPadding: EdgeInsets.all(20.w),
                        borderDecoration:
                            TextFormFieldStyleHelper.outlinePrimaryTL10,
                      ),
                      SizedBox(height: 23.h),
                      CustomElevatedButton(
                        decoration: BoxDecoration(
                            color: const Color(0xFFF40000),
                            borderRadius: BorderRadius.circular(22.h)),
                        text: "Reject Tutor",
                        // buttonTextStyle: CustomTextStyles.titleMediumPrimaryContainerMedium,
                        onPressed: () {
                          controller
                              .rejectListedTutors(
                                  id: id,
                                  status: "r",
                                  feedBAck: feedBackController.text)
                              .then((value) {
                            if (value != null) {
                              if (value["is_error"] == false) {
                                Fluttertoast.showToast(msg: "Rejected");
                                Get.back();
                                Get.back();
                              } else {
                                feedBackController.clear();
                                Get.back();
                                Fluttertoast.showToast(msg: "Internal issue");
                              }
                            }
                            print(value);
                          });
                        },
                      ),
                      SizedBox(height: 15.h),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }



  Widget _buildViewProfile1(index) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 15.w,
        vertical: 12.h,
      ),
      decoration: AppDecoration.outlineBlack9008.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: _buildOutdoorsManPo(
              img: controller.shortListedDataList[index].profilePic ?? '',
              abhishekMalviya: controller.shortListedDataList[index].name ?? '',
              bTechMCAHindi:
                  controller.shortListedDataList[index].education.join(", ") ??
                      "B. Tech, MCA",
              subjects:
                  controller.shortListedDataList[index].teaches.join(", ") ??
                      "B. Tech, MCA",
            ),
          ),
          SizedBox(height: 12.h),
          const Divider(),
          SizedBox(height: 15.h),
          _buildViewProfile(controller.shortListedDataList[index].id),
          SizedBox(height: 17.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildReject(
                id: controller.shortListedDataList[index].id,
              ),
              buildApprove(context,id: controller.shortListedDataList[index].id,controller: controller,name: "Approve",
                style: theme.textTheme.bodyMedium!,
                decoration:  BoxDecoration(
                color: const Color(0xFF00C838).withOpacity(0.10),
                borderRadius: BorderRadius.circular(20),

              ),),
            ],
          ),
          SizedBox(height: 2.h),
        ],
      ),
    );
  }

  Widget _buildOutdoorsManPo({
    required String abhishekMalviya,
    required String bTechMCAHindi,
    required String subjects,
    required String img,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              image: img.isNotEmpty
                  ? DecorationImage(image: NetworkImage(img), fit: BoxFit.fill)
                  : null,
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(10)),
          height: 83,
          width: 83,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              left: 14.w,
              bottom: 9.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  abhishekMalviya,
                  // style: CustomTextStyles.titleMediumMedium.copyWith(
                  //   color: appTheme.black900,
                  // ),
                ),
                SizedBox(height: 5.h),
                SizedBox(
                  width: 232.w,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          child: Text(
                            bTechMCAHindi,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.bodyMedium!.copyWith(
                              color: appTheme.black900,
                              height: 1.57,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          child: Text(
                            subjects,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.bodyMedium!.copyWith(
                              color: appTheme.black900,
                              height: 1.57,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: 221.w,
                          child: Divider(
                            color: appTheme.black900.withOpacity(0.1),
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
      ],
    );
  }
}
