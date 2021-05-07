import 'package:flutter/material.dart';
import 'package:major2_room_rental/Constants/current_state.dart';
import 'package:major2_room_rental/Constants/decorations.dart';
import 'package:major2_room_rental/Constants/image_url.dart';
import 'package:major2_room_rental/models/room_model.dart';
import 'package:major2_room_rental/scoped_model/authentication.dart';
import 'package:major2_room_rental/scoped_model/main_model.dart';
import 'package:major2_room_rental/views/home_new.dart';
import 'package:major2_room_rental/widgets/bottom_bar.dart';
import 'package:major2_room_rental/widgets/button_with_name.dart';
import 'package:major2_room_rental/widgets/centered_view.dart';
import 'package:major2_room_rental/widgets/featured_heading.dart';
import 'package:major2_room_rental/widgets/navigation_bar.dart';
import 'package:major2_room_rental/widgets/small_button.dart';
import 'package:scoped_model/scoped_model.dart';

class AddRooms extends StatefulWidget {
  final RoomModel roomModel;

  const AddRooms({this.roomModel});

  @override
  _AddRoomsState createState() => _AddRoomsState();
}

class _AddRoomsState extends State<AddRooms> {
  String roomName;
  String mno;
  String city;
  String pin;
  String address;
  String imagePath;
  String rent;
  String distanceFromMarket;

  String chkRoomName = "House/Room Name";
  String chkMno = "Phone Number";
  String chkCity = "City";
  String chkPin = "PinCode";
  String chkAddress = "Address";
  String chkImagePath;
  String chkRent = "Rent";
  String chkDistanceFromMarket = "Distance From Market (in Km)";

  GlobalKey<FormState> _foodItemFormKey = GlobalKey();
  GlobalKey<ScaffoldState> _scaffoldStateKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: WillPopScope(
        onWillPop: () {
          Navigator.of(context).pop(false);
          return Future.value(false);
        },
        child: Scaffold(
          key: _scaffoldStateKey,
          body: SingleChildScrollView(
            child: Container(
              decoration: backgroundMainDecoration,
              // padding: EdgeInsets.symmetric(horizontal: 16.0),
              // width: MediaQuery.of(context).size.width,
              // height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  NavigationBar(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 60,
                      ),
                      FeaturedHeading(
                          title: "Add Rooms", screenSize: screenSize),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.blue,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: GestureDetector(
                          onTap: () async {
                            await signOut().then((result) {
                              print(result);

                              setState(() {
                                checkAuthSignedInkey = false;
                              });
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          HomeNew()));
                            }).catchError((error) {
                              print('Sign Out Error: $error');
                            });
                          },
                          child: SmallButton(
                            btnText: "Log Out",
                          ),
                        ),
                      ),
                    ],
                  ),
                  CenteredView(
                    child: Container(
                      child: Form(
                        key: _foodItemFormKey,
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 170.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(homeImageUrl),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            _builderTextFormField(chkRoomName),
                            _builderTextFormField(chkMno),
                            _builderTextFormField(chkCity),
                            _builderTextFormField(chkPin),
                            _builderTextFormField(chkAddress, maxLine: 5),
                            _builderTextFormField(chkRent),
                            _builderTextFormField(chkDistanceFromMarket),
                            SizedBox(height: 30.0),
                            ScopedModelDescendant(
                              builder: (BuildContext context, Widget child,
                                  MainModel model) {
                                return GestureDetector(
                                  onTap: () {
                                    onSubmit(model.addRoom, model.updateRoom);
                                    // if (model.isLoading) {
                                    //   showLoadingIndicatorMsg(
                                    //       context,
                                    //       widget.roomModel != null
                                    //           ? "Upadting food ...."
                                    //           : "Adding Food Item...");
                                    // }
                                  },
                                  child: ButtonName(
                                      btnText: widget.roomModel != null
                                          ? "Update Room "
                                          : "Add Room"),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  BottomBar(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _builderTextFormField(String hint, {int maxLine = 1}) {
    return TextFormField(
      initialValue: widget.roomModel != null && hint == chkRoomName
          ? widget.roomModel.roomName
          : widget.roomModel != null && hint == chkMno
              ? widget.roomModel.mno
              : widget.roomModel != null && hint == chkCity
                  ? widget.roomModel.city
                  : widget.roomModel != null && hint == chkPin
                      ? widget.roomModel.pin
                      : widget.roomModel != null && hint == chkAddress
                          ? widget.roomModel.address
                          : widget.roomModel != null && hint == chkRent
                              ? widget.roomModel.rent
                              : widget.roomModel != null &&
                                      hint == chkDistanceFromMarket
                                  ? widget.roomModel.distanceFromMarket
                                  : hint,
      decoration: InputDecoration(hintText: "$hint"),
      maxLines: maxLine,
      keyboardType: hint == chkMno ||
              hint == chkPin ||
              hint == chkRent ||
              hint == chkDistanceFromMarket
          ? TextInputType.number
          : TextInputType.text,
      // ignore: missing_return
      validator: (String value) {
        if (value.isEmpty && hint == chkRoomName) {
          return "the Room Name is required";
        }
        if (value.isEmpty && hint == chkMno) {
          return "the Mobile Number is required";
        }
        if (value.isEmpty && hint == chkCity) {
          return "the Room City is required";
        }
        if (value.isEmpty && hint == chkPin) {
          return "the Room  City Pin is required";
        }
        if (value.isEmpty && hint == chkAddress) {
          return "the Room  Address is required";
        }
        if (value.isEmpty && hint == chkRent) {
          return "the Room  Rent is required";
        }
        if (value.isEmpty && hint == chkDistanceFromMarket) {
          return "the Room  Distance from market is required";
        }
        // return "Some Error";
      },
      onSaved: (String value) {
        if (hint == chkRoomName) {
          roomName = value;
        }
        if (hint == chkMno) {
          mno = value;
        }
        if (hint == chkCity) {
          city = value;
        }
        if (hint == chkPin) {
          pin = value;
        }
        if (hint == chkAddress) {
          address = value;
        }
        if (hint == chkRent) {
          rent = value;
        }
        if (hint == chkDistanceFromMarket) {
          distanceFromMarket = value;
        }
      },
    );
  }

  void onSubmit(Function addRoom, Function updateRoom) async {
    if (_foodItemFormKey.currentState.validate()) {
      _foodItemFormKey.currentState.save();

      if (widget.roomModel != null) {
        Map<String, dynamic> updatedFoodItem = {
          "roomName": roomName,
          "mno": mno,
          "city": city,
          "pin": pin,
          "address": address,
          "imag": imagePath,
          "rent": rent,
          "dist": distanceFromMarket,
        };

        final bool response =
            await updateRoom(updatedFoodItem, widget.roomModel.id);

        if (response) {
          // Navigator.of(context).pop(); //to remove the alert dialog
          Navigator.of(context).pop(response); //to the pervious page

        } else if (!response) {
          Navigator.of(context).pop();
          SnackBar snackBar = SnackBar(
            duration: Duration(seconds: 2),
            backgroundColor: Colors.red,
            content: Text(
              "Failed to update Room",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
          );
          // ignore: deprecated_member_use
          _scaffoldStateKey.currentState.showSnackBar(snackBar);
        }
      } else if (widget.roomModel == null) {
        final RoomModel room = RoomModel(
          roomName: roomName,
          mno: mno,
          city: city,
          pin: pin,
          address: address,
          imagePath: imagePath,
          rent: rent,
          distanceFromMarket: distanceFromMarket,
        );

        bool value = await addRoom(room);
        if (value) {
          // Navigator.of(context).pop();
          SnackBar snackBar = SnackBar(
            content: Text("Room Sucessfully added"),
          );
          // ignore: deprecated_member_use
          _scaffoldStateKey.currentState.showSnackBar(snackBar);
        } else if (!value) {
          // Navigator.of(context).pop();
          SnackBar snackBar = SnackBar(
            content: Text("Failed to add room "),
          );
          // ignore: deprecated_member_use
          _scaffoldStateKey.currentState.showSnackBar(snackBar);
        }
      }
    }
  }
}
