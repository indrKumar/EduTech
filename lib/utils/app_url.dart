abstract class AppUrl{
//baseUrl
  static String baseUrl = "https://edushala.ablive.in/tutorapi";

//SendOtp
  static String sendOTPUrl = "$baseUrl/getotp/";

//VerifyApi
  static String verifyOTPUrl = "$baseUrl/verifyotp/";

//Register User
  static String registerUser = "$baseUrl/signup/";

  static String userProfile = "$baseUrl/user/profile";

// Upload Document
  static String uploadDocument = "$baseUrl/user/drivers";


  static String contactUs = "$baseUrl/contact_us";

  static String farmerListUrl = "$baseUrl/app/assigned-farmer-list";

  static String farmerDetailsUrl = "$baseUrl/app/assigned-individual-list";

  static String farmInspectionQuestion = "$baseUrl/app/inspection-question";

  static String cropList = "$baseUrl/app/crop-list";

  static String riskManagement = "$baseUrl/app/inspection-question/risk";

  static String inspectionSurvey = "$baseUrl/app/inspection-survey";

}