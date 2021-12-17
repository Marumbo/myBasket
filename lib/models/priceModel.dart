class Price {
  final String priceId;
  final String itemId;
  final double price;
  final String location;
  final String shopName;
  final int upvote;
  final int downvote;
  final DateTime dateTime;
  final String suggesterUserId;

  Price(
      {this.priceId,
      this.itemId,
      this.price,
      this.location,
      this.shopName,
      this.upvote,
      this.downvote,
      this.dateTime,
      this.suggesterUserId});
}
