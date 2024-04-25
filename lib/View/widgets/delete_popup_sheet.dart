import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/app_decoration.dart';
import '../../theme/custom_text_style.dart';
import '../../theme/theme_helper.dart';
import 'custom_elevated_button.dart';

Widget customDeletePopup(BuildContext context,{title1,title2,subtitle,submit,void Function()?onTap}) {
  return SingleChildScrollView(
    child: Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20.h,
        vertical: 33.w,
      ),
      decoration: AppDecoration.fillPrimaryContainer.copyWith(
        borderRadius: BorderRadiusStyle.customBorderTL25,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 3.h),
            child: RichText(
              text: TextSpan(
                children: [
                   TextSpan(
                    text: title1 != null ? "${title1} ":"",
                    style: CustomTextStyles.titleMediumcc000000Bold,

                  ),
                  TextSpan(
                    text: "$title2",
                    style: CustomTextStyles.titleMediumff00c1ffBold_1,
                  ),
                ],
              ),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(height: 3.w),
          Container(
            width: 321.h,
            margin: EdgeInsets.only(
              left: 3.h,
              right: 24.h,
            ),
            child: Text(
              subtitle.toString(),
              // overflow: TextOverflow.ellipsis,
              style: CustomTextStyles.titleMediumBlack90016,
            ),
          ),
          SizedBox(height: 28.w),
          CustomElevatedButton(
            onPressed: onTap,
            text: submit.toString(),
          ),
          SizedBox(height: 23),
          Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () {
                  Navigator.pop(context);
                },
              child: Text(
                "Cancel",
                style: theme.textTheme.bodyMedium,
              ),
            ),
          ),
          SizedBox(height: 12.w),
        ],
      ),
    ),
  );
}