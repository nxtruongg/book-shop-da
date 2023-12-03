import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

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
    return 'Profile{_id: $id, name: $name, email: $email, address: $address, email2: $email2, picture: $picture}';
  }
}

Future<String?> getTokenFromLocalStorage() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('token');
}

class Profilemodel {
  final Dio dio = Dio();
  Future<Map<String, dynamic>> GetProfile() async {
    String? token = await getTokenFromLocalStorage();
    Map<String, dynamic> tk = jsonDecode(token ?? "");
    print('token ${tk['token']}');
    try {
      final rs = await dio.get(
          'https://api.goodapp.vn/api/profile?access_token=${tk['token']}');
      print('data2r ${rs.data}');
      return rs.data;
    } catch (e) {
      throw Exception('Lỗi $e');
    }
  }

  Future<void> EditProfile(String? name, String? email, String? address) async {
    Map<String, dynamic> data = {
      'name': name,
      'email2': email,
      'address': address,
    };
    try {
      String? token = await getTokenFromLocalStorage();
      Map<String, dynamic> tk = jsonDecode(token ?? "");
      final rs = await dio.post(
          'https://api.goodapp.vn/api/updateprofile?access_token=${tk['token']}',
          data: jsonEncode(data));

      print('Update Profile ${rs.data}');
    } catch (e) {
      if (e is DioError) {
        DioError dioError = e;
        print('Dio Error: ${dioError.message}');

        if (dioError.response != null) {
          print('Status code: ${dioError.response!.statusCode}');
          print('Data: ${dioError.response!.data}');

          print('Headers: ${dioError.response!.headers}');
        }
      }

      throw Exception(e);
    }
  }
}
