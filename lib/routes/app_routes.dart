import 'package:edushalaacademy/View/Student/Student_main/main_actity_student.dart';
import 'package:edushalaacademy/View/Student/add_bassic_details.dart';
import 'package:edushalaacademy/View/Student/complte_onboarding_st.dart';
import 'package:edushalaacademy/View/Student/contact_us_counsller.dart';
import 'package:edushalaacademy/View/Student/linup_up_tutor.dart';
import 'package:edushalaacademy/View/Student/pakage_details_page.dart';
import 'package:edushalaacademy/View/Student/pending_inquries.dart';
import 'package:edushalaacademy/View/Student/procced_payment_page.dart';
import 'package:edushalaacademy/View/Student/tutor_profile.dart';
import 'package:edushalaacademy/View/onBoarding/kyc_2/add_edit_qualification.dart';
import 'package:edushalaacademy/View/onBoarding/kyc_2/edu_qualification_list.dart';
import 'package:edushalaacademy/View/onBoarding/kyc_3/add_teaching_locations.dart';
import 'package:edushalaacademy/View/onBoarding/kyc_4/add_new_teaching_ex.dart';
import 'package:edushalaacademy/View/onBoarding/kyc_4/kyc_spep_one.dart';
import 'package:edushalaacademy/View/onBoarding/kyc_4/personal_info.dart';
import 'package:edushalaacademy/View/onBoarding/kyc_4/virtual_interview_link_page.dart';
import 'package:edushalaacademy/View/onBoarding/kyc_step_1/category_list.dart';
import 'package:edushalaacademy/View/onBoarding/kyc_step_1/main_cat.dart';
import 'package:edushalaacademy/View/splash.dart';
import 'package:edushalaacademy/binding/splash_binding.dart';
import 'package:edushalaacademy/texttt.dart';
import 'package:get/get.dart';

import '../View/Student/Student_main/attendance/attandance.dart';
import '../View/Student/demo_schedule_link.dart';
import '../View/onBoarding/kyc_4/experience_list.dart';
// import '../presentation/app_navigation_screen/binding/app_navigation_binding.dart';

class AppRoutes {
  static const String overviewScreen = '/overview_screen';

  static const String kycStepOneScreen = '/kyc_step_one_screen';

  static const String categoriesListScreen = '/categories_list_screen';

  static const String selectCategoryThreeScreen =
      '/select_category_three_screen';

  static const String selectCategoryTwoScreen = '/select_category_two_screen';

  static const String selectCategoryOneScreen = '/select_category_one_screen';

  static const String selectCategoryScreen = '/select_category_screen';

  static const String kycStepFourSevenScreen = '/kyc_step_four_seven_screen';

  static const String videoVerication1stScreen = '/video_verication_1st_screen';

  static const String kycStepFourFiveScreen = '/kyc_step_four_five_screen';

  static const String kycStepFourThreeScreen = '/kyc_step_four_three_screen';

  static const String kycStepFourOneScreen = '/kyc_step_four_one_screen';

  static const String kycStepFourElevenScreen = '/kyc_step_four_eleven_screen';

  static const String kycStepFourNineScreen = '/kyc_step_four_nine_screen';

  static const String kycStepFourTenScreen = '/kyc_step_four_ten_screen';

  static const String kycStepFourTwoScreen = '/kyc_step_four_two_screen';

  static const String resultScreen = '/result_screen';

  static const String sampleScreen = '/sample_screen';

  static const String addBasicDetailsOneScreen =
      '/add_basic_details_one_screen';

  static const String kycStepFourFourScreen = '/kyc_step_four_four_screen';

  static const String addBasicDetailsTwoScreen =
      '/add_basic_details_two_screen';

  static const String experiencesListOneScreen = '/experiences_list_one_screen';

  static const String kycStepTwoScreen = '/kyc_step_two_screen';

  static const String educationalQualificationListPage =
      '/educational_qualification_list_page';

  static const String educationalQualificationListContainerScreen =
      '/educational_qualification_list_container_screen';

  static const String educationalQualificationAddScreen =
      '/educational_qualification_add_screen';

  static const String kycStepFourScreen = '/kyc_step_four_screen';

  static const String experiencesListScreen = '/experiences_list_screen';

  static const String kycStepFourSixScreen = '/kyc_step_four_six_screen';

  static const String kycStepFourEightScreen = '/kyc_step_four_eight_screen';

  static const String teachingLocationsScreen = '/teaching_locations_screen';

  static const String kycFinalStepOneScreen = '/kyc_final_step_one_screen';

  static const String homeScreen = '/home_screen';

  static const String teacherParentSelectScreen =
      '/teacher_parent_select_screen';

  static const String overviewOneTwoScreen = '/overview_one_two_screen';

  static const String overviewOneScreen = '/overview_one_screen';

  static const String overviewOneOneScreen = '/overview_one_one_screen';

  static const String loginMobileScreen = '/login_mobile_screen';

  static const String otpLoginScreen = '/otp_login_screen';

  static const String signupScreen = '/signup_screen';

  static const String otpLoginOneScreen = '/otp_login_one_screen';

  static const String classManagementTwoPage = '/class_management_two_page';

  static const String classManagementPage = '/class_management_page';

  static const String classManagementTabContainerScreen =
      '/class_management_tab_container_screen';

  static const String overviewOneThreeScreen = '/overview_one_three_screen';

  static const String classManagementThreePage = '/class_management_three_page';

  static const String classManagementThreeTabContainerScreen =
      '/class_management_three_tab_container_screen';

  static const String classEightPage = '/class_eight_page';

  static const String classEightTabContainerScreen =
      '/class_eight_tab_container_screen';

  static const String classManagementFiveScreen =
      '/class_management_five_screen';

  static const String leadsTwoPage = '/leads_two_page';

  static const String leadsTwoTabContainerScreen =
      '/leads_two_tab_container_screen';

  static const String leadsThreePage = '/leads_three_page';

  static const String paymentTwoScreen = '/payment_two_screen';

  static const String paymentOneScreen = '/payment_one_screen';

  static const String paymentThreeScreen = '/payment_three_screen';

  static const String noticesTwoScreen = '/notices_two_screen';

  static const String noticesDetailsScreen = '/notices_details_screen';

  static const String profileTwoScreen = '/profile_two_screen';

  static const String editProfileScreen = '/edit_profile_screen';

  static const String referAndEarnOneScreen = '/refer_and_earn_one_screen';

  static const String referAndEarnTwoScreen = '/refer_and_earn_two_screen';

  static const String referAndEarnThreeScreen = '/refer_and_earn_three_screen';

  static const String letterScreen = '/letter_screen';

  static const String letterOneScreen = '/letter_one_screen';

  static const String blogsTwoScreen = '/blogs_two_screen';

  static const String blogDetailsScreen = '/blog_details_screen';

  static const String faqOneScreen = '/faq_one_screen';

  static const String guideOneScreen = '/guide_one_screen';

  static const String notificationsOneScreen = '/notifications_one_screen';

  static const String feedbackComplaintsScreen = '/feedback_complaints_screen';

  static const String feedbackComplaintsOneScreen =
      '/feedback_complaints_one_screen';

  static const String leaderboardsOneScreen = '/leaderboards_one_screen';

  static const String contactScreen = '/contact_screen';

  static const String otherProductsOneScreen = '/other_products_one_screen';

  static const String otherProductsTwoScreen = '/other_products_two_screen';

  static const String reportHistoryPage = '/report_history_page';

  static const String homeSixScreen = '/home_six_screen';

  static const String addStudentStartScreen = '/add_student_start_screen';

  static const String selectCategoryFourScreen = '/select_category_four_screen';

  static const String selectBoardScreen = '/select_board_screen';

  static const String selectClassScreen = '/select_class_screen';

  static const String selectSubjectsScreen = '/select_subjects_screen';

  static const String addBasicDetailsFourScreen =
      '/add_basic_details_four_screen';

  static const String studentListScreen = '/student_list_screen';

  static const String addBasicDetailsThreeScreen =
      '/add_basic_details_three_screen';

  static const String addBasicDetailsFiveScreen =
      '/add_basic_details_five_screen';

  static const String studentListOneScreen = '/student_list_one_screen';

  static const String studentListTwoScreen = '/student_list_two_screen';

  static const String studentListThreeScreen = '/student_list_three_screen';

  static const String studentListFourScreen = '/student_list_four_screen';

  static const String studentsScreen = '/students_screen';

  static const String attendanceSevenPage = '/attendance_seven_page';

  static const String attendanceCalenderViewPage =
      '/attendance_calender_view_page';

  static const String reportThreePage = '/report_three_page';

  static const String reportThreeTabContainerScreen =
      '/report_three_tab_container_screen';

  static const String reportHistoryOnePage = '/report_history_one_page';

  static const String paymentsScreen = '/payments_screen';

  static const String k117Screen = '/k117_screen';

  static const String onehundredtwentytwoScreen = '/onehundredtwentytwo_screen';

  static const String profileThreeScreen = '/profile_three_screen';

  static const String editProfileOneScreen = '/edit_profile_one_screen';

  static const String faqTwoScreen = '/faq_two_screen';

  static const String guideTwoScreen = '/guide_two_screen';

  static const String feedbackComplaintsThreeScreen =
      '/feedback_complaints_three_screen';

  static const String feedbackComplaintsTwoScreen =
      '/feedback_complaints_two_screen';

  static const String notificationsTwoScreen = '/notifications_two_screen';

  static const String blogsThreeScreen = '/blogs_three_screen';

  static const String blogsFourScreen = '/blogs_four_screen';

  static const String supportScreen = '/support_screen';

  static const String leaderboardsTwoScreen = '/leaderboards_two_screen';

  static const String splashScreenOneScreen = '/splash_screen_one_screen';

  static const String testTwoScreen = '/test_two_screen';

  static const String testThreeScreen = '/test_three_screen';

  static const String testScreen = '/test_screen';

  static const String testOneScreen = '/test_one_screen';

  static const String overviewOneFiveScreen = '/overview_one_five_screen';

  static const String overviewTwoOneScreen = '/overview_two_one_screen';

  static const String overviewThreeOneScreen = '/overview_three_one_screen';

  static const String loginMobileTwoScreen = '/login_mobile_two_screen';

  static const String otpLoginThreeScreen = '/otp_login_three_screen';

  static const String signupTwoScreen = '/signup_two_screen';

  static const String otpSignupOneScreen = '/otp_signup_one_screen';

  static const String homeFourteenScreen = '/home_fourteen_screen';

  static const String classManagementFourPage = '/class_management_four_page';

  static const String classOnePage = '/class_one_page';

  static const String classOneTabContainerScreen =
      '/class_one_tab_container_screen';

  static const String attendancePage = '/attendance_page';

  static const String attendanceTabContainerScreen =
      '/attendance_tab_container_screen';

  static const String attendanceOnePage = '/attendance_one_page';

  static const String attendanceOneTabContainerScreen =
      '/attendance_one_tab_container_screen';

  static const String attendanceThreePage = '/attendance_three_page';

  static const String leadsOneScreen = '/leads_one_screen';

  static const String leadsScreen = '/leads_screen';

  static const String iphone13ProMax150Page = '/iphone_13_pro_max_150_page';

  static const String iphone13ProMax150TabContainerScreen =
      '/iphone_13_pro_max_150_tab_container_screen';

  static const String paymentScreen = '/payment_screen';

  static const String noticesScreen = '/notices_screen';

  static const String profileScreen = '/profile_screen';

  static const String faqScreen = '/faq_screen';

  static const String guideScreen = '/guide_screen';

  static const String feedbackScreen = '/feedback_screen';

  static const String reportBugScreen = '/report_bug_screen';

  static const String notificationsScreen = '/notifications_screen';

  static const String blogsScreen = '/blogs_screen';

  static const String blogsOneScreen = '/blogs_one_screen';

  static const String leaderboardsScreen = '/leaderboards_screen';

  static const String homeOneScreen = '/home_one_screen';

  static const String splashScreen = '/splash_screen';

  static const String overviewOneFourScreen = '/overview_one_four_screen';

  static const String overviewTwoScreen = '/overview_two_screen';

  static const String overviewThreeScreen = '/overview_three_screen';

  static const String loginMobileOneScreen = '/login_mobile_one_screen';

  static const String otpLoginTwoScreen = '/otp_login_two_screen';

  static const String signupOneScreen = '/signup_one_screen';

  static const String otpSignupScreen = '/otp_signup_screen';

  static const String attendanceFourPage = '/attendance_four_page';

  static const String attendanceSixPage = '/attendance_six_page';

  static const String reportPage = '/report_page';

  static const String reportTabContainerScreen = '/report_tab_container_screen';

  static const String attendanceFivePage = '/attendance_five_page';

  static const String attendanceTwoPage = '/attendance_two_page';

  static const String attendanceTwoTabContainerScreen =
      '/attendance_two_tab_container_screen';

  static const String reportOnePage = '/report_one_page';

  static const String reportTwoPage = '/report_two_page';

  static const String noticesOneScreen = '/notices_one_screen';

  static const String profileOneScreen = '/profile_one_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/splashScreen';

  static List<GetPage> pages = [
    // GetPage(
    //   name: overviewScreen,
    //   page: () => OverviewScreen(),
    //   bindings: [
    //     OverviewBinding(),
    //   ],
    // ),
    // GetPage(
    //   name: kycStepOneScreen,
    //   page: () => KycStepOneScreen(),
    //   bindings: [
    //     KycStepOneBinding(),
    //   ],
    // ),
    // GetPage(
    //   name: categoriesListScreen,
    //   page: () => CategoriesListScreen(),
    //   bindings: [
    //     CategoriesListBinding(),
    //   ],
    // ),
    // GetPage(
    //   name: selectCategoryThreeScreen,
    //   page: () => SelectCategoryThreeScreen(),
    //   bindings: [
    //     SelectCategoryThreeBinding(),
    //   ],
    // ),
    // GetPage(
    //   name: selectCategoryTwoScreen,
    //   page: () => SelectCategoryTwoScreen(),
    //   bindings: [
    //     SelectCategoryTwoBinding(),
    //   ],
    // ),
    // GetPage(
    //   name: selectCategoryOneScreen,
    //   page: () => SelectCategoryOneScreen(),
    //   bindings: [
    //     SelectCategoryOneBinding(),
    //   ],
    // ),
    // GetPage(
    //   name: selectCategoryScreen,
    //   page: () => SelectCategoryScreen(),
    //   bindings: [
    //     SelectCategoryBinding(),
    //   ],
    // ),
    // GetPage(
    //   name: kycStepFourSevenScreen,
    //   page: () => KycStepFourSevenScreen(),
    //   bindings: [
    //     KycStepFourSevenBinding(),
    //   ],
    // ),
    // GetPage(
    //   name: videoVerication1stScreen,
    //   page: () => VideoVerication1stScreen(),
    //   bindings: [
    //     VideoVerication1stBinding(),
    //   ],
    // ),
    // GetPage(
    //   name: kycStepFourFiveScreen,
    //   page: () => KycStepFourFiveScreen(),
    //   bindings: [
    //     KycStepFourFiveBinding(),
    //   ],
    // ),
    // GetPage(
    //   name: kycStepFourThreeScreen,
    //   page: () => KycStepFourThreeScreen(),
    //   bindings: [
    //     KycStepFourThreeBinding(),
    //   ],
    // ),
    // GetPage(
    //   name: kycStepFourOneScreen,
    //   page: () => KycStepFourOneScreen(),
    //   bindings: [
    //     KycStepFourOneBinding(),
    //   ],
    // ),
    // GetPage(
    //   name: kycStepFourElevenScreen,
    //   page: () => KycStepFourElevenScreen(),
    //   bindings: [
    //     KycStepFourElevenBinding(),
    //   ],
    // ),
    // GetPage(
    //   name: kycStepFourNineScreen,
    //   page: () => KycStepFourNineScreen(),
    //   bindings: [
    //     KycStepFourNineBinding(),
    //   ],
    // ),
    // GetPage(
    //   name: kycStepFourTenScreen,
    //   page: () => KycStepFourTenScreen(),
    //   bindings: [
    //     KycStepFourTenBinding(),
    //   ],
    // ),
    // GetPage(
    //   name: kycStepFourTwoScreen,
    //   page: () => KycStepFourTwoScreen(),
    //   bindings: [
    //     KycStepFourTwoBinding(),
    //   ],
    // ),
    // GetPage(
    //   name: resultScreen,
    //   page: () => ResultScreen(),
    //   bindings: [
    //     ResultBinding(),
    //   ],
    // ),
    // GetPage(
    //   name: sampleScreen,
    //   page: () => SampleScreen(),
    //   bindings: [
    //     SampleBinding(),
    //   ],
    // ),
    // GetPage(
    //   name: addBasicDetailsOneScreen,
    //   page: () => AddBasicDetailsOneScreen(),
    //   bindings: [
    //     AddBasicDetailsOneBinding(),
    //   ],
    // ),
    // GetPage(
    //   name: kycStepFourFourScreen,
    //   page: () => KycStepFourFourScreen(),
    //   bindings: [
    //     KycStepFourFourBinding(),
    //   ],
    // ),
    // GetPage(
    //   name: addBasicDetailsTwoScreen,
    //   page: () => AddBasicDetailsTwoScreen(),
    //   bindings: [
    //     AddBasicDetailsTwoBinding(),
    //   ],
    // ),
    // GetPage(
    //   name: experiencesListOneScreen,
    //   page: () => ExperiencesListOneScreen(),
    //   bindings: [
    //     ExperiencesListOneBinding(),
    //   ],
    // ),
    // GetPage(
    //   name: kycStepTwoScreen,
    //   page: () => KycStepTwoScreen(),
    //   bindings: [
    //     KycStepTwoBinding(),
    //   ],
    // ),
    // GetPage(
    //   name: educationalQualificationListContainerScreen,
    //   page: () => EducationalQualificationListContainerScreen(),
    //   bindings: [
    //     EducationalQualificationListContainerBinding(),
    //   ],
    // ),
    // GetPage(
    //   name: educationalQualificationAddScreen,
    //   page: () => EducationalQualificationAddScreen(),
    //   bindings: [
    //     EducationalQualificationAddBinding(),
    //   ],
    // ),
    // GetPage(
    //   name: kycStepFourScreen,
    //   page: () => KycStepFourScreen(),
    //   bindings: [
    //     KycStepFourBinding(),
    //   ],
    // ),
    // GetPage(
    //   name: experiencesListScreen,
    //   page: () => ExperiencesListScreen(),
    //   bindings: [
    //     ExperiencesListBinding(),
    //   ],
    // ),
    // GetPage(
    //   name: kycStepFourSixScreen,
    //   page: () => KycStepFourSixScreen(),
    //   bindings: [
    //     KycStepFourSixBinding(),
    //   ],
    // ),
    // GetPage(
    //   name: kycStepFourEightScreen,
    //   page: () => KycStepFourEightScreen(),
    //   bindings: [
    //     KycStepFourEightBinding(),
    //   ],
    // ),
    // GetPage(
    //   name: teachingLocationsScreen,
    //   page: () => TeachingLocationsScreen(),
    //   bindings: [
    //     TeachingLocationsBinding(),
    //   ],
    // ),
    // GetPage(
    //   name: kycFinalStepOneScreen,
    //   page: () => KycFinalStepOneScreen(),
    //   bindings: [
    //     KycFinalStepOneBinding(),
    //   ],
    // ),
    // GetPage(
    //   name: homeScreen,
    //   page: () => HomeScreen(),
    //   bindings: [
    //     HomeBinding(),
    //   ],
    // ),
    // GetPage(
    //   name: teacherParentSelectScreen,
    //   page: () => TeacherParentSelectScreen(),
    //   bindings: [
    //     TeacherParentSelectBinding(),
    //   ],
    // ),
    // GetPage(
    //   name: overviewOneTwoScreen,
    //   page: () => OverviewOneTwoScreen(),
    //   bindings: [
    //     OverviewOneTwoBinding(),
    //   ],
    // ),
    // GetPage(
    //   name: overviewOneScreen,
    //   page: () => OverviewOneScreen(),
    //   bindings: [
    //     OverviewOneBinding(),
    //   ],
    // ),
    // GetPage(
    //   name: overviewOneOneScreen,
    //   page: () => OverviewOneOneScreen(),
    //   bindings: [
    //     OverviewOneOneBinding(),
    //   ],
    // ),
    // GetPage(
    //   name: appNavigationScreen,
    //   page: () => AppNavigationScreen(),
    //   bindings: [
    //     AppNavigationBinding(),
    //   ],
    // ),
    GetPage(
        name: initialRoute,
        page: () =>
            // PackageDetailsPage()
            // PendingInquiries(),
            //     const StudentOnboardingSuccess()
            // ContactUsCounsellor()
            // const LinedUpTutorsScreen()
            //     const MainActivityStudent()
            // MainActivityStudent()
            const AttendanceTab()
        // bindings: [
        //   SplashBinding(),
        // ],
        )
  ];
}
