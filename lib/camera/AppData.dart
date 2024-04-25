// import 'dart:io';
// import 'dart:convert';
// import 'package:whizcribs/models/User.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
//
// class AppData {
//   static final userP = "";
//   static final user = "";
//
//   static final userData = "user=" + user + "&userp=" + userP;
//   static final siteURL = "";
//   static final tokenURL = "/token";
//   static final userAddURL = "/user/add";
//   static final userLoginURL = "/api/login";
//   static final userInfoURL = "/api/user";
//   static final userLogoutURL = "/api/sign-out";
//
//   static final physicalGiftAmount = 20;
//
//   static Future<String> getUserPhoto() async {
//     const storage = FlutterSecureStorage();
//     var photo = await storage.read(key: 'userPhoto');
//
//     if (photo.toString().length > 3) {
//       return 'https://' + siteURL + userPhotoURL + photo.toString();
//     }
//     return "";
//   }
//
//   static Future<List<String>> getUserData() async {
//     List<String> data = [];
//     const storage = FlutterSecureStorage();
//
//     var userName = await storage.read(key: 'userName'); //0
//     var userEmail = await storage.read(key: 'userEmail'); //1
//     var userCompany = await storage.read(key: 'userCompany'); //2
//     var userAddress = await storage.read(key: 'userAddress'); //3
//     var userAddress2 = await storage.read(key: 'userAddress2'); //4
//     var userCity = await storage.read(key: 'userCity'); //5
//     var userState = await storage.read(key: 'userState'); //6
//     var userZip = await storage.read(key: 'userZip'); //7
//     var userPhone = await storage.read(key: 'userPhone'); //8
//     var userProfession = await storage.read(key: 'userProfession'); //9
//     var userPhoto = await storage.read(key: 'userPhoto'); //10
//     var userLogo = await storage.read(key: 'userLogo'); //11
//
//     data.add(userName.toString());
//     data.add(userEmail.toString());
//     data.add(userCompany.toString());
//     data.add(userAddress.toString());
//     data.add(userAddress2.toString());
//     data.add(userCity.toString());
//     data.add(userState.toString());
//     data.add(userZip.toString());
//     data.add(userPhone.toString());
//     data.add(userProfession.toString());
//     data.add('https://' + siteURL + userPhotoURL + userPhoto.toString());
//     data.add('https://' + siteURL + userLogoURL + userLogo.toString());
//
//     return data;
//   }
//
//   static Future<String> getToken() async {
//     var token = "";
//     var url = Uri.https(siteURL, tokenURL);
//     var response = await http.get(url);
//
//     if (response.statusCode == 200) {
//       token = response.body as String;
//       //print(token);
//     } else {
//       print('Request failed with status: ${response.statusCode}.');
//     }
//
//     return token;
//   }
//
//   static Future<int> resetPassword(email) async {
//     var requestDone = 0;
//     final url = Uri.https(siteURL, resetPasswordURL).replace(
//         queryParameters: {'email': email, 'user': user, 'userp': userP});
//
//     //print(url);
//     var response = await http.get(url);
//
//     if (response.statusCode == 200) {
//       requestDone = 1;
//     } else {
//       print('Request failed with status: ${response.statusCode}.');
//
//       if (response.statusCode == 432) {
//         requestDone = 2;
//       }
//     }
//
//     return requestDone;
//   }
//
//   static Future<int> addUser(name, email, password) async {
//     var requestDone = 0;
//     final url = Uri.https(siteURL, userAddURL).replace(queryParameters: {
//       'name': name,
//       'email': email,
//       'password': password,
//       'user': user,
//       'userp': userP
//     });
//
//     //print(url);
//     var response = await http.get(url);
//
//     if (response.statusCode == 200) {
//       requestDone = 1;
//     } else {
//       print('Request failed with status: ${response.statusCode}.');
//
//       if (response.statusCode == 432) {
//         requestDone = 2;
//       }
//     }
//
//     return requestDone;
//   }
//
//   static Future<int> addUserData() async {
//     var requestDone = 0;
//
//     const storage = FlutterSecureStorage();
//     var name = await storage.read(key: 'regName');
//     var email = await storage.read(key: 'regEmail');
//     var password = await storage.read(key: 'regPassword');
//     var company = await storage.read(key: 'regCompany');
//     var address = await storage.read(key: 'regAddress');
//     var city = await storage.read(key: 'regCity');
//     var state = await storage.read(key: 'regState');
//     var zip = await storage.read(key: 'regZip');
//     var phone = await storage.read(key: 'regPhone');
//     var profession = await storage.read(key: 'regProfession');
//
//     final url = Uri.https(siteURL, userAddURL).replace(queryParameters: {
//       'name': name,
//       'email': email,
//       'password': password,
//       'company': company,
//       'address': address,
//       'city': city,
//       'state': state,
//       'zip': zip,
//       'phone': phone,
//       'profession': profession,
//       'user': user,
//       'userp': userP
//     });
//
//     //print(url);
//     var response = await http.get(url);
//
//     if (response.statusCode == 200) {
//       requestDone = 1;
//       var res = userLogin(email, password);
//     } else {
//       print('Request failed with status: ${response.statusCode}.');
//
//       if (response.statusCode == 432) {
//         requestDone = 2;
//       }
//     }
//
//     return requestDone;
//   }
//
//   static Future<int> userLogin(email, password) async {
//     var requestDone = 0;
//     print(email);
//     print(password);
//     final url = Uri.https(siteURL, userLoginURL)
//         .replace(queryParameters: {'email': email, 'password': password});
//
//     var response = await http.post(url);
//
//     //print(response.statusCode);
//     //print(response.body);
//
//     if (response.statusCode == 201) {
//       Map<String, dynamic> data = jsonDecode(response.body);
//       print(data);
//       var user = new User(
//           data['user']['id'].toString() == null
//               ? ''
//               : data['user']['id'].toString(),
//           data['user']['name'] == null ? '' : data['user']['name'],
//           data['user']['email'] == null ? '' : data['user']['email'],
//           data['user']['email_verified_at'] == null
//               ? ''
//               : data['user']['email_verified_at'],
//           data['user']['company_name'] == null
//               ? ''
//               : data['user']['company_name'],
//           data['user']['address'] == null ? '' : data['user']['address'],
//           data['user']['address_2'] == null ? '' : data['user']['address_2'],
//           data['user']['city'] == null ? '' : data['user']['city'],
//           data['user']['state'] == null ? '' : data['user']['state'],
//           data['user']['zip'] == null ? '' : data['user']['zip'],
//           data['user']['phone'] == null ? '' : data['user']['phone'],
//           data['user']['profession'] == null ? '' : data['user']['profession'],
//           data['user']['photo'] == null ? '' : data['user']['photo'],
//           data['user']['company_logo'] == null
//               ? ''
//               : data['user']['company_logo'],
//           data['user']['created_at'] == null ? '' : data['user']['created_at'],
//           data['user']['updated_at'] == null ? '' : data['user']['updated_at'],
//           data['user']['customer_id'] == null
//               ? ''
//               : data['user']['customer_id']);
//
//       const storage = FlutterSecureStorage();
//       await storage.write(key: 'userID', value: user.id);
//       await storage.write(key: 'userName', value: user.name);
//       await storage.write(key: 'userEmail', value: user.email);
//
//       await storage.write(key: 'userCompany', value: user.company_name);
//       await storage.write(key: 'userAddress', value: user.address);
//       await storage.write(key: 'userAddress2', value: user.address_2);
//       await storage.write(key: 'userCity', value: user.city);
//       await storage.write(key: 'userState', value: user.state);
//       await storage.write(key: 'userZip', value: user.zip);
//       await storage.write(key: 'userPhone', value: user.phone);
//       await storage.write(key: 'userProfession', value: user.profession);
//
//       await storage.write(key: 'stripeCustomerID', value: user.customer_id);
//
//       await storage.write(key: 'userPhoto', value: user.photo);
//       await storage.write(key: 'userLogo', value: user.company_logo);
//
//       await storage.write(key: 'token', value: data['token']);
//       requestDone = 1;
//     } else {
//       print('Request failed with status: ${response.statusCode}.');
//
//       if (response.statusCode == 404) {
//         requestDone = 2;
//       }
//     }
//
//     return requestDone;
//   }
//
//   static Future<bool> getUserInfo() async {
//     var userFound = false;
//     var userName = "";
//     var userEmail = "";
//     var userCompany = "";
//     var userAddress = "";
//     var userAddress2 = "";
//     var userCity = "";
//     var userState = "";
//     var userZip = "";
//     var userPhone = "";
//     var userProfession = "";
//     var userPhoto = "";
//     var userLogo = "";
//
//     const storage = FlutterSecureStorage();
//     var token = await storage.read(key: 'token');
//
//     final url = Uri.https(siteURL, userInfoURL);
//     var response = await http.get(url, headers: {
//       "Content-Type": "application/json",
//       'Authorization': 'Bearer $token',
//     });
//
//     if (response.statusCode == 200) {
//       userFound = true;
//       if(response.body == ': )') {
//         signOut();
//         return userFound;
//       }
//
//       Map<String, dynamic> data = jsonDecode(response.body);
//       //print(data);
//
//       userName = data['name'] == null ? "" : data['name'];
//       userEmail = data['email'] == null ? "" : data['email'];
//       userCompany = data['company_name'] == null ? "" : data['company_name'];
//       userAddress = data['address'] == null ? "" : data['address'];
//       userAddress2 = data['address_2'] == null ? "" : data['address_2'];
//       userCity = data['city'] == null ? "" : data['city'];
//       userState = data['state'] == null ? "" : data['state'];
//       userZip = data['zip'] == null ? "" : data['zip'];
//       userPhone = data['phone'] == null ? "" : data['phone'];
//       userProfession = data['profession'] == null ? "" : data['profession'];
//       userPhoto = data['photo'] == null ? "" : data['photo'];
//       userLogo = data['company_logo'] == null ? "" : data['company_logo'];
//
//       await storage.write(key: 'userName', value: userName);
//       await storage.write(key: 'userEmail', value: userEmail);
//
//       await storage.write(key: 'userCompany', value: userCompany);
//       await storage.write(key: 'userAddress', value: userAddress);
//       await storage.write(key: 'userAddress2', value: userAddress2);
//       await storage.write(key: 'userCity', value: userCity);
//       await storage.write(key: 'userState', value: userState);
//       await storage.write(key: 'userZip', value: userZip.toString());
//       await storage.write(key: 'userPhone', value: userPhone);
//       await storage.write(key: 'userProfession', value: userProfession);
//
//       await storage.write(key: 'userPhoto', value: userPhoto);
//       await storage.write(key: 'userLogo', value: userLogo);
//     }
//     //print(response.statusCode);
//     //print(response.body);
//     return userFound;
//   }
//
//   static void storeData(key, value) async {
//     const storage = FlutterSecureStorage();
//     await storage.write(key: key, value: value);
//     //print(key + ' : ' + value);
//   }
//
//   static Future<String> getStoredData(key) async {
//     const storage = FlutterSecureStorage();
//     var data = await storage.read(key: key);
//     return data.toString();
//   }
//
//   static Future<int> storeNameEmailPassword(name, email, password) async {
//     var requestDone = 0;
//     final url = Uri.https(siteURL, checkEmail).replace(
//         queryParameters: {'email': email, 'user': user, 'userp': userP});
//
//     //print(url);
//     var response = await http.get(url);
//
//     if (response.statusCode == 200) {
//       storeData('regName', name);
//       storeData('regEmail', email);
//       storeData('userEmail', email);
//       storeData('regPassword', password);
//       requestDone = 1;
//     } else {
//       print('Request failed with status: ${response.statusCode}.');
//       if (response.statusCode == 432) {
//         requestDone = 2;
//       }
//     }
//     return requestDone;
//   }
//
//   static Future<int> storeCompanyInfo(name, address, city, state, zip) async {
//     var requestDone = 1;
//
//     storeData('regCompany', name);
//     storeData('regAddress', address);
//     storeData('regCity', city);
//     storeData('regState', state);
//     storeData('regZip', zip);
//
//     return requestDone;
//   }
//
//   static Future<int> storeOtherInfo(phone, profession) async {
//     var requestDone = 1;
//
//     storeData('regPhone', phone);
//     storeData('regProfession', profession);
//
//     return requestDone;
//   }
//
//   static Future<int> uploadUserPhoto(File imageFile) async {
//     var requestDone = 1;
//     var email = await getStoredData("userEmail");
//     print(email);
//
//     /*
//     var stream = http.ByteStream(imageFile.openRead());
//     stream.cast();
//     print(stream);
//     var length = await imageFile.length();
//     print(length);
//     var uri = Uri.parse("https://" + siteURL + uploadPhotoURL);
//     var request = http.MultipartRequest("POST", uri);
//     request.fields['email'] = email;
//     request.fields['user'] = user;
//     request.fields['userp'] = userP;
//     var multiport = http.MultipartFile("photo", stream, length);
//     request.files.add(multiport);
//     print(request);
//     var response = await request.send();
//     print('photo xxx');
//     print(response.statusCode);
//     print(response);
//     print(response.stream.bytesToString());
//     return requestDone;
//     */
//
//     var request = http.MultipartRequest(
//         "POST", Uri.parse("https://" + siteURL + uploadPhotoURL));
//
//     request.fields['email'] = email;
//     request.fields['user'] = user;
//     request.fields['userp'] = userP;
//
//     var picture = http.MultipartFile.fromBytes(
//         'photo', File(imageFile.path).readAsBytesSync(),
//         filename: imageFile.path);
//
//     print(imageFile.path);
//
//     request.files.add(picture);
//
//     var response = await request.send();
//
//     String photo = await response.stream.bytesToString();
//     storeData("userPhoto", photo);
//     print(photo);
//
//     /*
//     var responseData = await response.stream.toBytes();
//     var result = String.fromCharCodes(responseData);
//     print(result);
//     print('photo xxx');
//     print(response.statusCode);
//     print(responseData);
//     print(response.stream.bytesToString());
//      */
//
//     /*
//     var email = await getStoredData("regEmail");
//     print(email);
//
//     var stream = new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
//     var length = await imageFile.length();
//
//     var uri = Uri.parse('https://' + siteURL + uploadPhotoURL);
//
//     var request = http.MultipartRequest("POST", uri);
//     var multipartFile = http.MultipartFile('photo', stream, length,
//         filename: basename(imageFile.path));
//     //contentType: new MediaType('image', 'png'));
//
//     print(imageFile.path);
//
//     request.fields['email'] = email;
//     request.files.add(multipartFile);
//     var response = await request.send();
//     print(response.statusCode);
//     response.stream.transform(utf8.decoder).listen((value) {
//       print(value);
//     });
//
//      */
//
//     /*
//     var email = await getStoredData("regEmail");
//     print(email);
//     print(file.path);
//
//     var request = http.MultipartRequest('POST', Uri.parse('https://' + siteURL + uploadPhotoURL));
//     request.fields['email'] = email;
//     request.files.add(http.MultipartFile.fromBytes('photo', File(file.path).readAsBytesSync(),filename: file.path));
//     print(request);
//     var response = await request.send();
//     print(response);
//      */
//     return requestDone;
//   }
//
//   static Future<int> uploadLogo(File imageFile) async {
//     var requestDone = 1;
//     var email = await getStoredData("userEmail");
//     print(email);
//
//     var request = http.MultipartRequest(
//         "POST", Uri.parse("https://" + siteURL + uploadLogoURL));
//
//     request.fields['email'] = email;
//     request.fields['user'] = user;
//     request.fields['userp'] = userP;
//
//     var picture = http.MultipartFile.fromBytes(
//         'logo', File(imageFile.path).readAsBytesSync(),
//         filename: imageFile.path);
//
//     print(imageFile.path);
//
//     request.files.add(picture);
//
//     var response = await request.send();
//
//     return requestDone;
//   }
//
//   static Future<int> signOut() async {
//     var requestDone = 0;
//     var token = await getStoredData("token");
//     storeData('token', '');
//
//     final url = Uri.https(siteURL, userLogoutURL);
//
//     var response = await http.post(url, headers: {
//       "Content-Type": "application/json",
//       'Authorization': 'Bearer $token',
//     });
//
//     if (response.statusCode == 201) {
//       requestDone = 1;
//     } else {
//       print('Request failed with status: ${response.statusCode}.');
//
//       if (response.statusCode == 404) {
//         requestDone = 2;
//       }
//     }
//
//     return requestDone;
//   }
//
//   static Future<int> changePassword(
//       String password, String confirmPassword) async {
//     var requestDone = 0;
//     var token = await getStoredData("token");
//
//     final url = Uri.https(siteURL, userChangePasswordURL).replace(
//         queryParameters: {
//           'password': password,
//           'confirm_password': confirmPassword
//         });
//
//     var response = await http.post(url, headers: {
//       "Content-Type": "application/json",
//       'Authorization': 'Bearer $token',
//     });
//
//     if (response.statusCode == 200) {
//       requestDone = 1;
//     } else {
//       print('Request failed with status: ${response.statusCode}.');
//
//       if (response.statusCode == 404 || response.statusCode == 432) {
//         requestDone = 2;
//       }
//     }
//
//     return requestDone;
//   }
//
//   static Future<int> updateUser(
//       String name,
//       String email,
//       String company_name,
//       String address,
//       String city,
//       String state,
//       String zip,
//       String phone,
//       String profession) async {
//     var requestDone = 0;
//     var token = await getStoredData("token");
//
//     final url = Uri.https(siteURL, updateUserDataURL).replace(queryParameters: {
//       'name': name,
//       'email': email,
//       'company_name': company_name,
//       'address': address,
//       'city': city,
//       'state': state,
//       'zip': zip,
//       'phone': phone,
//       'profession': profession,
//     });
//
//     var response = await http.post(url, headers: {
//       "Content-Type": "application/json",
//       'Authorization': 'Bearer $token',
//     });
//
//     if (response.statusCode == 200) {
//       const storage = FlutterSecureStorage();
//       await storage.write(key: 'userName', value: name);
//       await storage.write(key: 'userEmail', value: email);
//       await storage.write(key: 'userCompany', value: company_name);
//       await storage.write(key: 'userAddress', value: address);
//       await storage.write(key: 'userCity', value: city);
//       await storage.write(key: 'userState', value: state);
//       await storage.write(key: 'userZip', value: zip.toString());
//       await storage.write(key: 'userPhone', value: phone);
//       await storage.write(key: 'userProfession', value: profession);
//       requestDone = 1;
//     } else {
//       print('Request failed with status: ${response.statusCode}.');
//
//       if (response.statusCode == 404 || response.statusCode == 432) {
//         requestDone = 2;
//       }
//     }
//
//     return requestDone;
//   }
//
//   static Future<List<dynamic>> getUserWalletCards() async {
//     String responseText = '[{}]';
//     List<dynamic> requestDone = json.decode(responseText);
//
//     var token = await getStoredData("token");
//     final url = Uri.https(siteURL, userWalletCardsURL);
//     var response = await http.post(url, headers: {
//       "Content-Type": "application/json",
//       'Authorization': 'Bearer $token',
//     });
//
//     if (response.statusCode == 200) {
//       requestDone = json.decode(response.body);
//     } else {
//       print('Request failed with status: ${response.statusCode}.');
//
//       if (response.statusCode == 404 || response.statusCode == 432) {
//         responseText = '[{}]';
//         requestDone = json.decode(responseText);
//       }
//     }
//
//     return requestDone;
//   }
//
//   static Future<Map<String, dynamic>> getStripeUser() async {
//     String responseText = '{"StripeUser":[]}';
//     Map<String, dynamic> requestDone = jsonDecode(responseText);
//
//     var token = await getStoredData("token");
//     final url = Uri.https(siteURL, stripeUser);
//     var response = await http.get(url, headers: {
//       "Content-Type": "application/json",
//       'Authorization': 'Bearer $token',
//     });
//     //print(response);
//     if (response.statusCode == 201) {
//       Map<String, dynamic> data = jsonDecode(response.body);
//       return data;
//     } else {
//       print('Request failed with status: ${response.statusCode}.');
//
//       if (response.statusCode == 404 || response.statusCode == 432) {
//         return requestDone;
//       }
//     }
//
//     return requestDone;
//   }
//
//
//
//   static Future<List<dynamic>> getDeleteAccountReasons() async {
//     String responseText = '[{}]';
//     List<dynamic> requestDone = json.decode(responseText);
//
//     var token = await getStoredData("token");
//     final url = Uri.https(siteURL, deleteAccountReasonsURL);
//     var response = await http.get(url, headers: {
//       "Content-Type": "application/json",
//       'Authorization': 'Bearer $token',
//     });
//
//     if (response.statusCode == 201) {
//       requestDone = json.decode(response.body);
//     } else {
//       print('Request failed with status: ${response.statusCode}.');
//
//       if (response.statusCode == 404 || response.statusCode == 432) {
//         responseText = '[{}]';
//         requestDone = json.decode(responseText);
//       }
//     }
//
//     return requestDone;
//   }
//
//
//
//
//
//   static Future<int> deleteUserAccount(reason) async {
//     var requestDone = 0;
//
//     var token = await getStoredData("token");
//     final url = Uri.https(siteURL, deleteUserAccountURL)
//         .replace(queryParameters: {'reason': reason});
//     var response = await http.post(url, headers: {
//       "Content-Type": "application/json",
//       'Authorization': 'Bearer $token',
//     });
//
//
//     if (response.statusCode == 201) {
//       requestDone = 1;
//     } else {
//       print('Request failed with status: ${response.statusCode}.');
//
//       if (response.statusCode == 404) {
//         requestDone = 2;
//       }
//     }
//
//     return requestDone;
//   }
//
//
//
//   static Future<int> sendSupportMessage(subject, message) async {
//     var requestDone = 0;
//
//     var token = await getStoredData("token");
//     final url = Uri.https(siteURL, supportMessageURL)
//         .replace(queryParameters: {'subject': subject, 'message': message});
//     var response = await http.post(url, headers: {
//       "Content-Type": "application/json",
//       'Authorization': 'Bearer $token',
//     });
//
//
//     if (response.statusCode == 201) {
//       requestDone = 1;
//     } else {
//       print('Request failed with status: ${response.statusCode}.');
//
//       if (response.statusCode == 404) {
//         requestDone = 2;
//       }
//     }
//
//     return requestDone;
//   }
//
//
//   static Future<Map<String, dynamic>> getGiftCardAddons() async {
//     String responseText = '{"StripeUser":[]}';
//     Map<String, dynamic> requestDone = jsonDecode(responseText);
//
//     var token = await getStoredData("token");
//     final url = Uri.https(siteURL, giftCardAddonsURL);
//     var response = await http.get(url, headers: {
//       "Content-Type": "application/json",
//       'Authorization': 'Bearer $token',
//     });
//     //print(response);
//     if (response.statusCode == 201) {
//       Map<String, dynamic> data = jsonDecode(response.body);
//       return data;
//     } else {
//       print('Request failed with status: ${response.statusCode}.');
//
//       if (response.statusCode == 404 || response.statusCode == 432) {
//         return requestDone;
//       }
//     }
//
//     return requestDone;
//   }
//
//
//
//
//   static Future<int> sendGiftCard(var recipient, int amount, List<dynamic> addOn, String deliveryDate, var physicalAddress, String message, String uniqueID, int total) async {
//     var requestDone = 0;
//     String addOns = "";
//     bool addOnFound = false;
//
//     for(var a in addOn) {
//       addOnFound = true;
//       addOns = addOns + a['id'].toString() + ',';
//     }
//     if(addOnFound){
//       addOns = addOns.substring(0, addOns.length - 1);
//     }
//
//     var token = await getStoredData("token");
//     final url = Uri.https(siteURL, saveGiftCardURL).replace(queryParameters: {
//       'name': recipient['name'],
//       'email': recipient['email'],
//       'phone': recipient['phone'],
//       'amount': amount.toString(),
//       'delivery_date': deliveryDate,
//       'video_message': '',
//       'message': message,
//       'gift_card_addon_id': addOns,
//       'physical_name': physicalAddress['name'],
//       'physical_address': physicalAddress['address'],
//       'physical_city': physicalAddress['city'],
//       'physical_state': physicalAddress['state'],
//       'physical_zip': physicalAddress['zip'],
//       'uniqueID': uniqueID,
//       'total': total.toString()
//     });
//     var response = await http.post(url, headers: {
//       "Content-Type": "application/json",
//       'Authorization': 'Bearer $token',
//     });
//
//     print(response.body);
//     if (response.statusCode == 201 || response.statusCode == 200) {
//       requestDone = 1;
//     } else {
//       print('Request failed with status: ${response.statusCode}.');
//
//       if (response.statusCode == 404) {
//         requestDone = 2;
//       }
//     }
//
//     return requestDone;
//   }
//
//
//
//   static Future<List<dynamic>> getPlannedGifts(String year, String month) async {
//     String responseText = '[{}]';
//     List<dynamic> requestDone = json.decode(responseText);
//
//     var token = await getStoredData("token");
//     final url = Uri.https(siteURL, getPlannedGiftsURL).replace(queryParameters: {
//       'year': year,
//       'month': month
//     });
//     var response = await http.get(url, headers: {
//       "Content-Type": "application/json",
//       'Authorization': 'Bearer $token',
//     });
//
//     if (response.statusCode == 201) {
//       requestDone = json.decode(response.body);
//     } else {
//       print('Request failed with status: ${response.statusCode}.');
//
//       if (response.statusCode == 404 || response.statusCode == 432) {
//         responseText = '[{}]';
//         requestDone = json.decode(responseText);
//       }
//     }
//     return requestDone;
//   }
//
//
//   static Future<List<dynamic>> getPlannedGift(String uniqueID) async {
//     String responseText = '[{}]';
//     List<dynamic> requestDone = json.decode(responseText);
//
//     var token = await getStoredData("token");
//     final url = Uri.https(siteURL, getPlannedGiftURL).replace(queryParameters: {
//       'uniqueID': uniqueID
//     });
//     var response = await http.get(url, headers: {
//       "Content-Type": "application/json",
//       'Authorization': 'Bearer $token',
//     });
//
//     if (response.statusCode == 201) {
//       requestDone = json.decode(response.body);
//     } else {
//       print('Request failed with status: ${response.statusCode}.');
//
//       if (response.statusCode == 404 || response.statusCode == 432) {
//         responseText = '[{}]';
//         requestDone = json.decode(responseText);
//       }
//     }
//     return requestDone;
//   }
//
//
//
//   static Future<int> uploadVideoMessage(File videoFile, String uniqueID) async {
//     var requestDone = 1;
//     var email = await getStoredData("userEmail");
//     print(email);
//
//     var token = await getStoredData("token");
//     Map<String, String> headers = {
//       "Content-Type": "application/json",
//       'Authorization': 'Bearer $token',};
//
//     var request = http.MultipartRequest(
//         "POST", Uri.parse("https://" + siteURL + uploadVideoMsgURL));
//
//     request.headers.addAll(headers);
//     request.fields['email'] = email;
//     request.fields['user'] = user;
//     request.fields['userp'] = userP;
//     request.fields['uniqueID'] = uniqueID;
//
//     var picture = http.MultipartFile.fromBytes(
//         'video', File(videoFile.path).readAsBytesSync(),
//         filename: videoFile.path);
//
//     print(videoFile.path);
//
//     request.files.add(picture);
//
//     var response = await request.send();
//
//     String videoMsg = await response.stream.bytesToString();
//     storeData("userVideoMessage", videoMsg);
//     print(videoMsg);
//
//     return requestDone;
//   }
//
//
//   static Future<List<dynamic>> getStates() async {
//     String responseText = '[{}]';
//     List<dynamic> requestDone = json.decode(responseText);
//
//     const storage = FlutterSecureStorage();
//     var token = await storage.read(key: 'token');
//
//     final url = Uri.https(siteURL, getStatesURL);
//     var response = await http.get(url, headers: {
//       "Content-Type": "application/json",
//       'Authorization': 'Bearer $token',
//     });
//
//     if (response.statusCode == 200) {
//       requestDone = json.decode(response.body);
//     }
//     //print(response.statusCode);
//     //print(response.body);
//     return requestDone;
//   }
//
//
//
//   static Future<Map<String, dynamic>> getDashboardData() async {
//     String responseText = '{"amount":[]}';
//     Map<String, dynamic> requestDone = jsonDecode(responseText);
//
//     var token = await getStoredData("token");
//     final url = Uri.https(siteURL, getDashboardDataURL);
//     var response = await http.get(url, headers: {
//       "Content-Type": "application/json",
//       'Authorization': 'Bearer $token',
//     });
//     //print(response);
//     if (response.statusCode == 200) {
//       Map<String, dynamic> data = jsonDecode(response.body);
//       return data;
//     } else {
//       print('Request failed with status: ${response.statusCode}.');
//
//       if (response.statusCode == 404 || response.statusCode == 432) {
//         return requestDone;
//       }
//     }
//
//     return requestDone;
//   }
//
//
//
//
//   static Future<int> sendReferral(List<String> emails) async {
//     int requestDone = 0;
//
//     const storage = FlutterSecureStorage();
//     var token = await storage.read(key: 'token');
//
//     final url = Uri.https(siteURL, referURL).replace(queryParameters: {
//       'emails': jsonEncode(emails)
//     });
//
//     var response = await http.post(url, headers: {
//       "Content-Type": "application/json",
//       'Authorization': 'Bearer $token',
//     });
//
//     if (response.statusCode == 200) {
//       requestDone = 1;
//     }
//     print(response.body);
//
//     return requestDone;
//   }
//
//
//
//   static Future<List<dynamic>> getYearlyGifts(String year) async {
//     String responseText = '[{}]';
//     List<dynamic> requestDone = json.decode(responseText);
//
//     const storage = FlutterSecureStorage();
//     var token = await storage.read(key: 'token');
//
//     final url = Uri.https(siteURL, yearGiftsURL).replace(queryParameters: {
//       'year': year
//     });
//     var response = await http.get(url, headers: {
//       "Content-Type": "application/json",
//       'Authorization': 'Bearer $token',
//     });
//
//     if (response.statusCode == 200) {
//       requestDone = json.decode(response.body);
//     }
//
//     return requestDone;
//   }
//
//
//   static Future<List<dynamic>> getFinancialYears() async {
//     String responseText = '[{}]';
//     List<dynamic> requestDone = json.decode(responseText);
//
//     const storage = FlutterSecureStorage();
//     var token = await storage.read(key: 'token');
//
//     final url = Uri.https(siteURL, financialYearsURL);
//     var response = await http.get(url, headers: {
//       "Content-Type": "application/json",
//       'Authorization': 'Bearer $token',
//     });
//
//     if (response.statusCode == 200) {
//       requestDone = json.decode(response.body);
//     }
//
//     return requestDone;
//   }
//
//
//
//   static Future<int> emailFinancial(String year) async {
//     var requestDone = 0;
//
//     const storage = FlutterSecureStorage();
//     var token = await storage.read(key: 'token');
//
//     final url = Uri.https(siteURL, emailFinancialYearsURL).replace(queryParameters: {
//       'year': year
//     });
//     var response = await http.get(url, headers: {
//       "Content-Type": "application/json",
//       'Authorization': 'Bearer $token',
//     });
//
//     print(response.body);
//     if (response.statusCode == 200) {
//       requestDone = 1;
//     }
//
//     return requestDone;
//   }
//
//
//
//   static Future<String> viewFinancials(String year) async {
//     var requestDone = "";
//
//     const storage = FlutterSecureStorage();
//     var token = await storage.read(key: 'token');
//
//     String _url = viewFinancialsURL + year;
//     print(siteURL + _url);
//     final url = Uri.https(siteURL, _url);
//
//     var response = await http.get(url, headers: {
//       "Content-Type": "application/json",
//       'Authorization': 'Bearer $token',
//     });
//
//     if (response.statusCode == 200) {
//       print(response.body);
//       requestDone = response.body.toString();
//     }
//
//     return requestDone;
//   }
//
// }
