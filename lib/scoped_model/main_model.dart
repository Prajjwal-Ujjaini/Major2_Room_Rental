import 'package:major2_room_rental/scoped_model/room_scope_model.dart';
import 'package:major2_room_rental/scoped_model/user_scope_model.dart';
import 'package:scoped_model/scoped_model.dart';

class MainModel extends Model with UserScopedModdel, Room {
  void fetchAll() {
    fetchRooms();
    fetchUserInfo();
  }
}
