import 'package:flutter/material.dart';
import 'package:ontap3011/component/dialog.dart';
import 'package:ontap3011/forget_Sreen.dart';
import 'package:ontap3011/register.dart';
import 'package:ontap3011/trangchu.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

import 'main.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String? emailError;
  String? passwordError;

  Future<void> login() async {
    var headers = {
      'Authorization': 'Basic w6h3ZnNkZjpmc2Rmc2Rm',
    };

    try {
      final String basicAuth = 'Basic ' +
          base64Encode(utf8
              .encode('${emailController.text}:${passwordController.text}'));
      headers['Authorization'] =
          basicAuth; // Thêm thông tin Authorization mới vào headers

      var dio = Dio();
      var response = await dio.request(
        'https://api.goodapp.vn/auth/local',
        options: Options(
          method: 'GET',
          headers: headers,
        ),
      );

      if (response.statusCode == 200) {
        CustomDialog.showMyDialog(
            context, "Thanh cong", "ban da dang nhap thanh cong!");

        print(json.encode(response.data));
      } else {
        print(response.statusMessage);
      }
    } catch (error) {
      if (error is DioError) {
        DioError dioError = error;
        print('Dio Error: ${dioError.message}');

        if (dioError.response != null) {
          print('Status code: ${dioError.response!.statusCode}');
          print('Data: ${dioError.response!.data}');

          CustomDialog.showMyDialog(context, "Error",
              'Dang nhap khong thanh cong ${dioError.response!.data}');
          // print('Headers: ${dioError.response!.headers}');
        }
      }
      print('Error: $error');
      // Xử lý lỗi không mong muốn
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFBA1541),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => Menu(),
            ));
          },
        ),
        title: Text('Đăng Nhập'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "images/logo.png",
            height: 200.0,
            width: 200.0,
          ),
          Container(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ));
                  },
                  child: const Text(
                    'Đăng Nhập',
                    style: TextStyle(
                      color: Color(
                          0xFFBA1541), // Đổi màu chữ thành mã màu "ba1541"
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Register_Screen(),
                      ),
                    );
                  },
                  child: const Text(
                    'Đăng ký',
                    style: TextStyle(
                      color: Color(
                          0xFFBA1541), // Đổi màu chữ thành mã màu "ba1541"
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            child: TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color(0xFFBA1541)), // Đặt màu sắc khi ô được chọn
                ),
                prefixIcon: Icon(Icons.email),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            child: TextField(
              obscureText: true,
              controller: passwordController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color(0xFFBA1541)), // Đặt màu sắc khi ô được chọn
                ),
                prefixIcon: Icon(Icons.password),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            child: ElevatedButton(
              onPressed: () {
                print("Đăng nhập");
                login();
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Color(0xFFBA1541)), // Đổi màu nút
              ),
              child: const Text('Đăng nhập'),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Bạn quên tài khoản?',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ForgetPass_Screen(),
                      ),
                    );
                  },
                  child: const Text(
                    'Quên Mật khẩu',
                    style: TextStyle(
                      color: Color(
                          0xFFBA1541), // Đổi màu chữ thành mã màu "ba1541"
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
