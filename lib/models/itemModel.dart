class Item {
  final String itemId;
  final String name;
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
      this.name,
      this.imageUrl,
      this.description,
      this.bestPrice,
      this.location,
      this.shopName,
      this.moreLocationDetails,
      this.upvote,
      this.downvote,
      this.dateTime});

  Map toMap() {
    return {
      'itemId': itemId,
      'itemName': name,
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

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
        itemId: json['itemId'] ?? "",
        name: json['itemName'] ?? "",
        description: json['description'] ?? "",
        bestPrice: int.parse(json['price']) ?? 0,
        location: json['location'] ?? "",
        moreLocationDetails: json['moreLocationDetails'] ?? "",
        shopName: json['shopName'] ?? "",
        upvote: int.parse(json['upVotes']) ?? 0,
        downvote: int.parse(json['downVotes']) ?? 0,
        dateTime: DateTime.parse(json['dateTime']) ?? DateTime.now());
  }
}
