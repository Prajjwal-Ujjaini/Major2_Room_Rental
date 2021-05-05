import 'package:flutter/material.dart';
import 'package:major2_room_rental/Constants/style.dart';

int currentTab = 0;

// HomeView homePage;
// SignUpPage signUpPage;
// LoginPage loginPage;
// AboutPage aboutPage;
// AdminPage adminPage;

// // List<Widget> pages = [homePage, signUpPage, loginPage, aboutPage, adminPage];
Widget currentPage;
List<Widget> pages;

Text textHome = Text("Home", style: navBarItemTextStyle);
Text textSignup = Text("SignUp", style: navBarItemTextStyle);
Text textLogin = Text("Login", style: navBarItemTextStyle);
Text textAbout = Text("About", style: navBarItemTextStyle);
Text textAdmin = Text("Admin", style: navBarItemTextStyle);

List<Widget> itemsData = [
  textHome,
  textSignup,
  textLogin,
  textAbout,
  textAdmin
];

bool checkAuthSignedInkey = false;
