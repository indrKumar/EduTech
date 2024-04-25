import 'package:edushalaacademy/View/ClassMenagement/attandance_history.dart';
import 'package:edushalaacademy/View/widgets/class_management_sheets/bottoms_shets.dart';
import 'package:edushalaacademy/controllers/tutor_class_contrpller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../models/tutor_class_model.dart';
import '../../../theme/app_decoration.dart';
import '../../../theme/custom_text_style.dart';
import '../../../utils/image_constant.dart';
import '../../widgets/custom_image_view.dart';

class ActiveTab extends StatefulWidget {
   ActiveTab({super.key,this.type});
String? type;
  @override
  State<ActiveTab> createState() => _ActiveTabState();
}

class _ActiveTabState extends State<ActiveTab> {
  final TutorController _controller = TutorController();
  final List<TutorClass> _tutorClasses = [];
  int _pageNumber = 1;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchTutorClasses();
  }

  Future<void> _fetchTutorClasses() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final List<TutorClass> newTutorClasses = await _controller.fetchTutorClasses(type: widget.type);
      setState(() {
        _tutorClasses.addAll(newTutorClasses);
        _pageNumber++;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // SizedBox(height: 29.h),
          _buildUserProfile(),
        ],
      ),
    );
  }

  Widget _buildUserProfile() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 11.w),
      child:  ListView.builder(
          shrinkWrap: true,
          itemCount: _tutorClasses.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:  const EdgeInsets.symmetric(vertical: 7),
              child: GestureDetector(
                  onTap: () {
                    Get. to(()=>const AttendanceHistory());
                  },
                  child: classList(context,name:_tutorClasses[index].name,days: _tutorClasses[index].days??'',hour: _tutorClasses[index].hour??'')),
            );
          },
        ),
    );
  }

  Widget classList(BuildContext context,{String?name,hour,days}) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 7.w,
        vertical: 9.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius. circular(10),
          color: Colors.white,
          boxShadow: const [BoxShadow(color: Colors.grey,offset: Offset(0.1, 1),spreadRadius: 2,blurRadius: 5)]),
      // AppDecoration.outlineBlack90012.copyWith(
      //   color: Colors.white,
      //   borderRadius: BorderRadiusStyle.roundedBorder10,
      // ),
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
                          name??"",
                            style: CustomTextStyles.titleMedium16_1,
                          ),

                        SizedBox(height: 9.h),
                        SizedBox(
                          child: Text(
                            "Hindi, Mathematics, Science Online | $hour | ${days.toString().isNotEmpty ? "$days Days"  :""}",
                              style: CustomTextStyles.bodyMediumMontserrat_1
                                  .copyWith(
                                height: 1.57,
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
          SizedBox(height: 15.h),
          Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                 onTap: () {
                   showModalBottomSheet(context: context, builder: (context) {
                     return SheetsHelper().startClass(context);
                   },);
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
                       padding:   EdgeInsets.only(top: 1.h),
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
                          child:
                          Text(
                             "Start",
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
                      context: context, builder: (context) {
                      return Padding(
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom
                        ),
                        child: SheetsHelper().groupPunchOut(context),
                      );
                    },);
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
                          padding:   EdgeInsets.only(top: 1.h),
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
                  onTap: () {
                    showModalBottomSheet(context: context, builder: (context) {
                      return SheetsHelper().extendClass(context);
                    },);
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
                      context: context, builder: (context) {
                      return SheetsHelper().leaveMark(context);
                    },);
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
                          padding:EdgeInsets.symmetric(vertical: 2.h),
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
          ),
        ],
      ),
    );
  }

}
