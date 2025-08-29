class ProductModel {
  String image;
  String name;
  int price;
  int reviewCount;
  double reviewRating;
  bool cart;

  ProductModel(
    this.image,
    this.name,
    this.price,
    this.reviewCount,
    this.reviewRating,
    this.cart,
  );

  @override
  String toString() {
    return 'ProductModel{image: $image, name: $name, price: $price, reviewCount: $reviewCount, reviewRating: $reviewRating, cart: $cart}';
  }

}
