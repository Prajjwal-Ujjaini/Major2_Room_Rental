import 'package:flutter/material.dart';
import 'package:major2_room_rental/Constants/image_url.dart';
import 'package:major2_room_rental/models/room_model.dart';
import 'package:major2_room_rental/scoped_model/main_model.dart';
import 'package:major2_room_rental/widgets/button_with_name.dart';
import 'package:scoped_model/scoped_model.dart';

class AddRooms extends StatefulWidget {
  final RoomModel roomModel;

  const AddRooms({this.roomModel});

  @override
  _AddRoomsState createState() => _AddRoomsState();
}

class _AddRoomsState extends State<AddRooms> {
  String title;
  String category;
  String description;
  String price;
  String discount;

  GlobalKey<FormState> _foodItemFormKey = GlobalKey();
  GlobalKey<ScaffoldState> _scaffoldStateKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () {
          Navigator.of(context).pop(false);
          return Future.value(false);
        },
        child: Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            centerTitle: true,
            // backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(Icons.close, color: Colors.black),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            title: Text(
              widget.roomModel != null ? "Update Food Item" : "Add Food Item",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          key: _scaffoldStateKey,
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              // width: MediaQuery.of(context).size.width,
              // height: MediaQuery.of(context).size.height,
              child: Form(
                key: _foodItemFormKey,
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 170.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(backgroundIamgeUrl),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    _builderTextFormField("Food Title"),
                    _builderTextFormField("Category"),
                    _builderTextFormField("Description", maxLine: 5),
                    _builderTextFormField("Price"),
                    _builderTextFormField("Discount"),
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
                                  ? "Update Food Item"
                                  : "Add Food Item"),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onSubmit(Function addRoom, Function updateRoom) async {
    if (_foodItemFormKey.currentState.validate()) {
      _foodItemFormKey.currentState.save();

      if (widget.roomModel != null) {
        Map<String, dynamic> updatedFoodItem = {
          "title": title,
          "category": category,
          "description": description,
          "price": double.parse(price),
          "discount": discount != null ? double.parse(discount) : 0.0,
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
              "Failed to update Food Item",
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
          title: title,
          category: category,
          description: description,
          price: double.parse(price),
          discount: double.parse(discount),
        );

        bool value = await addRoom(room);
        if (value) {
          Navigator.of(context).pop();
          SnackBar snackBar = SnackBar(
            content: Text("Food Item Sucessfully added"),
          );
          // ignore: deprecated_member_use
          _scaffoldStateKey.currentState.showSnackBar(snackBar);
        } else if (!value) {
          Navigator.of(context).pop();
          SnackBar snackBar = SnackBar(
            content: Text("Failed to add food items "),
          );
          // ignore: deprecated_member_use
          _scaffoldStateKey.currentState.showSnackBar(snackBar);
        }
      }
    }
  }

  Widget _builderTextFormField(String hint, {int maxLine = 1}) {
    return TextFormField(
      initialValue: widget.roomModel != null && hint == "Food Title"
          ? widget.roomModel.title
          : widget.roomModel != null && hint == "Description"
              ? widget.roomModel.description
              : widget.roomModel != null && hint == "Category"
                  ? widget.roomModel.category
                  : widget.roomModel != null && hint == "Price"
                      ? widget.roomModel.price.toString()
                      : widget.roomModel != null && hint == "Discount"
                          ? widget.roomModel.description.toString()
                          : hint,
      decoration: InputDecoration(hintText: "$hint"),
      maxLines: maxLine,
      keyboardType: hint == "Price" || hint == "Discount"
          ? TextInputType.number
          : TextInputType.text,
      validator: (String value) {
        if (value.isEmpty && hint == "Food Title") {
          return "the Food title is required";
        }
        if (value.isEmpty && hint == "Description") {
          return "the Food Description is required";
        }
        if (value.isEmpty && hint == "Category") {
          return "the Food Category is required";
        }
        if (value.isEmpty && hint == "Price") {
          return "the Food Price is required";
        }
        return "Some Error";
      },
      onSaved: (String value) {
        if (hint == "Food Title") {
          title = value;
        }
        if (hint == "Category") {
          category = value;
        }
        if (hint == "Description") {
          description = value;
        }
        if (hint == "Price") {
          price = value;
        }
        if (hint == "Discount") {
          discount = value;
        }
      },
    );
  }
}
