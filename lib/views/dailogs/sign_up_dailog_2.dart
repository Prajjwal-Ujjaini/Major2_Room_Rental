// import 'package:flutter/material.dart';
// import 'package:major2_room_rental/scoped_model/authentication.dart';
// import 'package:major2_room_rental/scoped_model/main_model.dart';
// import 'package:major2_room_rental/widgets/button_with_name.dart';
// import 'package:major2_room_rental/widgets/show_loading_indicator_msg.dart';
// import 'package:scoped_model/scoped_model.dart';
// import 'package:major2_room_rental/scoped_model/new models/user_scope_model_2.dart';

// class SignUpDailog2 extends StatefulWidget {
//   final BuildContext signUpContext;

//   const SignUpDailog2({Key key, this.signUpContext}) : super(key: key);

//   @override
//   _SignUpDailog2State createState() => _SignUpDailog2State();
// }

// class _SignUpDailog2State extends State<SignUpDailog2> {
//   bool _toggleVisibilityPassword = true;

//   String _email;
//   String _username;
//   String _password;

//   GlobalKey<FormState> _formKey = GlobalKey();
//   GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Container(
//         width: 400,
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 10.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Text(
//                   "Sign Up",
//                   style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(
//                   height: 20.0,
//                 ),
//                 Card(
//                   elevation: 5.0,
//                   child: Padding(
//                     padding: EdgeInsets.all(20.0),
//                     child: Column(
//                       children: <Widget>[
//                         _buildUserNameTextField(),
//                         SizedBox(
//                           height: 20.0,
//                         ),
//                         _buildEmailTextField(),
//                         SizedBox(
//                           height: 20.0,
//                         ),
//                         _buildPasswordTextField(),
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 30.0,
//                 ),
//                 _buildSignUpButton(),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildEmailTextField() {
//     return TextFormField(
//       decoration: InputDecoration(
//         hintText: "Email",
//         hintStyle: TextStyle(
//           color: Color(0xFFBDC2CB),
//           fontSize: 18.0,
//         ),
//       ),
//       onSaved: (String email) {
//         _email = email.trim();
//       },
//       validator: (String email) {
//         String errorMessage;
//         if (!email.contains("@")) {
//           errorMessage = "Your email is incorrect";
//         }
//         if (email.isEmpty) {
//           errorMessage = "Your email fiels is required";
//         }
//         return errorMessage;
//       },
//     );
//   }

//   Widget _buildUserNameTextField() {
//     return TextFormField(
//       decoration: InputDecoration(
//         hintText: "Username",
//         hintStyle: TextStyle(
//           color: Color(0xFFBDC2CB),
//           fontSize: 18.0,
//         ),
//       ),
//       onSaved: (String username) {
//         _username = username.trim();
//       },
//       validator: (String username) {
//         String errorMessage;
//         if (username.isEmpty) {
//           errorMessage = "Username field is required";
//         }
//         return errorMessage;
//       },
//     );
//   }

//   Widget _buildPasswordTextField() {
//     return TextFormField(
//       decoration: InputDecoration(
//         hintText: "Password",
//         hintStyle: TextStyle(
//           color: Color(0xFFBDC2CB),
//           fontSize: 18.0,
//         ),
//         suffixIcon: IconButton(
//           onPressed: () {
//             setState(() {
//               _toggleVisibilityPassword = !_toggleVisibilityPassword;
//             });
//           },
//           icon: _toggleVisibilityPassword
//               ? Icon(Icons.visibility_off)
//               : Icon(Icons.visibility),
//         ),
//       ),
//       obscureText: _toggleVisibilityPassword,
//       onSaved: (String password) {
//         _password = password;
//       },
//       validator: (String password) {
//         String errorMessage;
//         if (password.isEmpty) {
//           errorMessage = "password field is required";
//         }
//         return errorMessage;
//       },
//     );
//   }

//   Widget _buildSignUpButton() {
//     return ScopedModelDescendant(
//       builder: (BuildContext sctx, Widget child, MainModel model) {
//         return GestureDetector(
//           onTap: () {
//             print("Signing in process start ");
//             onSubmit(model.signUpWithEmailPasswordWithApi,
//                 model.addUsersInfoToDataBase);
//           },
//           child: Container(
//             height: 50.0,
//             decoration: BoxDecoration(
//                 color: Colors.blue, borderRadius: BorderRadius.circular(25.0)),
//             child: ButtonName(btnText: "SignUp"),
//           ),
//         );
//       },
//     );
//   }

//   Future<void> onSubmit(Function signUpWithEmailPasswordWithApi,
//       Function addUsersInfoToDataBase) async {
//     if (_formKey.currentState.validate()) {
//       _formKey.currentState.save();

//       Map<String, dynamic> userInfo = {
//         "email": _email,
//         "username": _username,
//         "userType": "customer",
//       };

//       print("user info auth fun ka phela $userInfo");

//       showLoadingIndicatorMsg(context, "Signing uppp");

//       await signUpWithEmailPasswordWithApi(_email, _password, userInfo)
//           .then((final response) {
//         if (!response['hasError']) {
//           Navigator.of(context).pop();
//           print("Sucess login hua ha ");
//           Navigator.of(context).pop();
//         } else {
//           Navigator.of(context).pop();
//           // ignore: deprecated_member_use
//           _scaffoldKey.currentState.showSnackBar(
//             SnackBar(
//               duration: Duration(seconds: 2),
//               backgroundColor: Colors.red,
//               content: Text(response['message']),
//             ),
//           );
//         }
//       }).catchError((error) {
//         print('Registration Error: $error');
//         Navigator.of(context).pop();
//         // ignore: deprecated_member_use
//         _scaffoldKey.currentState.showSnackBar(
//           SnackBar(
//             duration: Duration(seconds: 2),
//             backgroundColor: Colors.red,
//             content: Text('Registration Error: $error'),
//           ),
//         );
//       });
//     }
//   }
// }
