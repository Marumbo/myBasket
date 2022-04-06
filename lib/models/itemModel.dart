class Item {
  final String itemId;
  final String itemName;
  final String imageUrl;
  final String description;
  final double bestPrice;
  final String location;
  final String shopName;
  final String moreLocationDetails;
  final int upvote;
  final int downvote;
  final DateTime dateTime;

  Item(
      {this.itemId,
      this.itemName,
      this.imageUrl,
      this.description,
      this.bestPrice,
      this.location,
      this.shopName,
      this.moreLocationDetails,
      this.upvote,
      this.downvote,
      this.dateTime});

  Map<String, dynamic> toMap() {
    return {
      'itemId': itemId,
      'itemName': itemName,
      'description': description,
      'price': bestPrice,
      'location': location,
      'moreLocationDetails': moreLocationDetails,
      'shopName': shopName,
      'upVotes': upvote,
      'downVotes': downvote,
      'dateTime': dateTime
    };
  }

  factory Item.fromJson(Map<dynamic, dynamic> json) {
    return Item(
      itemId: json['itemId'] ?? "",
      itemName: json['itemName'] ?? "",
      description: json['description'] ?? "",
      bestPrice: (json['price'] as num).toDouble() ?? 0.0,
      location: json['location'] ?? "",
      moreLocationDetails: json['moreLocationDetails'] ?? "",
      shopName: json['shopName'] ?? "",
      upvote: int.parse(json['upVotes'].toString()) ?? 0,
      downvote: int.parse(json['downVotes'].toString()) ?? 0,
      //dateTime: DateTime.parse(json['dateTime']) ?? DateTime.now()
    );
  }
}
