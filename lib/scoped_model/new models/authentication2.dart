// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:major2_room_rental/Constants/current_state.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// final FirebaseAuth _auth = FirebaseAuth.instance;
// // UserDetailModel fireBaseAuthUser;

// String uid;
// String userName;
// String userEmail;
// String imageUrl;

// // UserDetailModel authencatedUserInfo;

// // For checking if the user is already signed into the
// /// app using Google Sign In
// Future getUser() async {
//   await Firebase.initializeApp();

//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   bool authSignedIn = prefs.getBool('auth') ?? false;
//   checkAuthSignedInkey = authSignedIn;

//   // print("authSignedIn==$authSignedIn");

//   final User user = _auth.currentUser;

//   if (authSignedIn == true) {
//     if (user != null) {
//       uid = user.uid;
//       userName = user.displayName;
//       userEmail = user.email;
//       imageUrl = user.photoURL;
//     }
//   } else {
//     await prefs.setBool('auth', false);
//   }
// }

// Future<String> signOut() async {
//   await _auth.signOut();

//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   prefs.setBool('auth', false);

//   checkAuthSignedInkey = false;

//   uid = null;
//   userEmail = null;

//   return 'User signed out';
// }
