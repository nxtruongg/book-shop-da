import 'package:dio/dio.dart';
import 'package:ontap3011/models/cartmodels.dart';
import 'package:intl/intl.dart';
final now = DateTime.now();
class So {
  late final String _id;
  final String so_ct;
  final String ma_kh;
  final String ten_kh;
  final List<CartObj> details;
  final int tong_tien;
  final String trang_thai;
  final String ten_trang_thai;
  final String dia_chi;
  final DateTime date_created;
  final int tien_hang;
  final int tien_ck;

  So(
      {required String id,
        this.so_ct = '',
       this.ma_kh= '',
       this.ten_kh ='',
      required this.details,
      this.tong_tien = 0,
      this.trang_thai = '',
        this.ten_trang_thai = '',
      this.dia_chi = '',
      required this.date_created,
      this.tien_hang =0,
        this.tien_ck = 0
      }) {
    _id = id;
  }

  factory So.fromJson(Map<String, dynamic> json) {
    return So(
      id: json['_id'],
      so_ct:json['so_ct']??'',
      ma_kh: json['ma_kh'] ?? '',
      ten_kh: json['ten_kh'] ?? '',
      details: json['details'] ?? [],
      tong_tien: json['tong_tien'] ?? 0,
      trang_thai: json['trang_thai'] ?? '',
        ten_trang_thai: json['ten_trang_thai'] ?? '',
      dia_chi: json['dia_chi'] ?? '',
        date_created: json['date_created'] ?? DateTime.now(),
      tien_hang: json['tien_hang']??0,
      tien_ck: json['tien_ck']??0
    );
  }
  @override
  String toString() {
    return 'CartObj{_id:$_id,so_ct:$so_ct,ma_kh: $ma_kh, ten_kh: $ten_kh, details: $details, tong_tien: $tong_tien,ten_trang_thai: $ten_trang_thai, trang_thai: $trang_thai,dia_chi :$dia_chi,date_created :$date_created,tien_hang:$tien_hang,tien_ck:$tien_ck}';
  }
}

class SoModels {
  final Dio dio = Dio();
  Future<List<So>> getOrder() async {
    try {
      final response = await dio.get(
          'https://api.goodapp.vn/api/648deb5c4992aaaa9b8a165d/soapp?access_token=70f4bbed48a5d186e31323b2136f15a7');
      return List<So>.from(
          response.data.map((dt) => So.fromJson(dt)));
    } catch (e) {
      print('Lỗi $e');
      throw e;
    }
  }

  Future<Map<String, dynamic>> Postdata(List<CartObj> details, dia_chi,tien_hang,tien_ck,tong_tien) async {
    List<Map<String, dynamic>> detailsList =
        details.map((cartObj) => cartObj.toJson()).toList();
    List<String> idList = detailsList.map((product) => product["_id"].toString()).toList();

    try {
      final response = await dio.post(
          'https://api.goodapp.vn/api/648deb5c4992aaaa9b8a165d/soapp?access_token=70f4bbed48a5d186e31323b2136f15a7',
          data: {'details': detailsList, 'dia_chi': dia_chi,
            'tien_hang':tien_hang??0,
            'tien_ck':tien_ck??0,
            'tong_tien':tong_tien??0,
            'trang_thai':'1',
          });
  for(var id in idList){
    await dio.delete('https://api.goodapp.vn/api/648deb5c4992aaaa9b8a165d/cartapp/${id}?access_token=70f4bbed48a5d186e31323b2136f15a7');
  }
      return response.data;
    } catch (e) {
      print('Lỗi $e');
      throw e;
    }
  }
}
