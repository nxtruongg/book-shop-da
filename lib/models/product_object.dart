class ProductObject {
  final int id;
  final String productname;
  final int price;
  final String description;
  final String picture;
  ProductObject(
      this.id, this.productname, this.price, this.description, this.picture);

  ProductObject.fromJson(Map<String, dynamic> res)
      : id = res['id'],
        productname = res['productname'],
        price = res['price'],
        description = res['description'],
        picture = res['picture'];

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'productname': productname,
      'price': price,
      'description': description,
      'picture': picture,
    };
  }
}
