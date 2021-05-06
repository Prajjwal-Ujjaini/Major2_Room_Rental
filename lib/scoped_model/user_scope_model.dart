import 'dart:convert';
import 'package:major2_room_rental/Constants/constants.dart';
import 'package:major2_room_rental/enums/auth_mode.dart';
import 'package:major2_room_rental/models/user_detail_model.dart';
import 'package:major2_room_rental/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;

class UserScopedModdel extends Model {
  bool _isLoading = false;

  List<UserModel> _users = [];
  List<UserDetailModel> _userInfos = [];

  UserModel _authencatedUser;
  UserDetailModel _authencatedUserInfo;

  List<UserModel> get users {
    return List.from(_users);
  }

  List<UserDetailModel> get userInfos {
    return List.from(_userInfos);
  }

  UserModel get aunthenticatedUser {
    return _authencatedUser;
  }

  UserDetailModel get aunthenticatedUserInfo {
    return _authencatedUserInfo;
  }

  bool get isLoading {
    return _isLoading;
  }

  Future<bool> fetchUserInfo() async {
    _isLoading = true;
    notifyListeners();
    try {
      final http.Response response =
          await http.get(Uri.parse("$AppUrl/users.json"));

      final Map<String, dynamic> fetchedData = json.decode(response.body);
      print("fetch data == $fetchedData");

      final List<UserDetailModel> userInfos = [];

      fetchedData.forEach((String id, dynamic userInfoData) {
        UserDetailModel userInfo = UserDetailModel(
          uid: id,
          email: userInfoData['email'],
          userType: userInfoData['userType'],
          userId: userInfoData['localId'],
          username: userInfoData['username'],
        );

        userInfos.add(userInfo);
      });

      _userInfos = userInfos;
      _isLoading = false;
      notifyListeners();
      return Future.value(true);
    } catch (error) {
      print("The erreo ==$error");
      _isLoading = false;
      notifyListeners();
      return Future.value(false);
    }
  }

  Future<bool> addUsersInfo(Map<String, dynamic> userInfo) async {
    _isLoading = true;
    notifyListeners();

    print("Add user function ka andar ");
    try {
      final http.Response response = await http
          .post(Uri.parse("$AppUrl/users.json"), body: json.encode(userInfo));

      final Map<String, dynamic> responseData = json.decode(response.body);

      UserDetailModel userInfoWithID = UserDetailModel(
        uid: responseData["name"],
        email: userInfo['email'],
        username: userInfo['username'],
        // firstName: userInfo['firstName'],
        // lastName: userInfo['lastName'],
        // phoneNumber: userInfo['phoneNumber'],
        // token: userInfo['token'],
        // userType: userInfo['userType'],
      );

      _userInfos.add(userInfoWithID);
      _isLoading = false;
      notifyListeners();
      print(" user add function ma last == true ");
      return Future.value(true);
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      print(" user add function ma last ==False ");
      return Future.value(false);
    }
  }

  Future<UserDetailModel> getUserInfo(String userId) async {
    print("User info ka andar aya ha firebase id la kr == $userId ");
    final bool response = await fetchUserInfo();
    print("respos == $response");
    UserDetailModel foundUserInfo;
    if (response) {
      for (int i = 0; i < _userInfos.length; i++) {
        foundUserInfo = _userInfos[i];
        print("the found user==${foundUserInfo.email}");
        break;
      }
    }
    return Future.value(foundUserInfo);
  }

  UserDetailModel getUserDetails(String userId) {
    fetchUserInfo();
    UserDetailModel foundUserInfo;
    for (int i = 0; i < _userInfos.length; i++) {
      foundUserInfo = _userInfos[i];
      break;
    }
    return foundUserInfo;
  }

  Future<Map<String, dynamic>> authenticate(String email, String password,
      {AuthMode authMode = AuthMode.SignIn,
      Map<String, dynamic> userInfo}) async {
    _isLoading = true;
    notifyListeners();

    print("Auth Mode=========== $authMode");

    Map<String, dynamic> authData = {
      "email": email,
      "password": password,
      "returnSecureToken": true,
    };

    String message;
    bool hasError = false;

    try {
      http.Response response;

      if (authMode == AuthMode.SignUp) {
        response = await http.post(
          Uri.parse("$SignUpUrl$APIKey"),
          body: json.encode(authData),
          headers: {'Content-Type': 'application/json'},
        );
      } else if (authMode == AuthMode.SignIn) {
        response = await http.post(
          Uri.parse("$LoginUrl$APIKey"),
          body: json.encode(authData),
          headers: {'Content-Type': 'application/json'},
        );
      }

      Map<String, dynamic> responseBody = json.decode(response.body);

      if (responseBody.containsKey('idToken')) {
        _authencatedUser = UserModel(
          id: responseBody['localId'],
          email: responseBody['email'],
          token: responseBody['idToken'],
        );

        if (authMode == AuthMode.SignIn) {
          _authencatedUserInfo = await getUserInfo(responseBody['localId']);

          message = "Sign in sucessfully";
        } else if (authMode == AuthMode.SignUp) {
          userInfo['localId'] = responseBody['localId'];
          addUsersInfo(userInfo);

          message = "Sign up sucessfully";
        }
      } else {
        hasError = true;

        if (responseBody['error']['message'] == 'EMAIL_EXISTS') {
          message = 'Email already exist';
        } else if (responseBody['error']['message'] == 'EMAIL_NOT_FOUND') {
          message = 'Email does not exist';
        } else if (responseBody['error']['message'] == 'INVALID_PASSWORD') {
          message = 'password is incorrest';
        }
      }

      _isLoading = false;
      notifyListeners();
      return {
        'message': message,
        'hasError': hasError,
      };
    } catch (error) {
      print("the error signiniup:$error");

      _isLoading = false;
      notifyListeners();

      return {
        'message': 'Failed to SignUp',
        'hasError': !hasError,
      };
    }
  }

  void logout() {
    _authencatedUser = null;
    _authencatedUserInfo = null;
  }

  Future<bool> getSingleUserInfo(String userId) async {
    _isLoading = true;
    notifyListeners();
    try {
      final http.Response response =
          await http.get(Uri.parse("$AppUrl/users.json"));

      final Map<String, dynamic> fetchedData = json.decode(response.body);
      // print(fetchedData);

      final List<UserDetailModel> userInfos = [];

      fetchedData.forEach((String id, dynamic userInfoData) {
        UserDetailModel userInfo = UserDetailModel(
          uid: id,
          email: userInfoData['email'],
          userType: userInfoData['userType'],
          userId: userInfoData['localId'],
          username: userInfoData['username'],
        );

        userInfos.add(userInfo);
      });

      _userInfos = userInfos;
      _isLoading = false;
      notifyListeners();
      return Future.value(true);
    } catch (error) {
      print("The erreo ==$error");
      _isLoading = false;
      notifyListeners();
      return Future.value(false);
    }
  }
}
