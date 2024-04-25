import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/app_decoration.dart';
import '../../theme/custom_text_style.dart';
import '../../theme/theme_helper.dart';
import 'leads_all.dart';
import 'leads_new.dart';
import 'leads_screen_applied.dart';

class LeadsTabScreens extends StatefulWidget {
  const LeadsTabScreens({super.key});

  @override
  State<LeadsTabScreens> createState() => _LeadsTabScreensState();
}

class _LeadsTabScreensState extends State<LeadsTabScreens>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.colorScheme.primary,
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          children: [
            SizedBox(height: 38.h),
            Text(
              "Leads",
              style: CustomTextStyles.titleLargePrimaryContainer,
            ),
            SizedBox(height: 50.h),
            Expanded(
              child: SizedBox(
                width: double.maxFinite,
                child: Container(
                  decoration: AppDecoration.fillPrimaryContainer.copyWith(
                    borderRadius: BorderRadiusStyle.customBorderTL25,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      20.h.verticalSpace,
                      _buildTabview(),
                      Expanded(
                        child: SizedBox(
                          height: 617,
                          child: TabBarView(
                            controller: _tabController,
                            children: const [
                              LeadsAll(),
                              LeadsNew(),
                              LeadsScreen(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildTabview() {
    return Container(
      height: 36.h,
      // width: 317.w,
      margin: const EdgeInsets.symmetric(horizontal: 11),
      child: TabBar(
        controller: _tabController,
        labelPadding: EdgeInsets.zero,
        labelStyle: const TextStyle(color: Colors.white),
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(15.w),
          color: theme.primaryColor, // Backgrou
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        tabs: [
          Tab(
            child: SizedBox(
              height: 31.h,
              width: 80.w,
              child: const Align(
                alignment: Alignment.center,
                child: Text(
                  "All",
                ),
              ),
            ),
          ),
          const Tab(
            child: Text(
              "New",
            ),
          ),
          const Tab(
            child: Text(
              "Applied",
            ),
          ),
        ],
      ),
    );

  }

// ///Handling page based on route
// Widget getCurrentPage(String currentRoute) {
//   switch (currentRoute) {
//     case AppRoutes.educationalQualificationListPage:
//       return EducationalQualificationListPage();
//     default:
//       return DefaultWidget();
//   }
// }
}
