import 'dart:convert';
import 'package:major2_room_rental/Constants/constants.dart';
import 'package:major2_room_rental/models/room_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;

class Room extends Model {
  List<RoomModel> _rooms = [];
  List<RoomModel> _cityRooms = [];

  bool _isLoading = false;

  bool get isLoading {
    return _isLoading;
  }

  List<RoomModel> get rooms {
    return List.from(_rooms);
  }

  int get roomLength {
    return _rooms.length;
  }

  List<RoomModel> get cityRooms {
    return List.from(_cityRooms);
  }

  int get cityRoomLength {
    return _cityRooms.length;
  }

  Future<bool> addRoom(RoomModel roomModel) async {
    _isLoading = true;
    notifyListeners();

    try {
      final Map<String, dynamic> roomData = {
        "roomName": roomModel.roomName,
        "mno": roomModel.mno,
        "city": roomModel.city.toLowerCase(),
        "pin": roomModel.pin,
        "address": roomModel.address,
        "imagePath": roomModel.imagePath,
        "rent": roomModel.rent,
        "distanceFromMarket": roomModel.distanceFromMarket,
      };

      final http.Response response = await http.post(
          Uri.parse("$AppUrlMajor/rooms.json"),
          body: json.encode(roomData));

      final Map<String, dynamic> responseData = json.decode(response.body);

      RoomModel roomWithID = RoomModel(
        id: responseData["name"],
        roomName: roomModel.roomName,
        mno: roomModel.mno,
        city: roomModel.city,
        pin: roomModel.pin,
        address: roomModel.address,
        imagePath: roomModel.imagePath,
        rent: roomModel.rent,
        distanceFromMarket: roomModel.distanceFromMarket,
      );

      _rooms.add(roomWithID);
      _isLoading = false;
      notifyListeners();
      // fetchFoods();
      return Future.value(true);
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      return Future.value(false);
      // print("Connection error :$e");
    }
  }

  Future<bool> fetchRooms() async {
    _isLoading = true;
    notifyListeners();
    try {
      final http.Response response =
          await http.get(Uri.parse("$AppUrlMajor/rooms.json"));

      final Map<String, dynamic> fetchedData = json.decode(response.body);
      // print(fetchedData);

      final List<RoomModel> roomItems = [];

      fetchedData.forEach((String id, dynamic roomData) {
        RoomModel roomItem = RoomModel(
          id: id,
          roomName: roomData["roomName"],
          mno: roomData["mno"],
          city: roomData["city"],
          pin: roomData["pin"],
          address: roomData["address"],
          imagePath: roomData["imagePath"],
          rent: roomData["rent"],
          distanceFromMarket: roomData["distanceFromMarket"],
        );

        roomItems.add(roomItem);
      });

      _rooms = roomItems;
      _isLoading = false;
      notifyListeners();
      return Future.value(true);
    } catch (error) {
      print("The erreo ==$error");
      _isLoading = false;
      notifyListeners();
      return Future.value(false);
    }
  }

  Future<bool> updateRoom(Map<String, dynamic> roomData, String roomId) async {
    _isLoading = true;
    notifyListeners();

    RoomModel theroom = getRoomItemById(roomId);
    int roomIndex = _rooms.indexOf(theroom);

    try {
      await http.put(Uri.parse("$AppUrlMajor/rooms/${roomId}.json"),
          body: json.encode(roomData));

      RoomModel updateRoomItem = RoomModel(
        id: roomId,
        roomName: roomData["roomName"],
        mno: roomData["mno"],
        city: roomData["city"],
        pin: roomData["pin"],
        address: roomData["address"],
        imagePath: roomData["imagePath"],
        rent: roomData["rent"],
        distanceFromMarket: roomData["distanceFromMarket"],
      );

      _rooms[roomIndex] = updateRoomItem;

      _isLoading = false;
      notifyListeners();
      return Future.value(true);
    } catch (error) {
      _isLoading = false;
      notifyListeners();
      return Future.value(false);
    }
  }

  Future<bool> deleteRoom(String roomId) async {
    _isLoading = true;
    notifyListeners();

    try {
      final http.Response response =
          await http.delete(Uri.parse("$AppUrlMajor/rooms/${roomId}.json"));

      print(response);

      //deleting item from the list of food item
      _rooms.removeWhere((RoomModel roomModel) => roomModel.id == roomId);

      _isLoading = false;
      notifyListeners();
      return Future.value(true);
    } catch (error) {
      _isLoading = false;
      notifyListeners();
      return Future.value(false);
    }
  }

  RoomModel getRoomItemById(String roomId) {
    RoomModel room;
    for (int i = 0; i < _rooms.length; i++) {
      if (_rooms[i].id == roomId) {
        room = _rooms[i];
      }
    }
    return room;
  }

//   RoomModel getRoomByCity(String city) {
//     RoomModel room;
//     for (int i = 0; i < _rooms.length; i++) {
//       if (_rooms[i].city == city) {
//         print(
//             "\n room== \n name == ${_rooms[i].roomName} \t city == ${_rooms[i].city}\taddress == ${_rooms[i].address} \t  distance == ${_rooms[i].distanceFromMarket}");
//         room = _rooms[i];

//         print(""" \nafter room=_room[i]
// \n room ===  \n
//  name == ${room.roomName} \t city == ${room.city}\t
//  address == ${room.address} \t  pin== ${room.pin} distance == ${room.distanceFromMarket}""");
//       }
//     }

//     return room;
//   }

  Future<bool> getCityRooms(String city) async {
    print("\n starting of getCityRooms function   \t city name ==$city \n");
    _cityRooms.clear();

    _isLoading = true;
    notifyListeners();
    try {
      List<RoomModel> roomItems = [];

      for (int i = 0; i < _rooms.length; i++) {
        print(
            "\ncondition _rooms[i].city == city  == ${_rooms[i].city == city}");
        if (_rooms[i].city == city) {
          print(
              "\n room== \t name == ${_rooms[i].roomName} \t city == ${_rooms[i].city}\taddress == ${_rooms[i].address} ");

          RoomModel room = _rooms[i];

          print(
              " \nafter room=_room[i] \n room ===  \t  name == ${room.roomName} \t city == ${room.city}\t  address == ${room.address} ");

          roomItems.add(room);
          print("\n\n roomItems length == ${roomItems}");
        } else {
          print("\n Condition Fails \n");
          print("\n\n roomItems length == ${roomItems}");
        }
      }

      _cityRooms = roomItems;

      print(
          "\n\n at the end \t _cityRooms length ==${_cityRooms.length}\n  _cityRoom ===${_cityRooms}\n\n");
      _isLoading = false;
      notifyListeners();
      return Future.value(true);
    } catch (error) {
      print("The erreo ==$error");
      _isLoading = false;
      notifyListeners();
      return Future.value(false);
    }
  }

  // Future<bool> fetchRoomsAllCities() async {
  //   _isLoading = true;
  //   notifyListeners();
  //   try {
  //     for (int i = 0; i < citiesName.length; i++) {
  //       List<RoomModel> roomItems = [];

  //       for (int j = 0; j < _rooms.length; j++) {
  //         if (citiesName[i] == _rooms[j].city) {
  //           RoomModel room = _rooms[i];

  //           roomItems.add(room);
  //         } else {
  //           print("\n Condition Fails \n");
  //         }
  //       }
  //     }

  //     _rooms = roomItems;

  //     _isLoading = false;
  //     notifyListeners();
  //     return Future.value(true);
  //   } catch (error) {
  //     print("The erreo ==$error");
  //     _isLoading = false;
  //     notifyListeners();
  //     return Future.value(false);
  //   }
  // }
}
