import 'package:flutter/material.dart';

class ItemPage extends StatefulWidget {
  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          title: Text("Item Name"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                      height: height * 0.8,
                      child: Center(
                          child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Add Suggested Price:"),
                          TextField(
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(labelText: 'Name'),
                          ),
                          TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(labelText: 'Age'),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          ElevatedButton(
                              onPressed: () {}, child: Text('Submit'))
                        ],
                      )));
                });
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
          ListView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
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
                              ),
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
                    ));
              })
        ])));
  }
}
