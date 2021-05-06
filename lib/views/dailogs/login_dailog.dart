import 'package:flutter/material.dart';
import 'package:major2_room_rental/Constants/current_state.dart';
import 'package:major2_room_rental/scoped_model/authentication.dart';
import 'package:major2_room_rental/scoped_model/main_model.dart';
import 'package:major2_room_rental/views/home_new.dart';
import 'package:major2_room_rental/widgets/button_with_name.dart';
import 'package:major2_room_rental/widgets/show_loading_indicator_msg.dart';
import 'package:scoped_model/scoped_model.dart';

class LoginDailog extends StatefulWidget {
  @override
  _LoginDailogState createState() => _LoginDailogState();
}

class _LoginDailogState extends State<LoginDailog> {
  bool _toggleVisibility = true;

  String _email;
  String _password;

  GlobalKey<FormState> _formKey = GlobalKey();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  "Sign In",
                  style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 25.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      "Forgetten Password?",
                      style: TextStyle(fontSize: 18, color: Colors.blueAccent),
                    ),
                  ],
                ),
                Card(
                  elevation: 5.0,
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      children: <Widget>[
                        _buildEmailTextField(),
                        _buildPasswordTextField(),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                _buildSignInButton(),
                // Divider(
                //   height: 20.0,
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: <Widget>[
                //     Text(
                //       "Don't have an account?",
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
                //             builder: (BuildContext context) => SignUpDailog()));
                //       },
                //       child: Text(
                //         "Sign up",
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
        hintText: "Your Email",
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
        // if (email.isEmpty) {
        //   errorMessage = "Your email fiels is required";
        // }
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
              _toggleVisibility = !_toggleVisibility;
            });
          },
          icon: _toggleVisibility
              ? Icon(Icons.visibility_off)
              : Icon(Icons.visibility),
        ),
      ),
      obscureText: _toggleVisibility,
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

  Widget _buildSignInButton() {
    return ScopedModelDescendant(
      builder: (BuildContext sctx, Widget child, MainModel model) {
        return GestureDetector(
          onTap: () {
            // showLoadingIndicatorMsg(context, "Signining In ...");
            onSubmit(model.getUserInfo);
          },
          child: ButtonName(btnText: "Sign In"),
        );
      },
    );
  }

  Future<void> onSubmit(Function getUserInfo) async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      showLoadingIndicatorMsg(context, "Signing In ....");

      await signInWithEmailPassword(_email, _password, getUserInfo)
          .then((final response) {
        if (response != null) {
          Navigator.of(context).pop();

          setState(() {
            checkAuthSignedInkey = true;
          });

          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (BuildContext context) => HomeNew()));
          // print(response);
        }
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

      // authenticate(_email, _password).then((final response) {
      //   if (!response['hasError']) {
      //     Navigator.of(context).pop();
      //     Navigator.of(context).pop();

      //     print("Login Hua ha");
      //   } else {
      //     Navigator.of(context).pop();
      //     _scaffoldKey.currentState.showSnackBar(
      //       SnackBar(
      //         duration: Duration(seconds: 2),
      //         backgroundColor: Colors.red,
      //         content: Text(response['message']),
      //       ),
      //     );
      //   }
      // });
    }
  }
}
