import 'package:flutter/material.dart';
import 'package:my_basket/models/userModel.dart';
import 'package:my_basket/providers/mainBasketProvider.dart';
import 'package:my_basket/screens/itemPage.dart';
import 'package:my_basket/services/mainBasketService.dart';
import 'package:provider/provider.dart';

class MyBasket extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);

    var favorites = MainBasketService().favoriteList();

    if (user == null) {
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (user.userId.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Column(children: [
            Center(child: Text("Welcome")),
            Center(
              child: Text("This is your Basket!"),
            )
          ]),
        ),
        body: Center(
          child: Text("No User Available!"),
        ),
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: Column(children: [
            Center(child: Text("Welcome ${user.firstName}")),
            Center(
              child: Text("This is your Basket!"),
            )
          ]),
        ),
        body: FutureBuilder(
            future: favorites,
            initialData: [],
            builder: (context, favoritesData) {
              if (favoritesData.hasError) {
                return Text(favoritesData.error);
              }
              if (favoritesData.connectionState == ConnectionState.none ||
                  favoritesData.hasData == null) {
                return Center(child: Text("No favorites"));
              }

              if (favoritesData.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              return ListView.builder(
                  itemCount: favoritesData.data.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => ItemPage(
                                    item: favoritesData.data[index],
                                    user: user))),
                        child: Padding(
                            padding: EdgeInsetsDirectional.all(5),
                            child: ListTile(
                              leading: Image(
                                  image: AssetImage(
                                      'assets/images/groceriesPaperBag.jpg'),
                                  width: 100,
                                  height: 200),
                              title: Row(
                                children: [
                                  Text(
                                      " ${favoritesData.data[index].itemName}"),
                                  SizedBox(width: 10),
                                  Text(
                                      " ${favoritesData.data[index].bestPrice.toString()}")
                                ],
                              ),
                              subtitle: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                          " ${favoritesData.data[index].shopName}"),
                                      SizedBox(width: 10),
                                      Text(
                                          "${favoritesData.data[index].location}")
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                          onPressed: () => {},
                                          icon: Icon(Icons.arrow_upward)),
                                      IconButton(
                                          onPressed: () => {},
                                          icon: Icon(Icons.arrow_downward)),
                                    ],
                                  )
                                ],
                              ),
                            )));
                  });
            }));
  }
}
