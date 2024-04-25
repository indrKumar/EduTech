import 'package:edushalaacademy/routes/app_routes.dart';
import 'package:edushalaacademy/theme/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'controllers/kyc_one/overview_three_controller.dart';

void main() {
  Get.put(OverviewThreeController());
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(428, 926),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, __) {
          return GetMaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: theme,
            themeMode: ThemeMode.system,
            initialRoute: AppRoutes.initialRoute,
            getPages: AppRoutes.pages,
          );
        });
  }
}
