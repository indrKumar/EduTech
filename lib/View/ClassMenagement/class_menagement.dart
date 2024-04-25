import 'package:edushalaacademy/View/ClassMenagement/tabs/active.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../theme/app_decoration.dart';
import '../../theme/custom_text_style.dart';
import '../../theme/theme_helper.dart';

class ClassManagement extends StatefulWidget {
  const ClassManagement({super.key});

  @override
  State<ClassManagement> createState() => _ClassManagementState();
}

class _ClassManagementState extends State<ClassManagement>
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
              "All Classes",
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
                          height: 617.h,
                          child: TabBarView(
                            controller: _tabController,
                            children:  [
                              ActiveTab(type: "RuningClass",),
                              ActiveTab(type: "Demo",),
                              ActiveTab(),
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
      height: 31.h,
      // width: 317.w,
      margin: EdgeInsets.only(left: 21.w),
      child: TabBar(
        onTap: (value) {

        },
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
                  "Active",
                ),
              ),
            ),
          ),
          const Tab(
            child: Text(
              "Demo",
            ),
          ),
          const Tab(
            child: Text(
              "Inactive",
            ),
          ),
        ],
      ),
    );
  }



}
