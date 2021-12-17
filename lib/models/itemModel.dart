class Item {
  final String itemId;
  final String name;
  final String imageUrl;
  final String description;
  final double bestPrice;
  final String location;
  final String shopName;
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
      this.upvote,
      this.downvote,
      this.dateTime});
}
