import 'package:dio/dio.dart';

class CartObj {
  late final String _id;
  final String id_sp;
  final String ten_sp;
  final int gia_ban;
  final int sl;
  final String image;

  CartObj(
      {required String id,
      required this.id_sp,
      required this.ten_sp,
      required this.gia_ban,
      this.sl = 0,
      this.image = 'images/logo.png'}) {
    _id = id;
  }

  factory CartObj.fromJson(Map<String, dynamic> json) {
    return CartObj(
      id: json['_id'],
      id_sp: json['id_sp'] ?? '',
      ten_sp: json['ten_sp'] ?? '',
      gia_ban: json['gia_ban'] ?? 0.0,
      sl: json['sl'] ?? 0,
      image: json['image'] ?? 'images/logo.png',
    );
  }
  @override
  String toString() {
    return 'CartObj{_id:$_id,id_sp: $id_sp, ten_sp: $ten_sp, gia_ban: $gia_ban, sl: $sl, image: $image}';
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': _id,
      'id_sp': id_sp,
      'ten_sp': ten_sp,
      'gia_ban': gia_ban,
      'sl': sl,
      'image': image,
      // Thêm các trường khác nếu có
    };
  }
}

class CartModels {
  final Dio dio = Dio();

  Future<List<CartObj>> getCart() async {
    try {
      final response = await dio.get(
          'https://api.goodapp.vn/api/648deb5c4992aaaa9b8a165d/cartapp?access_token=70f4bbed48a5d186e31323b2136f15a7');
      print('data ${response.data}');
      return List<CartObj>.from(
          response.data.map((dt) => CartObj.fromJson(dt)));
    } catch (e) {
      print('Lỗi $e');
      throw e;
    }
  }

  Future<bool> deleteItemCart(CartObj item) async {
    try {
      print(item);
      final response = await dio.delete(
          'https://api.goodapp.vn/api/648deb5c4992aaaa9b8a165d/cartapp/${item._id}?access_token=70f4bbed48a5d186e31323b2136f15a7');
      return true;
    } catch (e) {
      throw e;
    }
  }
}
