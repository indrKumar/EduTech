import 'package:carousel_slider/carousel_slider.dart';
import 'package:edushalaacademy/View/Student/contact_us_counsller.dart';
import 'package:edushalaacademy/View/Student/pakage_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../theme/app_decoration.dart';
import '../../theme/custom_button_style.dart';
import '../../utils/image_constant.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_image_view.dart';
import '../widgets/custom_rating_bar.dart';

class NearYouTutor extends StatefulWidget {
  bool? isMax = false;
   NearYouTutor({super.key,this.isMax});

  @override
  State<NearYouTutor> createState() => _NearYouTutorState();
}

class _NearYouTutorState extends State<NearYouTutor> {
  @override
  Widget build(BuildContext context) {
    print(widget.isMax);
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("30+ tutors \nare available near you!",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: "Montserrat"),),
              ),
              SizedBox(
                  // height: 200,
                  child: _buildUserProfile()),
            ],
                    ),
          )],
      ),
      bottomNavigationBar: CustomElevatedButton(
          onPressed: () {
            if(widget.isMax == false){
              Get.to(()=>const PackageDetailsPage());
            }else{
            Get.to(()=>const ContactUsCounsellor());
            }
          },
          margin: const EdgeInsets.symmetric(horizontal: 11, vertical: 30),
          text: "Continue",
          decoration: CustomButtonStyles.gradientPrimaryToBlueDecoration),
    );
  }

  Widget _buildUserProfile() {
    return
      CarouselSlider(
        options: CarouselOptions(
          autoPlay: false,
          enlargeCenterPage: true,
          viewportFraction: 0.4,
          aspectRatio: 2.0,
          initialPage: 2,
        ),
        items: List.generate(5, (index) {
        return Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 13,
            vertical: 12,
          ),
          decoration: AppDecoration.fillPrimary.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder13,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Mamta bhatt",
                style: TextStyle(fontSize: 16,color: Colors.white,fontFamily: "Montserrat",fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 2.h),
              Text(
                "Maths, Physics",
                style: TextStyle(fontSize: 12,color: Colors.white,fontFamily: "Montserrat"),
              ),
              SizedBox(height: 8.h),
              CustomRatingBar(
                color: Colors.amberAccent,
                ignoreGestures: true,
                initialRating: 5,
              ),
              CustomImageView(
                imagePath: ImageConstant.imgPlay,
                height: 41,
                width: 41,
                margin: const EdgeInsets.only(),
              ),
               SizedBox(height: 8.h),
              const Text(
                  "3 KM",
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white,fontFamily: "Montserrat",
                  )),
            ],
          ),
        );
      }),
      );
  }
}
