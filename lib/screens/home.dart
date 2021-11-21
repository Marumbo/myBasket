import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
            child: Column(children: [Text("My Basket"), Text("Welcome! ")])),
      ),
      body: Center(
        child: Text("Home page"),
      ),
    );
  }
}
