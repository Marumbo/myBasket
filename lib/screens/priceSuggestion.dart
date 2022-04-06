import 'package:flutter/material.dart';
import 'package:my_basket/models/itemModel.dart';
import 'package:my_basket/models/priceModel.dart';
import 'package:my_basket/models/userModel.dart';
import 'package:my_basket/services/mainBasketService.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class PriceSuggestionPage extends StatefulWidget {
  final Item item;
  final User user;

  PriceSuggestionPage({this.item, this.user});

  @override
  _PriceSuggestionPageState createState() => _PriceSuggestionPageState();
}

class _PriceSuggestionPageState extends State<PriceSuggestionPage> {
  String initialLocation = 'Lilongwe';
  final locations = ['Mzuzu', 'Lilongwe', 'Blantyre', 'Zomba'];

  var priceController = TextEditingController();
  var shopNameControler = TextEditingController();
  var moreDetailsController = TextEditingController();

  void setItemPrice() async {
    print("Reached here");

    var priceData = Price(
        priceId: Uuid().v4(),
        price: double.parse(priceController.text),
        location: initialLocation,
        shopName: shopNameControler.text,
        moreLocationDetails: moreDetailsController.text,
        upvote: 0,
        downvote: 0,
        // dateTime: DateTime.now(),
        suggestorUserId: widget.user.userId);

    print(priceData.toMap());

    var setItemPrice =
        await MainBasketService().setItemPrice(widget.item, priceData);

    if (setItemPrice) {
      Navigator.pop(context);
    }
    if (!setItemPrice) {
      var snackBar = SnackBar(
        content: Text("Unable to Submit Price suggestion try later."),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    var item = widget.item;

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          title: Text("Price suggestion for ${item.itemName}"),
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Price"),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: 'Price'),
                controller: priceController,
              ),
              Text("Location"),
              DropdownButton(
                value: initialLocation,
                icon: Icon(Icons.arrow_downward),
                items: locations.map((location) {
                  return DropdownMenuItem(
                      value: location, child: Text(location));
                }).toList(),
                onChanged: (location) {
                  setState(() {
                    initialLocation = location;
                    priceController = priceController;
                    shopNameControler = shopNameControler;
                    moreDetailsController = moreDetailsController;
                  });
                },
              ),
              Text("Shop name"),
              TextField(
                keyboardType: TextInputType.name,
                decoration: InputDecoration(hintText: 'Shop name'),
                controller: shopNameControler,
              ),
              Text("More Details"),
              TextField(
                minLines: 3,
                keyboardType: TextInputType.multiline,
                maxLines: 8,
                decoration: InputDecoration(hintText: 'More Details'),
                controller: moreDetailsController,
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    setItemPrice();
                  },
                  child: Text('Submit'))
            ],
          ),
        )));
  }
}
