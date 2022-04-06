import 'package:flutter/material.dart';
import 'package:my_basket/models/priceModel.dart';
import 'package:my_basket/services/mainBasketService.dart';

class PriceProvider with ChangeNotifier {
  final mainBasketService = MainBasketService();

  Stream<List<Price>> getPriceList(String itemId, String collectionName) {
    return mainBasketService.pricesStream(itemId, collectionName);
  }
}
