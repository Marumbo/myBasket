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

  Map<String, dynamic> toMap() {
    return {
      'priceId': priceId,
      'price': price,
      'location': location,
      'moreLocationDetails': moreLocationDetails,
      'shopName': shopName,
      'upVotes': upvote,
      'downVotes': downvote,
      //  'dateTime': dateTime,
      'suggestorUserId': suggestorUserId
    };
  }

  factory Price.fromJson(Map<String, dynamic> json) {
    // print(json);

    return Price(
      priceId: json['priceId'].toString() ?? "",
      price: (json['price'] as num).toDouble() ?? 0.0,
      location: json['location'] ?? "",
      moreLocationDetails: json['moreLocationDetails'] ?? "",
      shopName: json['shopName'] ?? "",
      upvote: (json['upVotes'] as num) ?? 0,
      downvote: (json['downVotes'] as num) ?? 0,
      //dateTime: DateTime.parse(json['dateTime']) ?? DateTime.now()
    );
  }
}
