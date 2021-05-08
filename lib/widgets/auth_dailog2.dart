import 'package:flutter/material.dart';
import 'package:major2_room_rental/views/dailogs/login_dailog.dart';
import 'package:major2_room_rental/views/dailogs/sign_up_dailog.dart';
import 'package:major2_room_rental/views/dailogs/sign_up_dailog_2.dart';

class AuthDailog2 extends StatefulWidget {
  AuthDailog2({Key key}) : super(key: key);

  @override
  _AuthDailog2State createState() => _AuthDailog2State();
}

class _AuthDailog2State extends State<AuthDailog2> {
  Widget _widget;
  bool chkPageLoginDailog;

  @override
  void initState() {
    super.initState();
    _widget = SignUpDailog();
    chkPageLoginDailog = false;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 425,
        height: 450,
        decoration: BoxDecoration(
          // color: Colors.amber,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  // color: Colors.white,
                  height: 410,
                  child: _widget,
                ),
                Divider(
                  height: 10.0,
                ),
                Container(
                  // color: Colors.black26,
                  height: 30,
                  // width: 400,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        chkPageLoginDailog
                            ? "Don't have an account?"
                            : "Already have an account?",
                        style: TextStyle(
                            color: Color(0xFFBDC2CB),
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            chkPageLoginDailog =
                                chkPageLoginDailog ? false : true;

                            _widget = chkPageLoginDailog
                                ? LoginDailog()
                                : SignUpDailog();
                          });
                          // Navigator.of(context).pushReplacement(MaterialPageRoute(
                          //     builder: (context) => LoginDailog()));
                        },
                        child: Text(
                          chkPageLoginDailog ? "Sign Up" : "Sign in",
                          style: TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              right: 0.0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(Icons.cancel_outlined),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
