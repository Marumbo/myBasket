import 'package:flutter/material.dart';

class Basket extends StatelessWidget {
  //const Basket({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Basket"),
        ),
        body: ListView.builder(
            itemCount: 15,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/itemPage'),
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
                            Text("Item Name $index"),
                            SizedBox(width: 10),
                            Text("Price \$100")
                          ],
                        ),
                        subtitle: Column(
                          children: [
                            Row(
                              children: [
                                Text("Shop Name"),
                                SizedBox(width: 10),
                                Text("Location")
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
            }));
  }
}