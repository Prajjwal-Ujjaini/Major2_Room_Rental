import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:major2_room_rental/Constants/current_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
// UserDetailModel fireBaseAuthUser;

String uid;
String name;
String userEmail;
String imageUrl;

// For checking if the user is already signed into the
/// app using Google Sign In
Future getUser() async {
  await Firebase.initializeApp();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool authSignedIn = prefs.getBool('auth') ?? false;
  checkAuthSignedInkey = authSignedIn;

  // print("authSignedIn==$authSignedIn");

  final User user = _auth.currentUser;

  if (authSignedIn == true) {
    if (user != null) {
      uid = user.uid;
      name = user.displayName;
      userEmail = user.email;
      imageUrl = user.photoURL;
    }
  } else {
    await prefs.setBool('auth', false);
  }
}

Future<User> registerWithEmailPassword(String email, String password) async {
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
      userEmail = user.email;

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('auth', true);
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }

  return user;
}

Future<User> signInWithEmailPassword(String email, String password) async {
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
      userEmail = user.email;

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('auth', true);
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

  checkAuthSignedInkey = false;

  uid = null;
  userEmail = null;

  return 'User signed out';
}

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