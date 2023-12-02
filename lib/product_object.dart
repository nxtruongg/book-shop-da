class ProductObject {
  int? id;
  String? productname;
  int? price;
  int? giamgia;
  int? percent;
  String? nhacungcap;
  String? nhaxuatban;
  String? tacgia;
  String? hinhthucbia;
  String? description;
  String? picture;
  String? ma_nsp;
  String? ten_nsp;

  ProductObject(
      {this.id,
      this.productname,
      this.price,
      this.giamgia,
      this.percent,
      this.nhacungcap,
      this.nhaxuatban,
      this.tacgia,
      this.hinhthucbia,
      this.description,
      this.ma_nsp,
      this.ten_nsp,
      this.picture});

  ProductObject.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productname = json['productname'];
    price = json['price'];
    giamgia = json['giamgia'];
    percent = json['percent'];
    nhacungcap = json['nhacungcap'];
    nhaxuatban = json['nhaxuatban'];
    tacgia = json['tacgia'];
    hinhthucbia = json['hinhthucbia'];
    description = json['description'];
    picture = json['picture'];
    ma_nsp = json['ma_nsp'];
    ten_nsp = json['ma_ten_nsp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['productname'] = this.productname;
    data['price'] = this.price;
    data['giamgia'] = this.giamgia;
    data['percent'] = this.percent;
    data['nhacungcap'] = this.nhacungcap;
    data['nhaxuatban'] = this.nhaxuatban;
    data['tacgia'] = this.tacgia;
    data['hinhthucbia'] = this.hinhthucbia;
    data['description'] = this.description;
    data['picture'] = this.picture;
    data['ma_nsp'] = this.ma_nsp;
    data['ten_nsp'] = this.ten_nsp;
    return data;
  }
}
