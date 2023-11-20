class ProductObject {
  final int id;
  final String productname;
  final int price;
  final int percent;
  final int giamgia;
  final String description;
  final String picture;
  final String nhacungcap;
  final String nhaxuatban;
  final String tacgia;
  final String hinhthucbia;

  ProductObject(
    this.id,
    this.productname,
    this.price,
    this.description,
    this.giamgia,
    this.picture,
    this.percent,
    this.nhacungcap,
    this.nhaxuatban,
    this.tacgia,
    this.hinhthucbia,
  );

  ProductObject.fromJson(Map<String, dynamic> res)
      : id = res['id'],
        productname = res['productname'],
        price = res['price'],
        percent = res['percent'],
        giamgia = res['giamgia'],
        description = res['description'],
        picture = res['picture'],
        nhacungcap = res['nhacungcap'],
        nhaxuatban = res['nhaxuatban'],
        tacgia = res['tacgia'],
        hinhthucbia = res['hinhthucbia'];

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'productname': productname,
      'giamgia': giamgia,
      'percent': percent,
      'price': price,
      'description': description,
      'picture': picture,
      'nhacungcap': nhacungcap,
      'nhaxuatban': nhaxuatban,
      'tacgia': tacgia,
      'hinhthucbia': hinhthucbia,
    };
  }
}
