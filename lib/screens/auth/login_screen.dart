import 'package:bookshop/screens/auth/register.dart';
import 'package:flutter/material.dart';
import 'package:bookshop/screens/main_app.dart';

import 'forget_Sreen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xFFBA1541),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => MainApp(), // Điều hướng đến trang Menu
              ));
            },
          )),
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
            child: const TextField(
              decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person)),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            child: const TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.password),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Đăng nhập'),
                        content: Text('Chúc mừng bạn đã đăng nhập thành công'),
                        actions: [
                          TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('OK'))
                        ],
                      );
                    });
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ForgetPass_Screen(),
                        ));
                  },
                  child: const Text(
                    'Quên mật khẩu',
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
        ],
      ),
    );
  }
}
