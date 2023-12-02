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
    return 'Profile{_id: $id, name: $name, email: $email, address: $address, email2: $email2, picture: $picture}';
  }
}

Future<String?> getTokenFromLocalStorage() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('token');
}

class Profilemodel {
  final Dio dio = Dio();
  // Future<List<Profile>> getProfile() async {
  //   try {
  //     String? token = await getTokenFromLocalStorage();
  //     if (token != null) {
  //       final response =
  //           await dio.get('https://api.goodapp.vn/api/profile?access_token=');
  //       print('data $token');
  //       return List<Profile>.from(
  //           response.data.map((dt) => Profile.fromJson(dt)));
  //     } else {
  //       print('Token not found in local storage');

  //     }
  //   } catch (e) {
  //     print('Lỗi $e');
  //     throw e;
  //   }
  // }

  //  Future<Map<String, dynamic>> Postdata(List<CartObj> details, dia_chi) async {
  //   List<Map<String, dynamic>> detailsList =
  //       details.map((cartObj) => cartObj.toJson()).toList();

  //   try {
  //     final response = await dio.post(
  //         'https://api.goodapp.vn/api/648deb5c4992aaaa9b8a165d/soapp?access_token=70f4bbed48a5d186e31323b2136f15a7',
  //         data: {'details': detailsList, 'dia_chi': dia_chi});
  //     print('data ${response.data}');
  //     return response.data;
  //   } catch (e) {
  //     print('Lỗi $e');
  //     throw e;
  //   }
  // }
}
