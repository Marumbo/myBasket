import 'package:flutter/material.dart';

class Suggestions extends StatelessWidget {
  //const Suggestions({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Suggestions")),
      body: Center(
        child: Text("Suggestion forms"),
      ),
    );
  }
}
