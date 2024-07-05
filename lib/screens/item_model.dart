class ItemModel {
  String name = "";
  String price = "";
  String series = "";
  String image = "";
  int rating = 0;

  ItemModel(
      {required this.name,
      required this.price,
      required this.series,
      required this.image,
      required this.rating});

  static final itemList = [
    ItemModel(
        name: "Silver Laptop",
        price: "\u20B9 99999",
        series: "X90 Series",
        image: "assets/images/ic_pc.png",
        rating: 4),
    ItemModel(
        name: "Smart Watch",
        price: "\u20B9 2999",
        series: "K9 Series",
        image: "assets/images/ic_watch.png",
        rating: 4),
    ItemModel(
        name: "Smart Phone",
        price: "\u20B9 14599",
        series: "FX Series",
        image: "assets/images/ic_mobile.png",
        rating: 3),
    ItemModel(
        name: "Head Phone",
        price: "\u20B9 599",
        series: "LK Series",
        image: "assets/images/ic_headphone.png",
        rating: 5)
  ];
}
