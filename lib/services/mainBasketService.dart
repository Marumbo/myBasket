import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_basket/models/itemModel.dart';
import 'package:my_basket/models/priceModel.dart';

class MainBasketService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  // Get a stream of a list of document
  Stream<List<Item>> itemStream() {
    print("Stream item service ");

    return _db.collection('mainBasket').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Item.fromJson(doc.data())).toList());
  }

  Stream<List<Price>> pricesStream() {
    print("Stream price service ");

    return _db
        .collection('prices')
        .doc('5SQooHJmV7Op2vIZRXVe')
        .collection('toothpastePrices')
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Price.fromJson(doc.data())).toList());
  }
}
