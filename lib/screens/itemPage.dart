import 'package:flutter/material.dart';
import 'package:my_basket/models/itemModel.dart';
import 'package:my_basket/models/priceModel.dart';
import 'package:my_basket/models/userModel.dart';
import 'package:my_basket/screens/priceSuggestion.dart';
import 'package:my_basket/services/mainBasketService.dart';

class ItemPage extends StatefulWidget {
  final Item item;
  final User user;

  ItemPage({this.item, this.user});

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  @override
  Widget build(BuildContext context) {
    var item = widget.item;

    var user = widget.user;

    // var priceProvider = Provider.of<PriceProvider>(context);

    //var priceList = priceProvider.getPriceList(widget.item.itemId, widget.item.itemName);
    var priceSub = MainBasketService().pricesStream(item.itemId, item.itemName);

    var faveIds = MainBasketService().favoriteList();

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.item.itemName),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Navigator.pushNamed(context, '/priceSuggestion');
            Navigator.of(context).push(new MaterialPageRoute<Null>(
                builder: (BuildContext context) {
                  return new PriceSuggestionPage(
                    item: item,
                    user: user,
                  );
                },
                fullscreenDialog: true));
          },
          child: Icon(Icons.add),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          Container(
              child: Image(
            image: AssetImage('assets/images/groceriesPaperBag.jpg'),
            height: 100,
            width: 200,
          )),
          SizedBox(
            height: 10,
          ),
          Text("Description of Item:"),
          SizedBox(
            height: 5,
          ),
          Text("This items description."),
          SizedBox(
            height: 20,
          ),
          Text("Latest Price"),
          Padding(
              padding: EdgeInsets.all(8),
              child: Card(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Text("Price"),
                            SizedBox(
                              width: 5,
                            ),
                            Text("500"),
                          ],
                        ),
                        Row(
                          children: [
                            Text("Location:"),
                            SizedBox(
                              width: 5,
                            ),
                            Text("Lilongwe"),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Text("Shop name:"),
                            SizedBox(
                              width: 5,
                            ),
                            Text("Chipiku"),
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
                    Padding(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("More details:"),
                            Row(
                              children: [
                                Flexible(
                                    child: Text(
                                  "More details on shop location the Malawian way!",
                                ))
                              ],
                            ),
                          ],
                        ))
                  ],
                ),
              )),
          Text("Other Suggested Prices:"),
          StreamBuilder<List<Price>>(
              stream: priceSub,
              builder: (context, priceList) {
                var priceData = priceList.data;

                if (priceList.hasError) {
                  print("Error ${priceList.error}");

                  // to handle better
                  return Container(
                    child: Text("Error ${priceList.error}"),
                  );
                }

                if (!priceList.hasData || priceList.data.isEmpty) {
                  print("No date in price list");
                  return Padding(
                      padding: EdgeInsets.all(12),
                      child: Center(
                          child: Container(
                        child: Text("No price data for commodity"),
                      )));
                }

                return ListView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemCount: priceList.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                          padding: EdgeInsets.all(8),
                          child: Card(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      children: [
                                        Text("Price"),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(priceData[index].price.toString()),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("Location:"),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(priceData[index].location),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      children: [
                                        Text("Shop name:"),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(priceData[index].shopName),
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
                                    ),
                                  ],
                                ),
                                Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("More details:"),
                                        Row(
                                          children: [
                                            Flexible(
                                                child: Text(
                                              priceData[index]
                                                  .moreLocationDetails,
                                            ))
                                          ],
                                        ),
                                      ],
                                    ))
                              ],
                            ),
                          ));
                    });
              }),
        ])));
  }
}
