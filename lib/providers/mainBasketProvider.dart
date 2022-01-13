import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_basket/models/itemModel.dart';
import 'package:my_basket/models/priceModel.dart';
import 'package:my_basket/services/mainBasketService.dart';

class MainBasketProvider with ChangeNotifier {
  final mainBasketService = MainBasketService();

  Stream<List<Item>> get mainBasket => mainBasketService.itemStream();

  Stream<List<Price>> get toothpastePrice => mainBasketService.pricesStream();
}
