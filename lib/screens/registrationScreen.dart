import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  //const Registration({ Key? key }) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Registration Screen")),
      body: SingleChildScrollView(
        child: TextField(),
      ),
    );
  }
}
