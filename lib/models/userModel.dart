class User {
  final String userId;
  final String firstName;
  final String lastName;
  final String email;
  final String location;

  User({this.userId, this.firstName, this.lastName, this.email, this.location});

  Map toMap() {
    return {
      'id': userId,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'location': location,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['userId'] ?? "",
      firstName: json['firstName'] ?? "",
      lastName: json['lastName'] ?? "",
      email: json['email'] ?? "",
      location: json['location'] ?? "",
    );
  }
}
