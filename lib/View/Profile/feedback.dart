import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../models/dropdown_popup.dart';
import '../../theme/app_decoration.dart';
import '../../theme/custom_text_style.dart';
import '../../theme/theme_helper.dart';
import '../../utils/image_constant.dart';
import '../widgets/app_bar/appbar_leading_image.dart';
import '../widgets/app_bar/appbar_subtitle_seven.dart';
import '../widgets/app_bar/custom_app_bar.dart';
import '../widgets/custom_drop_down.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_image_view.dart';
import '../widgets/custom_text_form_field.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  int selectedNumber = 0;


  String isSelected = "feed";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(),
        body: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 33.h),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildView(),
                    SizedBox(height: 28.h),
                    if(isSelected != "comp") Text(
                        "How likely is it that you would recommend my service to a friend or colleague",
                        style: theme.textTheme.bodyLarge),
                    SizedBox(height: 13.h),
                    if(isSelected != "comp")  SizedBox(
                      height: 30,
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: _colors.length,
                        itemBuilder: (context, index) {
                      return  _buildWidget(_colors[index],"$index");
                      },),
                    ),
                    if(isSelected != "comp")  SizedBox(height: 29.h),
                    if(isSelected != "comp")  _buildLineSeventyTwo(),

                    if(isSelected == "comp")  if(isSelected == "comp")  CustomDropDown(
                      hintText: "Select complain type",
                      items: <SelectionPopupModel>[
                        SelectionPopupModel(
                          id: 1,
                          title: "Item One",
                          isSelected: true,
                        ),
                        SelectionPopupModel(
                          id: 2,
                          title: "Item Two",
                        ),
                        SelectionPopupModel(
                          id: 3,
                          title: "Item Three",
                        )
                      ],
                      onChanged: (value) {
                        // controller.onSelected(value);
                      },
                      icon: const Icon(
                        Icons.keyboard_arrow_down_sharp,
                        size: 32,
                        color: Colors.transparent,
                      ),
                    ),
                    if(isSelected == "comp")  SizedBox(height: 18.h),
                    if(isSelected == "comp")  Text("Write Feedback", style: theme.textTheme.bodyLarge),
                    if(isSelected != "comp") Text(
                        "Please give us some suggestion to Imrpove our services",
                        style: theme.textTheme.bodyLarge),
                    SizedBox(height: 16.h),
                    CustomTextFormField(
                        // controller: controller.writeyourthoughtsController,
                        hintText: "Write your thoughts about this app....",
                        textInputAction: TextInputAction.done,
                        maxLines: 12,
                        contentPadding: EdgeInsets.all(20.w),
                        borderDecoration:
                            TextFormFieldStyleHelper.outlinePrimaryTL10),
                    SizedBox(height: 5.h)
                  ]),
            )),
        bottomNavigationBar: _buildSubmit());
  }

  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        leadingWidth: 28.w,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 21.w, top: 21.h, bottom: 22.h),
            onTap: () {
              onTapArrowLeft();
            }),
        title: AppbarSubtitleSeven(
            text: "Feedback/Complaints", margin: EdgeInsets.only(left: 22.w)));
  }

  Widget _buildLineSeventyTwo() {
    return SizedBox(
        height: 20.h,
        // width: 336.w,
        child:
        Container(
          width: MediaQuery.of(context).size.width - 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: _colors,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: Slider(
            activeColor: Colors.transparent,
            inactiveColor:  Colors.transparent,
            value: 0.2,
            onChanged: (double value) {
              setState(() {
                // _currentValue = value;
              });
            },
          ),
        ),
        // Stack(alignment: Alignment.centerRight, children: [
        //   Align(
        //       alignment: Alignment.bottomCenter,
        //       child: Padding(
        //           padding: EdgeInsets.only(bottom: 5.h),
        //           child: const SizedBox(
        //               child: Divider(
        //             color: Colors.orangeAccent,
        //           )))),
        //   Padding(
        //       padding: EdgeInsets.only(right: 52.w),
        //       child: CustomIconButton(
        //           height: 37.h,
        //           width: 37.w,
        //           padding: EdgeInsets.all(7.w),
        //           decoration: IconButtonStyleHelper.outlineBlack,
        //           alignment: Alignment.centerRight,
        //           child: CustomImageView(imagePath: ImageConstant.imgGroup962)))
        // ])
    );
  }

  Widget _buildView() {
    return Padding(
        padding: EdgeInsets.only(right: 4.w),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Expanded(
              child: GestureDetector(
                onTap: () {
setState(() {
  isSelected = "feed";
});
                },
                child: Container(
                    margin: EdgeInsets.only(right: 6.w),
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 11.h),
                    decoration: isSelected != "comp"?AppDecoration.outlineDeepPurple.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder10):AppDecoration.outlineGray.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder10),
                    child: Row(children: [
                      if(isSelected != "comp") CustomImageView(color: theme.primaryColor,
                          imagePath: ImageConstant.imgTickCircle1,
                          height: 35.h,
                          width: 35.w,
                          margin: EdgeInsets.only(top: 2.w)),
                      Padding(
                          padding:
                              EdgeInsets.only(left: 5.w, top: 5.h, bottom: 5.h),
                          child: Text("Feedback",
                              style: CustomTextStyles.bodyMediumMontserrat_1))
                    ])),
              )),
          Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isSelected = "comp";
                  });
                },
                child: Container(
                    margin: EdgeInsets.only(left: 6.w),
                    padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 7.h),
                    decoration: isSelected == "comp"?AppDecoration.outlineDeepPurple.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder10):AppDecoration.outlineGray.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder10),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          if(isSelected == "comp") CustomImageView(color: theme.primaryColor,
                              imagePath: ImageConstant.imgTickCircle1,
                              height: 35.h,
                              width: 35.w,
                              margin: EdgeInsets.only(top: 2.w)),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 11.w, top: 11.h, bottom: 7.h),
                              child: Text("Complaints",
                                  style: CustomTextStyles.bodyMediumMontserrat_1))
                        ])),
              ))
        ]));
  }


  final List<Color> _colors = [
    appTheme.redA700,
    appTheme.deepOrangeA40001,
    appTheme.deepOrangeA400,
    appTheme.yellow900,
    appTheme.yellow80002,
    appTheme.yellow80001,
    appTheme.lime700,
    appTheme.lightGreen600,
    appTheme.green500,
    appTheme.green500,
    appTheme.greenA700,
  ];
  Widget _buildSubmit() {
    return CustomElevatedButton(
        text: "Submit",
        margin: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 39.h),
        buttonTextStyle: CustomTextStyles.titleMediumPrimaryContainer_3);
  }

  Widget _buildWidget(color,number) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          CircleAvatar(
              // width: 25,
              // height: 25,
            radius: 14,
              // padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              backgroundColor: color,
              child:
                  Center(child: Text(number.toString(), style: CustomTextStyles.bodySmallPrimaryContainer))),
        ]));
  }

  onTapArrowLeft() {
    Get.back();
  }
}


class CustomSlider extends StatelessWidget {
  final List<Color> colors;
  final int selectedValue;
  final Function(int) onChanged;

  const CustomSlider({super.key,
    required this.colors,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) {
          final double width = constraints.maxWidth;
          const double spacing = 5.0;
          final double circleSize = (width / (colors.length - 1)) - spacing;

          return Stack(
              children: [
                // Background track with subtle gradient (optional)
                Container(
                  width: width,
                  height: circleSize + spacing,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(circleSize / 2),
                    gradient: LinearGradient(
                      colors: colors,
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                ),]);});}}
