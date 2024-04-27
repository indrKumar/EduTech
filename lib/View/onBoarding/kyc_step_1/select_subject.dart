import 'package:edushalaacademy/View/Student/add_bassic_details.dart';
import 'package:edushalaacademy/View/onBoarding/kyc_step_1/category_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../controllers/kyc_one/kyc_controller_one.dart';
import '../../../theme/app_decoration.dart';
import '../../../theme/custom_button_style.dart';
import '../../../theme/custom_text_style.dart';
import '../../../theme/theme_helper.dart';
import '../../../utils/image_constant.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_image_view.dart';

class SelectSubjectPage extends StatefulWidget {
  String? id;
  bool? isParent = false;

  SelectSubjectPage({super.key, this.id, this.isParent});

  @override
  State<SelectSubjectPage> createState() => _SelectSubjectPageState();
}

class _SelectSubjectPageState extends State<SelectSubjectPage> {
  final KycControllerOne kycController = Get.put(KycControllerOne());

  get() async {
    print(widget.isParent);
    setState(() {
      isloading = true;
    });
    kycController.fetchSubCategories(widget.id).then((value) {
      setState(() {
        isloading = false;
      });
    });
    // _homeController.fetchCategoriesParent();
  }

  bool isloading = false;

  @override
  void initState() {
    super.initState();
    get();
    // kycController.fetchSubCategories(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    print("PARENTORNOT:::${widget.isParent}");
    return Scaffold(
      body: isloading
          ? const Center(child: CircularProgressIndicator())
          : Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(
                horizontal: 11.w,
                vertical: 17.h,
              ),

              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 51.h),
                    LinearProgressIndicator(
                      borderRadius: BorderRadius.circular(5),
                      minHeight: 7.5,
                      color: const Color(0XFF01A0E2),
                      backgroundColor: const Color(0xFFE6E6E6),
                      value:
                      1,
                    ),
                    SizedBox(height: 41.h),
                    Text(
                      kycController.message,
                      style: theme.textTheme.headlineMedium,
                    ),
                    SizedBox(height: 5.h),
                    // _buildFortyThree(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6.w),
                      child: GridView.builder(
                        itemCount: kycController.subCategories.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisExtent: 144.w,
                            crossAxisCount: 2,
                            mainAxisSpacing: 17.w,
                            crossAxisSpacing: 30.h),
                        itemBuilder: (BuildContext context, int index) {
                          return catList(context, index: index);
                        },
                      ),
                    ),
                    Container(
                      // width: 275.h,
                      margin: const EdgeInsets.only(
                          left: 39, right: 39, top: 20, bottom: 20),
                      child: Text(
                        "You can choose one category at a time. If you want to choose more than.",
                        // maxLines: 2,
                        textAlign: TextAlign.center,
                        style: CustomTextStyles.labelLargeBlack900_1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
      // bottomNavigationBar: _buildAdd(),
      bottomNavigationBar: _buildSubmitForReviewButton(),
    );
  }

  Widget _buildSubmitForReviewButton() {
    return CustomElevatedButton(
      onPressed: () {
        List<int> subCategoryIds = kycController.selectedSubCategories
            .map((subCategory) => subCategory.id)
            .toList();
        if (widget.isParent == false) {
          kycController.addTeachingPref(subCategoryIds).then((value) {
            if (value != null) {
              if (value["is_error"] == false) {
                kycController.selectedSubCategories.clear();
                Fluttertoast.showToast(msg: "Add Successfully");
                Get.offAll(() => const CategoriesListScreen());
                print("sdjsj$value");
              } else {
                Fluttertoast.showToast(msg: "Please select first");
              }
            }
            print(value);
          });
        } else {
          Get.to(() => const AddBasicDetails());
        }
        // Get.to(Kyc_Step_One_Screen());
        //for student side app
      },
      text: "Add",
      margin: EdgeInsets.only(
        left: 16.w,
        right: 24.w,
        bottom: 34.h,
      ),
      // buttonStyle: CustomButtonStyles.none,
      decoration: CustomButtonStyles.gradientPrimaryToBlueDecoration,
    );
  }

  Widget catList(BuildContext context, {required int index}) {
    var subCategory = kycController.subCategories[index];
    bool isSelected = kycController.selectedSubCategories.contains(subCategory);

    void handleTap() {
      setState(() {
        if (isSelected) {
          kycController.selectedSubCategories.remove(subCategory);
        } else {
          kycController.selectedSubCategories.add(subCategory);
        }
      });
    }

    return GestureDetector(
      onTap: handleTap,
      child: Container(
        decoration: isSelected
            ? AppDecoration.outlineGreenA.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder10,
              )
            : AppDecoration.outlineBlack9001.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder10,
              ),
        // decoration: AppDecoration.outlineBlack9001.copyWith(
        //   borderRadius: BorderRadiusStyle.roundedBorder10,
        // ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: 65.w,
                padding: EdgeInsets.symmetric(
                  horizontal: 3.w,
                  vertical: 2.h,
                ),
                decoration: AppDecoration.outlineGreenA.copyWith(
                  borderRadius: BorderRadiusStyle.customBorderBL9,
                ),
                child: Text(
                  "Vacancy Available!",
                  style: CustomTextStyles.montserratBlack900,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            subCategory.logo == null || subCategory.logo!.trim().isEmpty
                ? CustomImageView(
                    imagePath: ImageConstant.imgBookmark,
                    color: const Color(0xFF817979),
                    height: 30.h,
                    width: 40.w,
                  )
                : CustomImageView(
                    imagePath: subCategory.logo,
                    height: 30.h,
                    width: 40.w,
                  ),
            SizedBox(height: 10.h),

            Text(
              subCategory.name,
              style: CustomTextStyles.titleSmallBluegray80001,
            ),
            // SizedBox(height: 30.w),
          ],
        ),
      ),
    );
  }
}
