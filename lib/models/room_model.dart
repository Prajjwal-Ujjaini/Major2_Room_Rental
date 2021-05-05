class RoomModel {
  final String id;
  final String pin;
  final String city;

  final String title;
  final String imagePath;
  final String category;
  final String description;
  final double price;
  final double discount;
  final double ratings;

  RoomModel(
      {this.id,
      this.pin,
      this.city,
      this.title,
      this.imagePath,
      this.category,
      this.description,
      this.price,
      this.discount,
      this.ratings});
}
