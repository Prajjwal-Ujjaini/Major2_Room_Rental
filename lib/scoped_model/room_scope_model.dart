import 'dart:convert';
import 'package:major2_room_rental/Constants/constants.dart';
import 'package:major2_room_rental/models/room_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;

class Room extends Model {
  List<RoomModel> _rooms = [];
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

  Future<bool> addRoom(RoomModel roomModel) async {
    _isLoading = true;
    notifyListeners();

    try {
      final Map<String, dynamic> roomData = {
        "title": roomModel.title,
        "description": roomModel.description,
        "category": roomModel.category,
        "price": roomModel.price,
        "discount": roomModel.discount,
      };

      final http.Response response = await http.post(
          Uri.parse("$AppUrlMajor/rooms.json"),
          body: json.encode(roomData));

      final Map<String, dynamic> responseData = json.decode(response.body);

      RoomModel roomWithID = RoomModel(
        id: responseData["name"],
        title: roomModel.title,
        category: roomModel.category,
        description: roomModel.description,
        price: roomModel.price,
        discount: roomModel.discount,
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
      print(fetchedData);

      final List<RoomModel> roomItems = [];

      fetchedData.forEach((String id, dynamic roomData) {
        RoomModel roomItem = RoomModel(
          id: id,
          title: roomData["title"],
          description: roomData["description"],
          category: roomData["category"],
          price: double.parse(roomData["price"].toString()),
          discount: double.parse(roomData["discount"].toString()),
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
        title: roomData["title"],
        description: roomData["description"],
        category: roomData["category"],
        price: double.parse(roomData["price"].toString()),
        discount: double.parse(roomData["discount"].toString()),
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
}
