import 'package:dio/dio.dart';
import 'package:ontap3011/models/cartmodels.dart';

class status {
  late final String _id;
  final String ma_kh;
  final String ten_kh;
  final List<CartObj> details;
  final int tong_tien;
  final String trang_thai;
  final String dia_chi;
  final String ngay_mua;

  status(
      {required String id,
      required this.ma_kh,
      required this.ten_kh,
      required this.details,
      this.tong_tien = 0,
      this.trang_thai = '',
      this.dia_chi = '',
      this.ngay_mua = ''}) {
    _id = id;
  }

  factory status.fromJson(Map<String, dynamic> jstatusn) {
    return status(
      id: jstatusn['_id'],
      ma_kh: jstatusn['ma_kh'] ?? '',
      ten_kh: jstatusn['ten_kh'] ?? '',
      details: jstatusn['details'] ?? [],
      tong_tien: jstatusn['tong_tien'] ?? 0,
      trang_thai: jstatusn['trang_thai'] ?? '',
      dia_chi: jstatusn['dia_chi'] ?? '',
      ngay_mua: jstatusn['ngay_mua'] ?? '',
    );
  }
  @override
  String toString() {
    return 'CartObj{_id:$_id,ma_kh: $ma_kh, ten_kh: $ten_kh, details: $details, tong_tien: $tong_tien, trang_thai: $trang_thai,dia_chi :$dia_chi,ngay_mua :$ngay_mua}';
  }
}

class statusModels {
  final Dio dio = Dio();

  Future<List<status>> getProfile() async {
    try {
      final response = await dio.get(
          'https://api.goodapp.vn/api/648deb5c4992aaaa9b8a165d/soapp?access_token=70f4bbed48a5d186e31323b2136f15a7');
      print('data ${response.data}');
      return List<status>.from(response.data.map((dt) => status.fromJson(dt)));
    } catch (e) {
      print('Lỗi $e');
      throw e;
    }
  }
}
