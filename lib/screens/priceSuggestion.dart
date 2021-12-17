import 'package:flutter/material.dart';

class PriceSuggestionPage extends StatefulWidget {
  @override
  _PriceSuggestionPageState createState() => _PriceSuggestionPageState();
}

class _PriceSuggestionPageState extends State<PriceSuggestionPage> {
  String initialLocation = 'Lilongwe';
  final locations = ['Mzuzu', 'Lilongwe', 'Blantyre', 'Zomba'];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          title: Text("Price suggestion for Item:"),
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
                  });
                },
              ),
              Text("Shop name"),
              TextField(
                keyboardType: TextInputType.name,
                decoration: InputDecoration(hintText: 'Shop name'),
              ),
              Text("More Details"),
              TextField(
                minLines: 3,
                keyboardType: TextInputType.multiline,
                maxLines: 8,
                decoration: InputDecoration(hintText: 'More Details'),
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(onPressed: () {}, child: Text('Submit'))
            ],
          ),
        )));
  }
}
