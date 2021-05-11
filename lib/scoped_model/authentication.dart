import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:major2_room_rental/Constants/current_state.dart';
import 'package:major2_room_rental/models/new%20models/user_detail_model_2.dart';
import 'package:shared_preferences/shared_preferences.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

// UserDetailModel fireBaseAuthUser;

String uid;
String firebaseAuthId;
String name;
String userEmail;
String imageUrl;

UserDetailModel2 authencatedUserInfo;

// For checking if the user is already signed into the
/// app using Google Sign In
Future getUser(Function getUserInfoWithUid) async {
  await Firebase.initializeApp();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool authSignedIn = prefs.getBool('auth') ?? false;

  checkAuthSignedInkey = authSignedIn;

  // print("authSignedIn==$authSignedIn");

  final User user = _auth.currentUser;

  if (authSignedIn == true) {
    if (user != null) {
      uid = user.uid; //prefs.getString('uid');
      firebaseAuthId = user.uid;
      name = user.displayName;
      userEmail = user.email;
      imageUrl = user.photoURL;

      await getUserInfoWithUid(uid).then((final response) {
        authencatedUserInfo = UserDetailModel2(
          uid: response['uid'],
          firebaseAuthId: response['firebaseAuthId'],
          token: response['token'],
          username: response['username'],
          email: response['email'],
          phoneNumber: response['phoneNumber'],
          userType: response['userType'],
        );

        if (response['userType'] == 'Admin') {
          checkUserTypeAdmin = true;
        } else {
          checkUserTypeAdmin = false;
        }
      });
    }
  } else {
    await prefs.setBool('auth', false);
    await prefs.setString("uid", "0000");
  }
}

Future<User> registerWithEmailPassword(String email, String password,
    Function addUsersInfoToDataBase, Map<String, dynamic> userInfo) async {
  await Firebase.initializeApp();
  User user;

  try {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    user = userCredential.user;

    if (user != null) {
      uid = user.uid;
      firebaseAuthId = user.uid;
      userEmail = user.email;

      userInfo["uid"] = user.uid;
      userInfo["firebaseAuthId"] = user.uid;
      userInfo['token'] = user.refreshToken;

      await addUsersInfoToDataBase(userInfo, uid).then((final response) {
        // if (response['Future<bool>']) {
        //   print("Add user fundation chala sucessfully ");
        //   uid = response['uid'];
        //   print("uid final updated haaaaaaa ===    uid==$uid");
        // } else {
        //   print("Add user fundation ni chala ");
        //   uid = response['uid'];
        // }

        if (response) {
          print("\nAdd user  to database fundation chala sucessfully ");
          print("\nuid final updated haaaaaaa ===    uid==$uid");
        } else {
          print("\nAdd user to database fundation ni chala ");
        }
      });

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('auth', true);
      await prefs.setString('uid', uid);
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
    print("\nerror in try function on authentication.dart == $e");
  }

  return user;
}

Future<User> signInWithEmailPassword(
    String email, String password, Function getUserInfoWithUid) async {
  await Firebase.initializeApp();
  User user;

  try {
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    user = userCredential.user;

    if (user != null) {
      uid = user.uid;
      firebaseAuthId = user.uid;
      userEmail = user.email;

      Map<String, dynamic> userInfo = await getUserInfoWithUid(uid);

      authencatedUserInfo = UserDetailModel2(
          uid: userInfo['uid'],
          firebaseAuthId: userInfo['firebaseAuthId'],
          token: userInfo['token'],
          username: userInfo['username'],
          email: userInfo['email'],
          phoneNumber: userInfo['phoneNumber'],
          userType: userInfo['userType']);

      // ToDo : Apply conditions when getuserInfoWithUid function gives null in retuen

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('auth', true);
      await prefs.setString('uid', uid);
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided.');
    }
  }

  return user;
}

Future<String> signOut() async {
  await _auth.signOut();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('auth', false);
  prefs.setString("uid", "0000");

  checkAuthSignedInkey = false;
  checkUserTypeAdmin = false;

  uid = null;
  firebaseAuthId = null;
  userEmail = null;

  return 'User signed out';
}

// Future<User> signInWithEmailPasswordWithApi(
//   String email,
//   String password,
//   Function getUserInfo,
// ) async {
//   await Firebase.initializeApp();
//   User user;

//   try {
//     UserCredential userCredential = await _auth.signInWithEmailAndPassword(
//       email: email,
//       password: password,
//     );
//     user = userCredential.user;

//     if (user != null) {
//       uid = user.uid;
//       userEmail = user.email;

//       authencatedUserInfo = await getUserInfo(userEmail);

//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       await prefs.setBool('auth', true);
//     }
//   } on FirebaseAuthException catch (e) {
//     if (e.code == 'user-not-found') {
//       print('No user found for that email.');
//     } else if (e.code == 'wrong-password') {
//       print('Wrong password provided.');
//     }
//   }

//   return user;
// }

// //////////////////////////////////////////////////

//   /// For checking if the user is already signed into the
//   /// app using Google Sign In
//   Future getUser() async {
//     print("getUser function call hua ha ");
//     await Firebase.initializeApp();

//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     bool authSignedIn = prefs.getBool('auth') ? true : false;

//     print("Auth key  == $authSignedIn");

//     final User user = _auth.currentUser;

//     if (authSignedIn == true) {
//       if (user != null) {
//         fireBaseAuthUser.uid = user.uid;
//         fireBaseAuthUser.name = user.displayName;
//         fireBaseAuthUser.userEmail = user.email;
//         fireBaseAuthUser.imageUrl = user.photoURL;
//       }
//     }
//   }

//   void setAuthKey(User user) async {
//     if (user != null) {
//       print("function set auth key if ka andar ");

//       fireBaseAuthUser.uid = user.uid;
//       fireBaseAuthUser.name = user.displayName;
//       fireBaseAuthUser.userEmail = user.email;
//       fireBaseAuthUser.imageUrl = user.photoURL;

//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       prefs.setBool('auth', true);
//     }
//   }

//   Future<bool> get getAuthKeyValue async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getBool('auth');
//   }
