import 'package:my_basket/models/itemModel.dart';

class FavoriteItems {
  final String userId;
  final List<Item> items; //items vs item id's

  //what other data will change? pricing?

  FavoriteItems({this.userId, this.items});
}
