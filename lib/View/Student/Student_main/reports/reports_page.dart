import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../theme/app_decoration.dart';
import '../../../../theme/custom_text_style.dart';
import '../../../../theme/theme_helper.dart';
import '../../../../utils/image_constant.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/custom_image_view.dart';

class ReportsPageS extends StatefulWidget {
  const ReportsPageS({super.key});

  @override
  State<ReportsPageS> createState() => _ReportsPageSState();
}

class _ReportsPageSState extends State<ReportsPageS> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 48.h),
                Column(
                  children: [
                    Container(
                      width: 306.w,
                      margin: EdgeInsets.only(
                        left: 42.w,
                        right: 41.w,
                      ),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Personalized EHC Report by Coach ",
                              style: CustomTextStyles.titleMediumff000000_1
                                  .copyWith(
                                height: 1.22,
                              ),
                            ),
                            TextSpan(
                              text: " Arvind Pandey",
                              style: CustomTextStyles.titleMediumff1356c5_1,
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 17.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.calendar_month,
                          color: Colors.grey,
                          size: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 13.w,
                            top: 2.h,
                          ),
                          child: const Text(
                            "Jan 17, 2024",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            // style: CustomTextStyles.labelLargeGray500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 26.h),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 78.w),
                      padding: EdgeInsets.symmetric(
                        horizontal: 23.w,
                        vertical: 21.h,
                      ),
                      decoration: AppDecoration.outlinePrimary2.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder10,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 109,
                            width: 109,
                            child: Stack(
                              alignment: Alignment.topRight,
                              children: [
                                CustomImageView(
                                  imagePath: ImageConstant.imgUntitled71,
                                  height: 109,
                                  width: 109,
                                  radius: BorderRadius.circular(
                                    60,
                                  ),
                                  alignment: Alignment.center,
                                ),
                                CustomImageView(
                                  imagePath: ImageConstant.imgFavorite,
                                  height: 27,
                                  width: 27,
                                  alignment: Alignment.topRight,
                                  margin: EdgeInsets.only(top: 8.h),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 17.h),
                          const Text("Arvind Kumar Pandey",
                              style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16)),
                          SizedBox(height: 7.h),
                          Text(
                            "M. Sc. (Maths)",
                            style: CustomTextStyles.bodySmall10,
                          ),
                          SizedBox(height: 6.h),
                        ],
                      ),
                    ),
                    SizedBox(height: 33.h),
                    const Image(
                      image: AssetImage("assets/images/Group 46750 (3).png"),
                      fit: BoxFit.fill,
                    ),
                    _buildInvigilationAnalysis(),
                    SizedBox(height: 23.h),
                    _buildPositiveFeedba(),
                    SizedBox(height: 56.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.w),
                        child: Text(
                          "SWOT Analysis",
                          style: theme.textTheme.titleMedium,
                        ),
                      ),
                    ),
                    SizedBox(height: 22.h),
                    _buildReporthistory(
                        title: "Strength",
                        subTitle:
                            "Conceptual learning is strong for Maths and Science both",
                        icon: "assets/images/Strenght.png"),
                    SizedBox(height: 46.h),
                    _buildReporthistory(
                        title: "Weakness",
                        subTitle:
                            "Conceptual learning is strong for Maths and Science both",
                        icon: "assets/images/weakness.png"),
                    SizedBox(height: 22.h),
                    _buildReporthistory(
                        decoration: BoxDecoration(
                            color: const Color(0xFFD53B3B).withOpacity(0.10),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40.h),
                              bottomRight: Radius.circular(40.h),
                            )),
                        title: "Opportunities",
                        subTitle:
                            "Conceptual learning is strong for Maths and Science both",
                        icon: "assets/images/opportunity.png"),
                    SizedBox(height: 46.h),
                    _buildReporthistory(
                        decoration: BoxDecoration(
                            color: const Color(0xFFD53B3B).withOpacity(0.10),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40.h),
                              bottomRight: Radius.circular(40.h),
                            )),
                        title: "Threats",
                        subTitle:
                            "Conceptual learning is strong for Maths and Science both",
                        icon: "assets/images/threats1.png"),
                    40.h.verticalSpace,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 19.h),
                        child: const Text(
                          "Academic Report",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontFamily: "Montserrat"),
                        ),
                      ),
                    ),
                    40.h.verticalSpace,
                    _buildAveragePercentage(),
                    SizedBox(height: 18.h),
                    _buildSubject(),
                    SizedBox(height: 67.h),
                    SizedBox(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: "Strategic Thinking and Road mapping ",
                              style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            TextSpan(
                              text: "Short-term Goal  ( 20-25 days )",
                              style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: theme.primaryColor),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 14.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.h),
                      child: _buildTick(),
                    ),
                    SizedBox(height: 58.h),
                    SizedBox(
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  const TextSpan(
                                    text: "Have any",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontFamily: "Montserrat"),
                                  ),
                                  TextSpan(
                                    text: " Questions",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).primaryColor,
                                        fontFamily: "Montserrat"),
                                  ),
                                  const TextSpan(
                                    text: " regarding us?",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontFamily: "Montserrat"),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Image(
                                image: AssetImage(
                              ImageConstant.aroPng,
                            )),
                            CustomElevatedButton(
                              buttonTextStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  fontFamily: "Montserrat",
                                  color: Colors.white),
                              height: 42.h,
                              width: 195.w,
                              text: "Contact Us",
                              // buttonStyle: CustomButtonStyles.outlineBlack,
                              // alignment: Alignment.bottomCenter,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 14.h),
                    const Text(
                      "Or",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          fontFamily: "Montserrat"),
                    ),
                    SizedBox(height: 14.h),
                    CustomElevatedButton(
                      height: 42.h,
                      width: 195.w,
                      text: "Consult With Coach",
                      buttonTextStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          fontFamily: "Montserrat",
                          color: Colors.white),
                    ),
                  ],
                ),
                150.h.verticalSpace
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInvigilationAnalysis() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
        vertical: 25.h,
      ),
      decoration: AppDecoration.fillLightblueA400.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 3.h),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Text(
                "Invigilation Analysis",
                style: theme.textTheme.titleMedium,
              ),
            ),
          ),
          SizedBox(height: 24.h),
          invigilation(
              title: "Syllabus Coverage",
              subtitle: "Ahead from School",
              outOff: "7/10"),
          SizedBox(height: 26.h),
          invigilation(
              title: "Tuition Copy Maintenance",
              subtitle: "Tuition Copy Maintenance",
              outOff: "7/10"),
          SizedBox(height: 26.h),
          section(a: "A", title: "General Overviews of Studies"),
          SizedBox(height: 27.h),
          invigilation(
              title: "Conceptual Learnings",
              subtitle: "Good with concepts",
              outOff: "7/10"),
          SizedBox(height: 27.h),
          section(a: "B", title: "Answer sheet Analysis"),
          SizedBox(height: 27.h),
          invigilation(
              title: "Conceptual Clarity",
              subtitle: "Good with concepts",
              outOff: "7/10"),
          SizedBox(height: 27.h),
          invigilation(
              title: "Time Management",
              subtitle: "Good. Managed to Complete paper on time",
              outOff: "7/10"),
          SizedBox(height: 27.h),
          invigilation(
              title: "Presentation Skills",
              subtitle:
                  "Handwriting is above Average. But still needs improvement.",
              outOff: "7/10"),
          SizedBox(height: 27.h),
          invigilation(
              title: "Question Understanding",
              subtitle: "Good",
              outOff: "7/10"),
          SizedBox(height: 27.h),
        ],
      ),
    );
  }

  Widget section({a, title}) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        //   horizontal: 38.w,
        vertical: 10.h,
      ),
      decoration: AppDecoration.fillPrimaryContainer.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder16,
      ),
      child: Center(
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "$a. ",
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Montserrat",
                    color: Colors.black),
              ),
              TextSpan(
                text: title,
                style: CustomTextStyles.bodyLargeff000000,
              ),
            ],
          ),
          textAlign: TextAlign.left,
        ),
      ),
    );
  }

  Widget invigilation({title, subtitle, outOff}) {
    return Padding(
      padding: EdgeInsets.only(
        left: 13.w,
        right: 9.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Image.asset("assets/images/7:10.png"),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 19.w,
                      top: 13.h,
                      bottom: 13.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title.toString(),
                          // style: CustomTextStyles.titleSmallSemiBold_1,
                        ),
                        SizedBox(height: 3.h),
                        Text(
                          subtitle,
                          style: CustomTextStyles.bodySmall9,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 12.h,
              bottom: 29.h,
            ),
            child: Text(
              outOff,
              style: CustomTextStyles.titleSmallLightblueA400,
            ),
          ),
        ],
      ),
    );
  }

  // /// Section Widget
  Widget _buildPositiveFeedba() {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 36.h,
      ),
      decoration: AppDecoration.fillLightblueA400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
              child: SizedBox(
                  width: double.infinity,
                  child: Image(
                    image: AssetImage(
                        "assets/images/Positive-Feedback-and-Positive-Feedback-Examples-blog-640x427 1.png"),
                    fit: BoxFit.fitWidth,
                    width: double.infinity,
                  ))),
          SizedBox(height: 41.h),
          Container(
            margin: EdgeInsets.only(right: 85.w),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Parent’s / Guardians Review",
                    style: CustomTextStyles.titleMediumff000000_1,
                  ),
                  TextSpan(
                    text: "(Mrs. Bhawna Pawar)",
                    style: CustomTextStyles.bodyLargeff00000018,
                  ),
                ],
              ),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(height: 51.h),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 5,
            shrinkWrap: true,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(left: 17.w, right: 30.w, bottom: 10.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.only(left: 6.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 1.w),
                            child: const Text(
                              "Parent’s / Guardians Review",
                              // style: CustomTextStyles.titleMediumSemiBold_1,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          SizedBox(
                            child: Text(
                              "Educator is regular. Missed classes are covered up in the same week.",
                              style: theme.textTheme.bodyLarge,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildReporthistory({title, subTitle, decoration, icon}) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 2.w,
            vertical: 1.h,
          ),
          decoration: decoration ??
              AppDecoration.fillLightblueA400.copyWith(
                borderRadius: BorderRadiusStyle.customBorderTL40,
              ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 31.h),
              Padding(
                padding: EdgeInsets.only(left: 18.h),
                child: Text(
                  title.toString(),
                  style: const TextStyle(
                      fontSize: 18,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(height: 29.h),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) => Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(left: 18.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: 1.h,
                          ),
                          child: Column(
                            children: [
                              const Icon(
                                Icons.check_circle,
                                color: Colors.green,
                              ),
                              SizedBox(height: 33.h),
                            ],
                          ),
                        ),
                        Flexible(
                          child: Container(
                            margin: EdgeInsets.only(left: 16.w),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: SizedBox(
                                child: Text(
                                  subTitle.toString(),
                                  style: theme.textTheme.bodyLarge,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              if (icon != null)
                Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Image(image: AssetImage(icon)),
                    )),
              20.h.verticalSpace,
            ],
          ),
        ));
  }

// /// Section Widget
  Widget _buildAveragePercentage() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.symmetric(
        horizontal: 17.w,
        vertical: 20.h,
      ),
      decoration: AppDecoration.outlineGray30003.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Row(
              children: [
                CustomImageView(
                  imagePath: "assets/images/percentage.png",
                  width: 36.w,
                  margin: EdgeInsets.symmetric(vertical: 1.h),
                ),
                Flexible(
                  child: Container(
                    margin: EdgeInsets.only(
                      left: 13.w,
                      top: 1.h,
                    ),
                    child: Text(
                      "Average percentage of all the subjects",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30.w, 6.h, 2.w, 7.h),
            child: Text(
              "78.5 %",
              style: CustomTextStyles.titleLargeBold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubject() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.symmetric(
        horizontal: 9.w,
        vertical: 13.h,
      ),
      decoration: AppDecoration.outlineGray300031.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: Row(
              children: [
                Text(
                  "Subject",
                  style: CustomTextStyles.labelLargeBlack900Bold,
                ),
                const Spacer(),
                Text(
                  "Total Questions",
                  style: CustomTextStyles.labelLargeBlack900Bold,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 21.w),
                  child: Text(
                    "Total Marks",
                    style: CustomTextStyles.labelLargeBlack900Bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 27.h),
          Padding(
            padding: EdgeInsets.only(right: 63.w),
            child: _buildScience(
              science: "Maths",
              eight: "07",
              oneThousandTwoHundredTwenty: "17/20",
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScience({
    required String science,
    required String eight,
    required String oneThousandTwoHundredTwenty,
  }) {
    return Row(
      children: [
        Text(
          science,
          style: theme.textTheme.bodySmall!.copyWith(
            color: appTheme.black900,
          ),
        ),
        const Spacer(
          flex: 40,
        ),
        Text(
          eight,
          style: theme.textTheme.bodySmall!.copyWith(
            color: appTheme.black900,
          ),
        ),
        const Spacer(
          flex: 59,
        ),
        Text(
          oneThousandTwoHundredTwenty,
          style: theme.textTheme.bodySmall!.copyWith(
            color: appTheme.black900,
          ),
        ),
      ],
    );
  }

//
  Widget _buildTick({String? description}) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 22.h,
      ),
      decoration: AppDecoration.fillLightblueA400.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 5,
        shrinkWrap: true,
        itemBuilder: (context, index) => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 7.h,
                bottom: 22.h,
              ),
              child: const Icon(
                Icons.check_circle,
                color: Colors.green,
                weight: 18,
              ),
            ),
            Expanded(
              child: Container(
                width: 276.w,
                margin: EdgeInsets.only(
                  left: 16.w,
                  top: 5.h,
                ),
                child: Text(
                  "Set the deadlines to cover NCERT along with refresher and different publications",
                  maxLines: 12,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodyLarge!.copyWith(
                    color: appTheme.black900,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
