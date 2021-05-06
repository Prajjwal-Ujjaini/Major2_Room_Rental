import 'package:flutter/material.dart';
import 'package:major2_room_rental/Constants/current_state.dart';
import 'package:major2_room_rental/scoped_model/authentication.dart';
import 'package:major2_room_rental/scoped_model/main_model.dart';
import 'package:major2_room_rental/views/home_new.dart';
import 'package:major2_room_rental/widgets/button_with_name.dart';
import 'package:major2_room_rental/widgets/show_loading_indicator_msg.dart';
import 'package:scoped_model/scoped_model.dart';

class SignUpDailog extends StatefulWidget {
  final BuildContext signUpContext;

  const SignUpDailog({Key key, this.signUpContext}) : super(key: key);

  @override
  _SignUpDailogState createState() => _SignUpDailogState();
}

class _SignUpDailogState extends State<SignUpDailog> {
  bool _toggleVisibilityPassword = true;

  String _email;
  String _username;
  String _password;

  GlobalKey<FormState> _formKey = GlobalKey();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: 400,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Card(
                  elevation: 5.0,
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      children: <Widget>[
                        _buildUserNameTextField(),
                        SizedBox(
                          height: 20.0,
                        ),
                        _buildEmailTextField(),
                        SizedBox(
                          height: 20.0,
                        ),
                        _buildPasswordTextField(),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                _buildSignUpButton(),
                // Divider(
                //   height: 20.0,
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: <Widget>[
                //     Text(
                //       "Already have an account?",
                //       style: TextStyle(
                //           color: Color(0xFFBDC2CB),
                //           fontWeight: FontWeight.bold,
                //           fontSize: 18.0),
                //     ),
                //     SizedBox(
                //       width: 10.0,
                //     ),
                //     GestureDetector(
                //       onTap: () {
                //         Navigator.of(context).pushReplacement(MaterialPageRoute(
                //             builder: (context) => LoginDailog()));
                //       },
                //       child: Text(
                //         "Sign in",
                //         style: TextStyle(
                //             color: Colors.blueAccent,
                //             fontWeight: FontWeight.bold,
                //             fontSize: 18.0),
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmailTextField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Email",
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18.0,
        ),
      ),
      onSaved: (String email) {
        _email = email.trim();
      },
      validator: (String email) {
        String errorMessage;
        if (!email.contains("@")) {
          errorMessage = "Your email is incorrect";
        }
        if (email.isEmpty) {
          errorMessage = "Your email fiels is required";
        }
        return errorMessage;
      },
    );
  }

  Widget _buildUserNameTextField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Username",
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18.0,
        ),
      ),
      onSaved: (String username) {
        _username = username.trim();
      },
      validator: (String username) {
        String errorMessage;
        if (username.isEmpty) {
          errorMessage = "Username field is required";
        }
        return errorMessage;
      },
    );
  }

  Widget _buildPasswordTextField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Password",
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18.0,
        ),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _toggleVisibilityPassword = !_toggleVisibilityPassword;
            });
          },
          icon: _toggleVisibilityPassword
              ? Icon(Icons.visibility_off)
              : Icon(Icons.visibility),
        ),
      ),
      obscureText: _toggleVisibilityPassword,
      onSaved: (String password) {
        _password = password;
      },
      validator: (String password) {
        String errorMessage;
        if (password.isEmpty) {
          errorMessage = "password field is required";
        }
        return errorMessage;
      },
    );
  }

  Widget _buildSignUpButton() {
    return ScopedModelDescendant(
      builder: (BuildContext sctx, Widget child, MainModel model) {
        return GestureDetector(
          onTap: () {
            print("Signing in process start ");
            onSubmit(model.addUsersInfo);
          },
          child: Container(
            height: 50.0,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(25.0)),
            child: ButtonName(btnText: "SignUp"),
          ),
        );
      },
    );
  }

  Future<void> onSubmit(Function addUsersInfo) async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      Map<String, dynamic> userInfo = {
        "email": _email,
        "username": _username,
        "userType": "customer",
      };

      print("user info auth fun ka phela $userInfo");

      showLoadingIndicatorMsg(context, "Signing uppp");

      await registerWithEmailPassword(_email, _password, addUsersInfo, userInfo)
          .then((final response) async {
        // print("new response == $response");
        // print("hope this work ");

        if (response != null) {
          Navigator.of(context).pop();
          setState(() {
            checkAuthSignedInkey = true;
          });

          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (BuildContext context) => HomeNew()));
          // print(response);
        }

// authenticate(_email, _password,
//               authMode: AuthMode.SignUp, userInfo: userInfo)
//         .then((final response) async {

//         Navigator.of(context).pop();

//         if (!response['hasError']) {
//           Navigator.of(context).pop();

//           Navigator.of(context).pop();

//           // setState(() {
//           //   currentTab = 0;
//           //   currentPage = pages[0];
//           // });

//           // Navigator.of(context).pushReplacement(
//           //     MaterialPageRoute(builder: (BuildContext context) => HomeView()));

//           // Navigator.of(context).pushReplacementNamed("/mainscreen");

//           // locator<NavigationService>().goBack();

//           print("Sucess login hua ha ");
//           // locator<NavigationService>().navigateTo(HomeRoute);
//           // locator<NavigationService>().goBack();
//         } else {
//           Navigator.of(context).pop();
//           _scaffoldKey.currentState.showSnackBar(
//             SnackBar(
//               duration: Duration(seconds: 2),
//               backgroundColor: Colors.red,
//               content: Text(response['message']),
//             ),
//           );
//         }
      }).catchError((error) {
        print('Registration Error: $error');
        Navigator.of(context).pop();
        // ignore: deprecated_member_use
        _scaffoldKey.currentState.showSnackBar(
          SnackBar(
            duration: Duration(seconds: 2),
            backgroundColor: Colors.red,
            content: Text('Registration Error: $error'),
          ),
        );
      });
    }
  }
}
