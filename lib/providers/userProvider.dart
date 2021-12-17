import 'package:flutter/cupertino.dart';
import 'package:my_basket/models/userModel.dart';
import 'package:my_basket/services/userService.dart';

class UserProvider with ChangeNotifier {
  final userService = UserService();

  String _userId;
  String _firstName;
  String _lastName;
  String _email;
  String _location;
}
