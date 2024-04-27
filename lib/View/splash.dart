import 'package:edushalaacademy/View/main_actity.dart';
import 'package:edushalaacademy/View/select_teacher_student.dart';
import 'package:edushalaacademy/controllers/auth_controller.dart';
import 'package:edushalaacademy/controllers/status_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/usertyep_controller.dart';
import '../utils/store_local_data.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final UserTypeController userTypeController = Get.put(UserTypeController());
  final AuthController refreshController = Get.put(AuthController());

  checkLoginStatus() async {
    bool isComplete =
        await SharedPref.getBoolSp(SharedPref.SP_KEY_IS_COMPLETE_IN) ?? false;

    bool isLoggedIn =
        await SharedPref.getBoolSp(SharedPref.SP_KEY_IS_LOGGED_IN) ?? false;
    await userTypeController.checkUserType();
    bool isTeacher = await userTypeController.isTeacher.value;
    refreshController.refreshAccessToken().then((value) async {
      if (!isTeacher) {
        if (kDebugMode) {
          print(isTeacher);
        }
        // Navigator.pushReplacement(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => (const SelectTeacherOrParent())));
        if (isLoggedIn) {
          if (kDebugMode) {
            print("object login  $isTeacher");
          }
          String? accessToken =
              await SharedPref.getStringSp(SharedPref.SP_KEY_ACCESS_TOKEN);
          if (accessToken != null) {
            if (kDebugMode) {
              print("object login");
            }
            SharedPref.accessToken = accessToken;
            if (isComplete) {
              if (kDebugMode) {
                print("Access Token COMPLETE : $accessToken");
              } // Corrected this line to print accessToken
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MainActivity()),
              );
            } else {
              navigateBasedOnStudentStatus();
            }
          }
        } else {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => (const SelectTeacherOrParent())));
        }
      } else {
        if (kDebugMode) {
          print("objectTEACCACVGAGVGA");
        }
        if (isLoggedIn) {
          if (kDebugMode) {
            print("objectlogin    $isTeacher");
          }
          String? accessToken =
              await SharedPref.getStringSp(SharedPref.SP_KEY_ACCESS_TOKEN);
          if (accessToken != null) {
            if (kDebugMode) {
              print("object login");
            }
            SharedPref.accessToken = accessToken;
            if (isComplete) {
              if (kDebugMode) {
                print("Access Token COMPLETE : $accessToken");
              } // Corrected this line to print accessToken
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MainActivity()),
              );
            } else {
              navigateBasedOnStatus();
            }
          }
        } else {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => (const SelectTeacherOrParent())));
        }
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(const Duration(seconds: 5)).then((value) {
      checkLoginStatus();
      // Navigator.pushReplacement(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) =>
      //           // MainActivity()
      //           const SelectTeacherOrParent(),
      //     ));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/splash.png"),
              fit: BoxFit.cover)),
    );
  }
}
