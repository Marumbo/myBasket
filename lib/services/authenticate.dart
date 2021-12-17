import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_basket/screens/loginScreen.dart';
import 'package:my_basket/screens/mainNavigationScreen.dart';

// ignore: must_be_immutable
class Authenticate extends StatelessWidget {
//  const Authenticate({ Key? key }) : super(key: key);

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    if (_auth.currentUser != null) {
      return MainNavigation();
    } else {
      return LoginScreen();
    }
  }
}
