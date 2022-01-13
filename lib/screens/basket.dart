import 'package:flutter/material.dart';
import 'package:my_basket/models/itemModel.dart';
import 'package:my_basket/models/priceModel.dart';
import 'package:my_basket/models/userModel.dart';
import 'package:my_basket/providers/mainBasketProvider.dart';
import 'package:my_basket/services/firestoreAuthService.dart';
import 'package:provider/provider.dart';

class Basket extends StatelessWidget {
  //const Basket({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var basketItems = Provider.of<MainBasketProvider>(context);

    var user = Provider.of<User>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text("Basket ${user.lastName}"),
          actions: [
            IconButton(
                icon: Icon(Icons.logout), onPressed: () => signOut(context))
          ],
        ),
        body: StreamBuilder<List<Price>>(
          stream: basketItems.toothpastePrice,
          builder: (context, items) => items.hasData != false
              ? Center(child: CircularProgressIndicator())
              : items.data.length > 0
                  ? ListView.builder(
                      itemCount: items.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                            onTap: () =>
                                Navigator.pushNamed(context, '/itemPage'),
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
                                          "Item Name: ${items.data[index].shopName}"),
                                      SizedBox(width: 10),
                                      Text(
                                          "Price \$ ${items.data[index].price}")
                                    ],
                                  ),
                                  subtitle: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                              "Shop Name: ${items.data[index].shopName}"),
                                          SizedBox(width: 10),
                                          Text("${items.data[index].location}")
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
                      })
                  : Center(
                      child: Text("No Items in main basket!"),
                    ),
        ));
  }
}
