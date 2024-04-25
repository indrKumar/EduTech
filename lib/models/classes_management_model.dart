
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../utils/image_constant.dart';

class ClassManagementModel {
  ClassManagementModel({
    this.userName,
    this.userDetails,
    this.startImage,
    this.startText,
    this.endImage,
    this.endText,
    this.extendImage,
    this.extendText,
    this.leaveImage,
    this.leaveText,
    this.id,
  }) {
    userName = userName ?? Rx("Abhishek Malviya");
    userDetails = userDetails ??
        Rx("Hindi, Mathematics, Science\nOnline | 1h 30m | 15 Days");
    startImage = startImage ?? Rx(ImageConstant.imgStart3);
    startText = startText ?? Rx("Start");
    endImage = endImage ?? Rx(ImageConstant.imgStop2);
    endText = endText ?? Rx("End");
    extendImage = extendImage ?? Rx(ImageConstant.imgExtension2);
    extendText = extendText ?? Rx("Extend");
    leaveImage = leaveImage ?? Rx(ImageConstant.imgSettingsRedA700);
    leaveText = leaveText ?? Rx("Leave");
    id = id ?? Rx("");
  }

  Rx<String>? userName;

  Rx<String>? userDetails;

  Rx<String>? startImage;

  Rx<String>? startText;

  Rx<String>? endImage;

  Rx<String>? endText;

  Rx<String>? extendImage;

  Rx<String>? extendText;

  Rx<String>? leaveImage;

  Rx<String>? leaveText;

  Rx<String>? id;
}
