class UserDetailModel {
  String uid;
  final String userId;
  final String username;
  final String firstName;
  final String lastName;
  String email;
  final String phoneNumber;
  final String userType;

  UserDetailModel(
      {this.uid,
      this.userId,
      this.username,
      this.firstName,
      this.lastName,
      this.email,
      this.phoneNumber,
      this.userType});

  set imageUrl(String imageUrl) {}

  set userEmail(String userEmail) {}

  set name(String name) {}
}
