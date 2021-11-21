import 'package:flutter/material.dart';

class Basket extends StatelessWidget {
  //const Basket({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Basket"),
      ),
      body: Center(
        child: Text("Basket list"),
      ),
    );
  }
}
