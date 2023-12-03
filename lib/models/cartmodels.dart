import 'dart:convert';
import 'package:dio/dio.dart';

class CartObj {
  late final String _id;
  final String id_sp;
  final String ten_sp;
  final int gia_ban;
  final int sl;
  final String image;
  final int tien_ck;
  CartObj(
      {required String id,
      required this.id_sp,
      required this.ten_sp,
      required this.gia_ban,
      this.sl = 0,
      this.image = 'images/logo.png',this.tien_ck = 0,}) {
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
      tien_ck: json['tien_ck']??0
    );
  }
  @override
  String toString() {
    return 'CartObj{_id:$_id,id_sp: $id_sp, ten_sp: $ten_sp, gia_ban: $gia_ban, sl: $sl, image: $image,tien_ck:$tien_ck}';
  }
  Map<String, dynamic> toJson() {
    return {
      '_id': _id,
      'id_sp': id_sp,
      'ten_sp': ten_sp,
      'gia_ban': gia_ban,
      'sl': sl,
      'image': image,
      'tien_ck':tien_ck,
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
  Future<void> addItemtoCart(int? id,int? price,int? ck) async {
    try {
      Map<String, dynamic> condition = {
        'id_sp':id,
      };
      Map<String, dynamic> data ={};
      final rs = await dio.get(
          'https://api.goodapp.vn/api/648deb5c4992aaaa9b8a165d/cartapp?access_token=70f4bbed48a5d186e31323b2136f15a7&q=${jsonEncode(condition)}');
      print(rs.data);
      if(rs.data.length >0){
        data['sl'] =  (rs.data![0]['sl']??0) + 1;
        print('data $data');
        final rs_update = await dio.put('https://api.goodapp.vn/api/648deb5c4992aaaa9b8a165d/cartapp/${rs.data[0]['_id']}?access_token=70f4bbed48a5d186e31323b2136f15a7',data:json.encode(data));
      print('put data ${rs_update.data}');
      } else {
        data['id_sp'] = id;
        data['sl']= 1;
        data['gia_ban'] =price??0;
        data['tien_ck'] = ck??0;
        final rs_post = await dio.post('https://api.goodapp.vn/api/648deb5c4992aaaa9b8a165d/cartapp?access_token=70f4bbed48a5d186e31323b2136f15a7',data: json.encode(data));
        print('post data ${rs_post.data}');
      }
    }catch(e){
    throw Exception(e);
    }
  }
  Future<void> UpdateItemCart(CartObj item,int so_luong) async{
    try{
      Map<String, dynamic> data ={
        'sl':so_luong
      };
      final rs = await dio.put('https://api.goodapp.vn/api/648deb5c4992aaaa9b8a165d/cartapp/${item._id}?access_token=70f4bbed48a5d186e31323b2136f15a7',data:json.encode(data));
      print(rs.data);
    }catch(e){
      throw Exception(e);
    }
  }
}
