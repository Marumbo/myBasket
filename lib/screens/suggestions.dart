import 'package:flutter/material.dart';
import 'package:my_basket/models/userModel.dart';
import 'package:provider/provider.dart';

class Suggestions extends StatefulWidget {
  //const Suggestions({Key key}) : super(key: key);

  @override
  State<Suggestions> createState() => _SuggestionsState();
}

class _SuggestionsState extends State<Suggestions> {
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text("Suggestions ${user.lastName}"),
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Help us make the app better!"),
              TextField(
                keyboardType: TextInputType.name,
                decoration: InputDecoration(hintText: 'Email address'),
              ),
              Text("Suggestion"),
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
