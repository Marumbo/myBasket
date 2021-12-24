class Price {
  final String priceId;
  final double price;
  final String location;
  final String shopName;
  final String moreLocationDetails;
  final int upvote;
  final int downvote;
  final DateTime dateTime;
  final String suggestorUserId;

  Price(
      {this.priceId,
      this.price,
      this.location,
      this.shopName,
      this.moreLocationDetails,
      this.upvote,
      this.downvote,
      this.dateTime,
      this.suggestorUserId});

  Map toMap() {
    return {
      'priceId': priceId,
      'price': price,
      'location': location,
      'moreLocationDetails': moreLocationDetails,
      'shopName': shopName,
      'upVotes': upvote,
      'downVotes': downvote,
      'dateTime': dateTime,
      'suggestorUserId': suggestorUserId
    };
  }

  factory Price.fromJson(Map<String, dynamic> json) {
    return Price(
        priceId: json['priceId'] ?? "",
        price: int.parse(json['price']) ?? 0,
        location: json['location'] ?? "",
        moreLocationDetails: json['moreLocationDetails'] ?? "",
        shopName: json['shopName'] ?? "",
        upvote: int.parse(json['upVotes']) ?? 0,
        downvote: int.parse(json['downVotes']) ?? 0,
        dateTime: DateTime.parse(json['dateTime']) ?? DateTime.now());
  }
}
