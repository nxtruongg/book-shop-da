import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ForgetPass_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFBA1541),
        title: Text('Quên Mật Khẩu'),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          padding: const EdgeInsets.all(15),
          child: const TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.email),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(15),
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('Gửi Yêu Cầu'),
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Color(0xFFBA1541)), // Đổi màu nút
            ),
          ),
        ),
      ]),
    );
  }
}
