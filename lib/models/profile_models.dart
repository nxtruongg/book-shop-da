import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile {
  late final String id;
  final String name;
  final String email;
  final String picture;
  final String address;
  final String email2;

  Profile({
    required String id,
    required this.name,
    required this.picture,
    required this.email,
    required this.address,
    required this.email2,
  }) {
    id = id;
  }

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      id: json['id'],
      picture: json['picture'] ?? '',
      address: json['address'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      email2: json['email2'] ?? '',
    );
  }

  @override
  String toString() {
    return 'Profile{_id: $id, name: $name, email: $email, address: $address, email2: $email2, email2: $email2}';
  }
}

Future<void> saveToken(String token) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('token', token);
}

Future<String?> getToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('token');
}

class Profile2 {
  final Dio dio = Dio();

  Future<List<Profile>> getprofile() async {
    try {
      String? token = await getToken();
      if (token != null) {
        // Sử dụng Options để thêm header vào yêu cầu HTTP
        Options options = Options(headers: {'Authorization': 'Bearer $token'});

        final response = await dio.get(
          'https://api.goodapp.vn/api/profile?access_token=',
          options: options,
        );
        print('data ${response.data}');
        return List<Profile>.from(
          response.data.map((dt) => Profile.fromJson(dt)),
        );
      } else {
        // Xử lý trường hợp người dùng chưa đăng nhập
        print('Người dùng chưa đăng nhập');
        return [];
      }
    } catch (e) {
      print('Lỗi $e');
      throw e;
    }
  }
}
