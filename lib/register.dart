import 'package:flutter/material.dart';
import 'package:ontap3011/login_screen.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'component/dialog.dart';
import 'menu_screen.dart';

class Register_Screen extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<Register_Screen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repasswordController = TextEditingController();
  String? emailError;
  String? phoneError;
  String? nameError;
  String? passwordError;
  String? repasswordError;

  bool isNumeric(String? value) {
    if (value == null || value.isEmpty) {
      return false;
    }
    return double.tryParse(value) != null;
  }

  Future<void> register() async {
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'uid=uid%3A9f6a3210b2eb711bfe254dbafd4492b5c7de217f'
    };

    var data = json.encode({
      "email": phoneController.text,
      "id_app": "648deb5c4992aaaa9b8a165d",
      "group_id": "64b8be54b8426f15351e5837",
      "name": nameController.text,
      "email2": emailController.text,
      "password": passwordController.text,
      "rePassword": repasswordController.text,
    });
    var dio = Dio();

    try {
      var response = await dio.post(
        'https://api.goodapp.vn/signup',
        options: Options(
          method: 'POST',
          headers: headers,
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        CustomDialog.showMyDialog(
            context, "Thành công", "bạn đã đăng ký thành công!");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ),
        );
        print('Thanhcong ${json.encode(response.data)}');
      } else {
        print('Registration failed. Status code: ${response.statusCode}');
        print('Error message: ${response.statusMessage}');
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

      print('Error: ${error}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFBA1541),
        title: Text('Đăng Ký'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            child: TextFormField(
              controller: emailController,
              //   keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFBA1541),
                  ),
                ),
                prefixIcon: Icon(Icons.email),
                errorText: emailError,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            child: TextFormField(
              controller: phoneController,
              // keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Phone',
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFBA1541),
                  ),
                ),
                prefixIcon: Icon(Icons.phone),
                errorText: phoneError,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            child: TextFormField(
              controller: nameController,
              //keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFBA1541),
                  ),
                ),
                prefixIcon: Icon(Icons.person),
                errorText: nameError,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            child: TextFormField(
              controller: passwordController,
              // keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFBA1541),
                  ),
                ),
                prefixIcon: Icon(Icons.password),
                errorText: passwordError,
              ),

              obscureText: true,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            child: TextFormField(
              controller: repasswordController,
              //keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Reset Password',
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFBA1541),
                  ),
                ),
                prefixIcon: Icon(Icons.password),
                errorText: repasswordError,
              ),
              obscureText: true,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            child: ElevatedButton(
              onPressed: () {
                print("Đăng ký");
                register();

                if (_formKey.currentState != null &&
                    _formKey.currentState!.validate()) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MenuScreen()),
                  );
                }
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Color(0xFFBA1541)), // Đổi màu nút
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0), // Đặt góc tròn
                  ),
                ),
                minimumSize: MaterialStateProperty.all(
                    Size(200, 40)), // Đặt kích thước tối thiểu
              ),
              child: const Text('Đăng Ký'),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Bạn Đã có tài khoản?',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'Đăng nhập ngay',
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
