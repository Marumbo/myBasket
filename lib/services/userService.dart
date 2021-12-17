import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_basket/models/userModel.dart';

class UserService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<bool> createUser(String userId, String firstName, String lastName,
      String email, String location) async {
    try {
      await _db.collection('users').doc(userId).set({
        "id": userId,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "location": location,
      });

      return true;
    } catch (e) {
      print("User document creation error");
      print(e.toString());
      return false;
    }
  }

  Future<User> getUser(userId) async {
    var json = await _db.collection("users").doc(userId).get();

    return User.fromJson(json.data());
  }

  /// Get a stream of a single document
  Stream<User> userStream(String userId) {
    return _db
        .collection('users')
        .doc(userId)
        .snapshots()
        .map((snap) => User.fromJson(snap.data()));
  }
}
