import 'package:edushalaacademy/View/widgets/circularindicaror.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../controllers/StudentController/pakege_details_controller.dart';
import '../../models/tutor_details_model.dart';
import '../../theme/custom_button_style.dart';
import '../../theme/custom_text_style.dart';
import '../../theme/theme_helper.dart';
import '../../utils/image_constant.dart';
import '../widgets/app_bar/custom_app_bar.dart';
import '../widgets/custom_image_view.dart';
import '../widgets/custom_rating_bar.dart';
import '../widgets/student/approveandrej.dart';

class TutorSProfileDetailsScreen extends StatefulWidget {
  final id;

  const TutorSProfileDetailsScreen({super.key, this.id});

  @override
  State<TutorSProfileDetailsScreen> createState() =>
      _TutorSProfileDetailsScreenState();
}

class _TutorSProfileDetailsScreenState
    extends State<TutorSProfileDetailsScreen> {
  final PackageDetails controller = Get.put(PackageDetails());
  TextEditingController feedBackController = TextEditingController();

  // Future get(id) async {
  //   await controller.fetchShortListedDataDetails(id: id);
  //   setState(() {});
  // }

  late Future<Profile> _profileFuture;

  List<String> listOfTeaches = [
    "Accounts",
    "Accounts",
    "Accounts",
    "Computer Science"
  ];

  @override
  void initState() {
    // TODO: implement initState
    // get(widget.id);
    _profileFuture = controller.fetchProfileDetails(id: widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.colorScheme.primary,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70), child: _buildAppBar()),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 19.w, vertical: 12.h),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30))),
        // decoration: AppDecoration.fillPrimaryContainer.copyWith(
        //     borderRadius: BorderRadiusStyle.roundedBorder30),
        child: FutureBuilder<Profile>(
          future: _profileFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return MyCircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return SingleChildScrollView(
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildOutdoorsManPo(
                          name: snapshot.data!.data.name,
                          pic: snapshot.data!.data.profilePic,
                          verify: snapshot.data!.data.verified,
                          star: snapshot.data!.data.stars),
                      SizedBox(height: 21.h),
                      Container(
                          margin: EdgeInsets.only(right: 47.w),
                          child: Text(snapshot.data!.data.description,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.titleMedium)),
                      SizedBox(height: 28.h),
                      Text("Teaching experience",
                          style: theme.textTheme.titleMedium),
                      SizedBox(height: 16.h),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(4),
                              child:
                                  Icon(Icons.shopping_bag_outlined, size: 12),
                            ),
                            Padding(
                                padding: EdgeInsets.only(left: 11.w),
                                child: Text(
                                    snapshot.data!.data.teachingExperience[0],
                                    style: theme.textTheme.titleSmall))
                          ]),
                      SizedBox(height: 10.h),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(4),
                              child: Icon(Icons.people_outline, size: 12),
                            ),
                            Padding(
                                padding: EdgeInsets.only(left: 8.w),
                                child: Text(
                                    snapshot.data!.data.teachingExperience[1]??'',
                                    style: theme.textTheme.titleSmall))
                          ]),
                      SizedBox(height: 28.h),
                      buildApprove(
                        height: 50.0,
                        context,
                        id: snapshot.data!.data.id,
                        controller: controller,
                        feedBack: feedBackController,
                        name: "Approve Tutor",
                        decoration:
                            CustomButtonStyles.gradientPrimaryToBlueDecoration,
                      ),
                      SizedBox(height: 26.h),
                      Text("Professional Experience",
                          style: theme.textTheme.titleMedium),
                      SizedBox(height: 19.h),
                      if (snapshot.data!.data.professionalExperience.isNotEmpty)
                        ListView.builder(
                          itemCount:
                              snapshot.data!.data.professionalExperience.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(right: 15),
                                child: Icon(
                                  Icons.check_circle,
                                  color: Color(0xFF00C838),
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  snapshot
                                      .data!.data.professionalExperience[index],
                                  // maxLines: 8,
                                  // overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.justify,
                                  style: theme.textTheme.bodyLarge!
                                      .copyWith(color: appTheme.black900),
                                ),
                              ),
                            ],
                          ),
                        ),
                      SizedBox(height: 54.h),
                      Text("About ${snapshot.data!.data.name}",
                          style: theme.textTheme.titleMedium),
                      SizedBox(height: 24.h),
                      Text("${snapshot.data!.data.about} ",
                          // maxLines: 12,
                          style: theme.textTheme.bodyLarge!
                              .copyWith(height: 1.61)),
                      SizedBox(height: 30.h),
                      Text("Teaches", style: theme.textTheme.titleMedium),
                      SizedBox(height: 18.h),
                      if (snapshot.data!.data.teaches.isNotEmpty)
                        Wrap(
                          spacing: 8.0,
                          // Adjust the spacing between chips as needed
                          runSpacing: 8.0,
                          // Adjust the spacing between chip rows as needed
                          children: List.generate(
                            snapshot.data!.data.teaches.length,
                            // Number of chips you want to display
                            (index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5.w),
                                // Adjust horizontal padding as needed
                                child: RawChip(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 11.w,
                                    vertical: 6.h,
                                  ),
                                  showCheckmark: false,
                                  labelPadding: EdgeInsets.zero,
                                  label: Text(
                                    snapshot.data!.data.teaches[index],
                                    style: TextStyle(
                                      color: appTheme.black900,
                                      fontSize: 14.04444408416748,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  // selected: (accountsItemModelObj.isSelected?.value ?? false),
                                  backgroundColor: theme.colorScheme.primary
                                      .withOpacity(0.13),
                                  selectedColor: theme.colorScheme.primary
                                      .withOpacity(0.13),
                                  shape:

                                      // RoundedRectangleBorder(
                                      //   side: BorderSide.none,
                                      //   borderRadius: BorderRadius.circular(
                                      //     4.h,
                                      //   ),
                                      // ),
                                      RoundedRectangleBorder(
                                    side: BorderSide.none,
                                    borderRadius: BorderRadius.circular(
                                      4.h,
                                    ),
                                  ),
                                  onSelected: (value) {},
                                ),
                              );
                            },
                          ),
                        ),
                      SizedBox(height: 28.h),
                      Text("Boards", style: theme.textTheme.titleMedium),
                      SizedBox(height: 18.h),
                      if (snapshot.data!.data.boards.isNotEmpty)
                        Wrap(
                            spacing: 8.0,
                            // Adjust the spacing between chips as needed
                            runSpacing: 8.0,
                            // Adjust the spacing between chip rows as needed
                            children:
                                List.generate(snapshot.data!.data.boards.length,
                                    // Number of chips you want to display
                                    (index) {
                              return Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 5.w),
                                  // Adjust horizontal padding as needed
                                  child: RawChip(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 11.w,
                                      vertical: 6.h,
                                    ),
                                    showCheckmark: false,
                                    labelPadding: EdgeInsets.zero,
                                    label: Text(
                                      snapshot.data!.data.boards[index],
                                      style: TextStyle(
                                        color: appTheme.black900,
                                        fontSize: 14.04444408416748,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    // selected: (accountsItemModelObj.isSelected?.value ?? false),
                                    backgroundColor: theme.colorScheme.primary
                                        .withOpacity(0.13),
                                    selectedColor: theme.colorScheme.primary
                                        .withOpacity(0.13),
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide.none,
                                      borderRadius: BorderRadius.circular(
                                        4.h,
                                      ),
                                    ),
                                  ));
                            })),
                      SizedBox(height: 28.h),
                      Text("Grade", style: theme.textTheme.titleMedium),
                      SizedBox(height: 18.h),
                      if (snapshot.data!.data.grade.isNotEmpty)
                        Wrap(
                            spacing: 8.0,
                            // Adjust the spacing between chips as needed
                            runSpacing: 8.0,
                            // Adjust the spacing between chip rows as needed
                            children:
                                List.generate(snapshot.data!.data.grade.length,
                                    // Number of chips you want to display
                                    (index) {
                              return Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 5.w),
                                  // Adjust horizontal padding as needed
                                  child: RawChip(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 11.w,
                                      vertical: 6.h,
                                    ),
                                    showCheckmark: false,
                                    labelPadding: EdgeInsets.zero,
                                    label: Text(
                                      snapshot.data!.data.grade[index],
                                      style: TextStyle(
                                        color: appTheme.black900,
                                        fontSize: 14.04444408416748,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    // selected: (accountsItemModelObj.isSelected?.value ?? false),
                                    backgroundColor: theme.colorScheme.primary
                                        .withOpacity(0.13),
                                    selectedColor: theme.colorScheme.primary
                                        .withOpacity(0.13),
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide.none,
                                      borderRadius: BorderRadius.circular(
                                        4.h,
                                      ),
                                    ),
                                  ));
                            })),
                      SizedBox(height: 34.h),
                      Text("Education", style: theme.textTheme.titleMedium),
                      SizedBox(height: 21.h),
                      if (snapshot.data!.data.education.isNotEmpty)
                        ListView.builder(
                          itemCount: snapshot.data!.data.education.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: Icon(
                                  Icons.check_circle,
                                  color: Color(0xFF00C838),
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  snapshot.data!.data.education[index],
                                  // maxLines: 8,

                                  // overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.justify,
                                  style: theme.textTheme.bodyLarge!
                                      .copyWith(color: appTheme.black900),
                                ),
                              ),
                            ],
                          ),
                        ),
                      SizedBox(height: 23.h),
                      Text("Vehicle", style: theme.textTheme.titleMedium),
                      SizedBox(height: 10.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        // Adjust horizontal padding as needed
                        child: RawChip(
                          padding: EdgeInsets.symmetric(
                            horizontal: 35.w,
                            vertical: 6.h,
                          ),
                          showCheckmark: false,
                          labelPadding: EdgeInsets.zero,
                          label: Text(
                            snapshot.data!.data.vehicle == true ? "Yes" : "No",
                            style: TextStyle(
                              color: appTheme.black900,
                              fontSize: 14.04444408416748,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          // selected: (accountsItemModelObj.isSelected?.value ?? false),
                          backgroundColor:
                              theme.colorScheme.primary.withOpacity(0.13),
                          selectedColor:
                              theme.colorScheme.primary.withOpacity(0.13),
                          shape:

                              // RoundedRectangleBorder(
                              //   side: BorderSide.none,
                              //   borderRadius: BorderRadius.circular(
                              //     4.h,
                              //   ),
                              // ),
                              RoundedRectangleBorder(
                            side: BorderSide.none,
                            borderRadius: BorderRadius.circular(
                              4.h,
                            ),
                          ),
                          onSelected: (value) {},
                        ),
                      ),
                      SizedBox(height: 15.h),
                      Text("English Fluency",
                          style: theme.textTheme.titleMedium),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        // Adjust horizontal padding as needed
                        child: RawChip(
                          padding: EdgeInsets.symmetric(
                            horizontal: 35.w,
                            vertical: 6.h,
                          ),
                          showCheckmark: false,
                          labelPadding: EdgeInsets.zero,
                          label: Text(
                            snapshot.data!.data.englishFluency ?? "0/10",
                            style: TextStyle(
                              color: appTheme.black900,
                              fontSize: 14.04444408416748,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          // selected: (accountsItemModelObj.isSelected?.value ?? false),
                          backgroundColor:
                              theme.colorScheme.primary.withOpacity(0.13),
                          selectedColor:
                              theme.colorScheme.primary.withOpacity(0.13),
                          shape:

                              // RoundedRectangleBorder(
                              //   side: BorderSide.none,
                              //   borderRadius: BorderRadius.circular(
                              //     4.h,
                              //   ),
                              // ),
                              RoundedRectangleBorder(
                            side: BorderSide.none,
                            borderRadius: BorderRadius.circular(
                              4.h,
                            ),
                          ),
                          onSelected: (value) {},
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text("Stamp of Badge",
                          style: theme.textTheme.titleMedium),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        // Adjust horizontal padding as needed
                        child: RawChip(
                          padding: EdgeInsets.symmetric(
                            horizontal: 35.w,
                            vertical: 6.h,
                          ),
                          showCheckmark: false,
                          labelPadding: EdgeInsets.zero,
                          label: Text(
                            snapshot.data!.data.level ?? '',
                            style: TextStyle(
                              color: appTheme.black900,
                              fontSize: 14.04444408416748,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          // selected: (accountsItemModelObj.isSelected?.value ?? false),
                          backgroundColor:
                              theme.colorScheme.primary.withOpacity(0.13),
                          selectedColor:
                              theme.colorScheme.primary.withOpacity(0.13),
                          shape: RoundedRectangleBorder(
                            side: BorderSide.none,
                            borderRadius: BorderRadius.circular(
                              4.h,
                            ),
                          ),
                          onSelected: (value) {},
                        ),
                      ),
                      SizedBox(height: 30.h)
                    ]),
              );
            }
          },
        ),
      ),
    );
  }
}

PreferredSizeWidget _buildAppBar() {
  return CustomAppBar(
      leadingWidth: 28.h,
      leading: Padding(
        padding: EdgeInsets.only(left: 21.w, top: 22.h, bottom: 30.h),
        child: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      centerTitle: true,
      title: const Text(
        "Tutor’s Profile",
        style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.bold),
      ));
}

Widget _buildOutdoorsManPo({name, pic, verify, star}) {
  return Padding(
      padding: EdgeInsets.only(right: 20.w),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(10),
              image: pic != null
                  ? DecorationImage(image: NetworkImage(pic), fit: BoxFit.fill)
                  : null),
          height: 114,
          width: 114,
        ),
        Padding(
            padding: EdgeInsets.only(left: 17.w, top: 18.h, bottom: 24.h),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                name ?? '',
                // style: CustomTextStyles.titleMediumMedium_1
              ),
              SizedBox(height: 6.h),
              verify
                  ? Row(children: [
                      Text("Verified",
                          style: CustomTextStyles.labelLargeGreenA700_1),
                      CustomImageView(
                          imagePath: ImageConstant.imgFavorite,
                          height: 12,
                          width: 12,
                          margin: EdgeInsets.only(left: 4.w))
                    ])
                  : const SizedBox(),
              // Row(children: [
              //   Text("Non Verified",
              //       style: CustomTextStyles.labelLargeGreenA700_1),
              //   CustomImageView(
              //       imagePath: ImageConstant.imgFavorite,
              //       height: 12,
              //       width: 12,
              //       margin: EdgeInsets.only(left: 4.w))
              // ]),
              SizedBox(height: 12.h),
              CustomRatingBar(
                initialRating: double.parse(star.toString() ?? '0'),
                itemSize: 16,
                color: const Color(0xFFFCD635),
              )
            ]))
      ]));
}
