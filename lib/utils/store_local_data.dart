import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static final DateFormat _dateFormat = DateFormat('dd/MM/yyyy');

  static String format(DateTime date) {
    return _dateFormat.format(date);
  }

  static String accessToken = "";
  static const String SP_ISLOGIN = "isLogin";

  // late Size _screenSize;
  // late TextTheme _textTheme;
  // late Map<String, dynamic> _passedData;
  static String businessName = "Business_Name";
  static String FCMToken = "";
  static String userName = "";
  static String profileImageUrl = "";
  static String mobileNumber = "";
  static String userType = "";
  static String userEmail = "";
  static String userAddress = "";
  static String SP_KEY_USER_TYPE = "key_user_type",
      SP_KEY_ACCESS_TOKEN = "key_user_token",
      SP_KEY_REFRESH_TOKEN = "key_refresh_token",
      SP_KEY_IS_LOGGED_IN = "key_is_logged_in",
      SP_KEY_IS_COMPLETE_IN = "key_is_complete_in",
      SP_KEY_USER_NAME = "key_user_name",
      SP_KEY_USER_MOBILE_NUMBER = "key_mobile_number",
      SP_KEY_USER_EMAIL = "key_user_email",
      SP_KEY_USER_ADDRESS = "key_user_address",
      SP_KEY_USER_IMAGE = "key_user_image",
      SP_KEY_TEACHER_ID = "key_teacher_id",
      TEACHER_NAME = "key_teacher_name",
      SCHOOL_ID = "key_school_id",
      BOARD_ID = "key_board_id",
      TEACHER_CONTACT = "key_teacher_contact",
      SPECIALIZATION = "key_spe",
      DOB = "key_dob",
      HOBBY = "key_hobbey",
      TYPOFUSER = "type_user",
      STUDENTID = "student_idr";


      static

  Future<void> setStringSp(String key, String value) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString(key, value);
  }

  static Future<String?> getStringSp(String key) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString(key);
  }

  static Future<void> setIntSp(String key, int value) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.setInt(key, value);
  }


  static Future<int?> getInt(String key) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getInt(key);
  }


  static setBoolSp(String key, bool value) async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    sp.setBool(key, value);
  }

  static Future<bool?> getBoolSp(String key) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getBool(key);
  }
}