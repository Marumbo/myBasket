import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_basket/models/itemModel.dart';
import 'package:my_basket/models/priceModel.dart';

class MainBasketService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Get a stream of a list of document
  Stream<List<Item>> itemStream() {
    print("Stream item service ");

    return _db.collection('mainBasket').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Item.fromJson(doc.data())).toList());
  }

  Stream<List<Price>> pricesStream(String itemId, String collectionName) {
    print("Stream price service ");
    print("item id: $itemId");

    String collection = collectionName.toLowerCase() + "Prices";
    print(collection);

    return _db
        .collection('prices')
        .doc(itemId)
        .collection(collection)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Price.fromJson(doc.data())).toList());
  }

  Future<bool> setItemPrice(Item item, Price price) async {
    print(price);

    var options = SetOptions(merge: true);

    String collection = item.itemName + "Prices";

    try {
      await _db
          .collection('prices')
          .doc(item.itemId)
          .collection(collection)
          .doc(price.priceId)
          .set(price.toMap(), options);

      return true;
    } catch (e) {
      print(e.toString());

      return false;
    }
  }
}
