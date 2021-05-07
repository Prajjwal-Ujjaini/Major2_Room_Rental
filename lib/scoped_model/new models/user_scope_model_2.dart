// import 'dart:convert';
// import 'package:major2_room_rental/Constants/constants.dart';
// import 'package:major2_room_rental/enums/auth_mode.dart';
// import 'package:major2_room_rental/models/user_detail_model.dart';
// import 'package:major2_room_rental/models/user_model.dart';
// import 'package:scoped_model/scoped_model.dart';
// import 'package:http/http.dart' as http;

// class UserScopedModdel2 extends Model {
//   bool _isLoading = false;

//   UserModel _authencatedUser;
//   UserDetailModel _authencatedUserInfo;

//   UserModel get aunthenticatedUser {
//     return _authencatedUser;
//   }

//   UserDetailModel get aunthenticatedUserInfo {
//     return _authencatedUserInfo;
//   }

//   bool get isLoading {
//     return _isLoading;
//   }

//   Future<Map<String, dynamic>> signInWithEmailPasswordWithApi(
//       String email, String password, Map<String, dynamic> userInfo) async {
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

//       if (responseBody.containsKey('idToken')) {
//         userInfo['uid'] = responseBody['localId'];
//         userInfo['firebaseAuthId'] = responseBody['idToken'];
//         userInfo['token'] = responseBody['refreshToken'];

//         addUsersInfo(userInfo);

//         message = "Sign up sucessfully";

//       } else {
//         hasError = true;

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

//   Future<bool> addUsersInfo(Map<String, dynamic> userInfo) async {
//     _isLoading = true;
//     notifyListeners();

//     print("Add user function ka andar ");
//     try {
//       final http.Response response = await http
//           .post(Uri.parse("$AppUrl/users.json"), body: json.encode(userInfo));

//       final Map<String, dynamic> responseData = json.decode(response.body);

//       print("\n\nResposne after adding user== ${responseData}  ");

//       // UserDetailModel userInfoWithID = UserDetailModel(
//       //   uid: responseData["name"],
//       //   email: userInfo['email'],
//       //   username: userInfo['username'],
//       //   // firstName: userInfo['firstName'],
//       //   // lastName: userInfo['lastName'],
//       //   // phoneNumber: userInfo['phoneNumber'],
//       //   // token: userInfo['token'],
//       //   // userType: userInfo['userType'],
//       // );

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
