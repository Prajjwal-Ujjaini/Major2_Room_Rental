// import 'dart:convert';
// import 'package:major2_room_rental/Constants/constants.dart';
// import 'package:major2_room_rental/models/new%20models/user_detail_model_2.dart';
// import 'package:major2_room_rental/models/user_model.dart';
// import 'package:major2_room_rental/scoped_model/new%20models/authentication2.dart';
// import 'package:scoped_model/scoped_model.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';

// class UserScopedModdel2 extends Model {
//   bool _isLoading = false;

//   bool get isLoading {
//     return _isLoading;
//   }

//   // UserModel _authencatedUser;
//   UserDetailModel2 _authencatedUserInfo;

//   // UserModel get aunthenticatedUser {
//   //   return _authencatedUser;
//   // }

//   UserDetailModel2 get aunthenticatedUserInfo {
//     return _authencatedUserInfo;
//   }

//   Future<Map<String, dynamic>> signUpWithEmailPasswordWithApi(
//       String email, String password, Map<String, dynamic> userInfo) async {
//     //local msg
//     String message;
//     bool hasError = false;

//     _isLoading = true;
//     notifyListeners();

//     Map<String, dynamic> authData = {
//       "email": email,
//       "password": password,
//       "returnSecureToken": true,
//     };

//     try {
//       http.Response response;

//       response = await http.post(
//         Uri.parse("$SignUpUrl$APIKey"),
//         body: json.encode(authData),
//         headers: {'Content-Type': 'application/json'},
//       );

//       Map<String, dynamic> responseBody = json.decode(response.body);

//       print(
//           "\n\n\nfull response after auth and before add user to data baase \n\n\n====${responseBody}\n\n\n");

//       if (responseBody.containsKey('idToken')) {
//         userInfo['uid'] = responseBody['localId'];
//         userInfo['firebaseAuthId'] = responseBody['idToken'];
//         userInfo['token'] = responseBody['refreshToken'];

//         print("\n\n first time user id come == ${responseBody['localId']}");

//         addUsersInfoToDataBase(userInfo);
//         // TODO: have to add constraint after returinig bool value from addUserInformaton

//         message = "Sign up sucessfully";
//         print("return mag printed == $message");
//       } else {
//         hasError = true;

//         print("has error code ma gaya  == $hasError");

//         if (responseBody['error']['message'] == 'EMAIL_EXISTS') {
//           message = 'Email already exist';
//         } else if (responseBody['error']['message'] == 'EMAIL_NOT_FOUND') {
//           message = 'Email does not exist';
//         } else if (responseBody['error']['message'] == 'INVALID_PASSWORD') {
//           message = 'password is incorrest';
//         }
//       }

//       _isLoading = false;
//       notifyListeners();
//       return {
//         'message': message,
//         'hasError': hasError,
//       };
//     } catch (error) {
//       print("the error signiniup:$error");

//       _isLoading = false;
//       notifyListeners();

//       return {
//         'message': 'Failed to SignUp',
//         'hasError': !hasError,
//       };
//     }
//   }

//   Future<bool> addUsersInfoToDataBase(Map<String, dynamic> userInfo) async {
//     _isLoading = true;
//     notifyListeners();

//     print("Add user function ka andar ");
//     try {
//       final http.Response response = await http
//           .post(Uri.parse("$AppUrl/users.json"), body: json.encode(userInfo));

//       final Map<String, dynamic> responseData = json.decode(response.body);

//       print("\n\n\n\nResposne after adding user== ${responseData}  \n\n");

//       if (responseData['name'] != null) {
//         uid = responseData["name"];
//         userEmail = userInfo['email'];

//         print("\n\n user id from response ==$uid");

//         // _authencatedUser.uid = uid;
//         // _authencatedUser.email = userEmail;

//         SharedPreferences prefs = await SharedPreferences.getInstance();
//         await prefs.setBool('auth', true);
//       }

//       _isLoading = false;
//       notifyListeners();
//       print(" user add function ma last == true ");
//       return Future.value(true);
//     } catch (e) {
//       _isLoading = false;
//       notifyListeners();
//       print(" user add function ma last ==False ");
//       return Future.value(false);
//     }
//   }
// }
