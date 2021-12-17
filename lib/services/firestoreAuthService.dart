import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_basket/services/userService.dart';

Future<bool> register(String firstName, String lastName, String location,
    String email, String password) async {
  FirebaseAuth _auth = FirebaseAuth.instance;
  print("reg method");
  try {
    print("reg method try");

    await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    await UserService().createUser(
        _auth.currentUser.uid, firstName, lastName, email, location);

    return true;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
    return false;
  } catch (e) {
    print("register error");
    print(e.toString());
    return false;
  }
}

Future<bool> signIn(String email, String password) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    print("sigin in method");
    await _auth.signInWithEmailAndPassword(email: email, password: password);

    return true;
  } catch (e) {
    print("Signin error");
    print(e.toString());

    return false;
  }
}

Future signOut(BuildContext context) async {
  FirebaseAuth _auth = FirebaseAuth.instance;
  try {
    await _auth.signOut();

    Navigator.of(context)
        .pushNamedAndRemoveUntil('/authenticate', (route) => false);
  } catch (e) {
    print("error in signing out");
    print(e.toString());
  }
}
