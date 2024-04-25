import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/app_decoration.dart';
import '../../theme/custom_text_style.dart';
import '../../theme/theme_helper.dart';

Widget customDetails(BuildContext context) {
  return Container(
    width: double.maxFinite,
    padding: const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 15,
    ),
    decoration: AppDecoration.fillPrimaryContainer.copyWith(
      borderRadius: BorderRadiusStyle.customBorderTL25,
    ),
    child: Stack(
      children: [
        const Positioned(
            right: 10,
            child: Image(image: AssetImage("assets/images/Counted.png"))),
        Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 66,
            child: Divider(
              color: appTheme.black900.withOpacity(0.4),
            ),
          ),
          const SizedBox(height: 33),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 4),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Class Details ",
                      style: CustomTextStyles.titleMediumff000000Bold_1,
                    ),
                    TextSpan(
                      text: "(01/01/2024)",
                      style: CustomTextStyles.bodyLargeff00000018,
                    ),
                  ],
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          const SizedBox(height: 27),
          _buildLineNinety(),
          const SizedBox(height: 4),
          _buildTime(),
          const SizedBox(height: 3),
          _buildStartTime(),
          const SizedBox(height: 17),
          Divider(
            color: appTheme.black900.withOpacity(0.2),
            indent: 4,
            endIndent: 4,
          ),
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Text(
                "Time Breakup",
                style: CustomTextStyles.titleMediumBold_1,
              ),
            ),
          ),
          const SizedBox(height: 13),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: _buildExtraClass(
              extraClassText: "Regular Class",
              hrText: "01:05 hr",
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: _buildExtraClass(
              extraClassText: "Extra Class",
              hrText: "01:00 hr",
            ),
          ),
          const SizedBox(height: 7),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: _buildExtraClass(
              extraClassText: "Recovery Class (Tutor)",
              hrText: "01:05 hr",
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: _buildExtraClass(
              extraClassText: "Recovery Class (Student)",
              hrText: "01:00 hr",
            ),
          ),
          SizedBox(height: 22),
          Divider(
            color: appTheme.black900.withOpacity(0.2),
            indent: 4,
            endIndent: 4,
          ),
          SizedBox(height: 18),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 4),
              child: Text(
                "Topics Covered",
                style: CustomTextStyles.titleMediumBold_1,
              ),
            ),
          ),
          SizedBox(height: 8),
          SizedBox(
            // width: 353,
            child: Text(
              "Kindly make sure you select the correct option which defines you best. You can’t switch it later.Kindly make sure you select the correct option which defines you best. You can’t switch it later.",
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.justify,
              style: CustomTextStyles.titleSmallBlack900_2,
            ),
          ),
          SizedBox(height: 22),
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Text(
              "Cancel",
              style: theme.textTheme.titleMedium!.copyWith(
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          SizedBox(height: 19),
        ],
      ),
    ]),
  );
}

Widget _buildLineNinety() {
  return SizedBox(
    height: 13,
    width: 350,
    child: Stack(
      alignment: Alignment.center,
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: 5),
            child: SizedBox(
              width: 350,
              child: Divider(
                color: appTheme.black900.withOpacity(0.2),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 38,
              right: 44,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 13,
                  width: 13,
                  decoration: BoxDecoration(
                    color: appTheme.redA700,
                    borderRadius: BorderRadius.circular(
                      6,
                    ),
                  ),
                ),
                Container(
                  height: 13,
                  width: 13,
                  decoration: BoxDecoration(
                    color: appTheme.greenA700,
                    borderRadius: BorderRadius.circular(
                      6,
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

Widget _buildTime() {
  return Padding(
    padding: const EdgeInsets.only(
      left: 10,
      right: 1,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 6),
          child: Text(
            "08:30 PM",
            style: CustomTextStyles.titleMediumBold16,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 7),
          child: Text(
            "1 h 27 min",
            style: CustomTextStyles.titleMedium16_1,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 6),
          child: Text(
            "09:42 PM",
            style: CustomTextStyles.titleMediumBold16,
          ),
        ),
      ],
    ),
  );
}

Widget _buildStartTime() {
  return Padding(
    padding: EdgeInsets.only(
      left: 4,
      right: 16,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Start Time",
          style: theme.textTheme.bodyLarge,
        ),
        Text(
          "End Time",
          style: theme.textTheme.bodyLarge,
        ),
      ],
    ),
  );
}

Widget _buildExtraClass({
  required String extraClassText,
  required String hrText,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        extraClassText,
        style: CustomTextStyles.bodyMediumMontserrat_1.copyWith(
          color: appTheme.black900,
        ),
      ),
      Text(
        hrText,
        style: CustomTextStyles.titleSmallBold.copyWith(
          color: appTheme.black900,
        ),
      ),
    ],
  );
}