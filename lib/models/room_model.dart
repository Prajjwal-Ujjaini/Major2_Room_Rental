class RoomModel {
  final String id;
  final String roomName;
  final String mno;
  final String city;
  final String pin;
  final String address;
  final String imagePath;
  final String rent;
  final String distanceFromMarket;

  RoomModel(
      {this.id,
      this.roomName,
      this.mno,
      this.city,
      this.pin,
      this.address,
      this.imagePath,
      this.rent,
      this.distanceFromMarket});
}
