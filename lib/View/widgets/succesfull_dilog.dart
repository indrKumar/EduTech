// Define a function to create a custom dialog widget
import 'package:flutter/material.dart';

import '../../theme/custom_text_style.dart';
import '../../utils/image_constant.dart';
import 'custom_image_view.dart';

Widget buildCustomDialog(BuildContext context,{title}) {
  return Dialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 3),
          CustomImageView(
            height: 100,
            imagePath: ImageConstant.imgCheckmark8Gray300,
            color: Color(0xFF00C838),
          ),
          SizedBox(height: 20),
          SizedBox(
            child: Text(
              title.toString(),
              textAlign: TextAlign.center,
              style: CustomTextStyles.titleMediumBlack900,
            ),
          ),
        ],
      ),
    ),
  );
}


