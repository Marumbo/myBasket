import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_basket/models/itemModel.dart';
import 'package:my_basket/models/priceModel.dart';
import 'package:my_basket/providers/mainBasketProvider.dart';
import 'package:my_basket/providers/priceProvider.dart';
import 'package:my_basket/screens/aboutUs.dart';
import 'package:my_basket/screens/basket.dart';
import 'package:my_basket/screens/itemPage.dart';
import 'package:my_basket/screens/myBasket.dart';
import 'package:my_basket/screens/priceSuggestion.dart';
import 'package:my_basket/screens/suggestions.dart';
import 'package:my_basket/services/authenticate.dart';
import 'package:my_basket/services/mainBasketService.dart';
import 'package:my_basket/services/userService.dart';
import 'package:provider/provider.dart';

class MainNavigation extends StatefulWidget {
  //const mainNavigation({ Key? key }) : super(key: key);

  @override
  _MainNavigationState createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var userService = UserService();
  var mainBasketService = MainBasketService();

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    print(currentIndex);

    final screens = [MyBasket(), Basket(), Suggestions(), AboutUs()];

    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: MultiProvider(
          providers: [
            StreamProvider(
                create: (context) => mainBasketService.itemStream(),
                initialData: null),
            ChangeNotifierProvider(
              create: (context) => MainBasketProvider(),
            ),
            ChangeNotifierProvider(
              create: (context) => PriceProvider(),
            ),
            StreamProvider(
                create: (context) =>
                    userService.userStream(_auth.currentUser.uid),
                initialData: null),
          ],
          child: Scaffold(
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
        ),
        initialRoute: '/',
        routes: {
          // When navigating to the "/" route, build the FirstScreen widget.
          '/mybasket': (context) => MyBasket(),
          // When navigating to the "/second" route, build the SecondScreen widget.
          '/basket': (context) => Basket(),
          '/itemPage': (context) => ItemPage(),
          '/suggestions': (context) => Suggestions(),
          '/aboutUs': (context) => AboutUs(),
          '/priceSuggestion': (context) => PriceSuggestionPage(),
          '/authenticate': (context) => Authenticate()
        });
  }
}
