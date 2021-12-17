import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:my_basket/screens/loginScreen.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:my_basket/services/authenticate.dart';
import 'package:my_basket/services/userService.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Authenticate(),
    );
  }
}
