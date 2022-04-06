import 'package:flutter/material.dart';
import 'package:my_basket/models/itemModel.dart';
import 'package:my_basket/models/userModel.dart';
import 'package:my_basket/screens/itemPage.dart';
import 'package:my_basket/services/firestoreAuthService.dart';
import 'package:provider/provider.dart';

class Basket extends StatelessWidget {
  //const Basket({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var basketItems =
    //Provider.of<MainBasketProvider>(context).mainBasketService.itemStream();

    var basketItems = Provider.of<List<Item>>(context);
    var user = Provider.of<User>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text("Basket ${user.lastName}"),
          actions: [
            IconButton(
                icon: Icon(Icons.logout), onPressed: () => signOut(context))
          ],
        ),
        body: ListView.builder(
            itemCount: basketItems.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          ItemPage(item: basketItems[index], user: user))),
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
                            Text(" ${basketItems[index].itemName}"),
                            SizedBox(width: 10),
                            Text(" ${basketItems[index].bestPrice.toString()}")
                          ],
                        ),
                        subtitle: Column(
                          children: [
                            Row(
                              children: [
                                Text(" ${basketItems[index].shopName}"),
                                SizedBox(width: 10),
                                Text("${basketItems[index].location}")
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
