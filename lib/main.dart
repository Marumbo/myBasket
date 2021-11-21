import 'package:flutter/material.dart';
import 'package:my_basket/screens/aboutUs.dart';
import 'package:my_basket/screens/basket.dart';
import 'package:my_basket/screens/home.dart';
import 'package:my_basket/screens/suggestions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    print(currentIndex);

    final screens = [Home(), Basket(), Suggestions(), AboutUs()];

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        body: IndexedStack(
          children: screens,
          index: currentIndex,
        ),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex,
            onTap: (index) => setState(() => currentIndex = index),
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), label: "My Basket"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_basket), label: "The Basket"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.email), label: "Suggestions"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.people), label: "About Us")
            ]),
      ),
    );
  }
}
