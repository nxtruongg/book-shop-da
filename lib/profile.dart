import 'package:flutter/material.dart';

class ProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFBA1541),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit), // Icon để chuyển sang trang sửa thông tin
            onPressed: () {
              // Điều hướng đến trang sửa thông tin
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditProfileScreen()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // CircleAvatar(
            //   backgroundImage: AssetImage(
            //       'assets/avatadefault.jpg'),
            //   radius: 50,
            // ),
            SizedBox(height: 20),
            Text('Phan Minh Trí',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('Email: phanminhtrimtp@gmail.com',
                style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text('Địa Chỉ: Địa chỉ của bạn', style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text('Địa Chỉ: Địa chỉ của bạn', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

class EditProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFBA1541),
        title: Text('Sửa thông tin cá nhân'),
      ),
      body: Center(
        child: Text('Nội dung sửa thông tin cá nhân ở đây'),
      ),
    );
  }
}
