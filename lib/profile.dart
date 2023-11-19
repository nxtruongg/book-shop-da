import 'package:flutter/material.dart';

import 'editprofile.dart';
import 'history.dart';
import 'login_screen.dart';
import 'menudonhang.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFBA1541),
        title: Text('Thông tin cá nhân'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              );
            },
          )
        ],
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.transparent,
                child: ClipOval(
                  child: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBbirfM3TZm6EotKRPZw9_KwVdja9LTqlO6g&usqp=CAU',
                    fit: BoxFit.cover,
                    width: 100.0,
                    height: 100.0,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Nguyễn Văn A',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 176, 5, 8),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                'Email: nguyenvana@gmail.com',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                'Số điện thoại: 0123 456 789',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                'Địa chỉ:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Text(
                '123 Đường ABC, Quận XYZ, Thành phố HCM',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                margin: EdgeInsets.only(top: 30.0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => EditProfileScreen()));
                  },
                  icon: Icon(
                    Icons.edit,
                    size: 24.0,
                  ),
                  label: Text(
                    'Chỉnh sửa thông tin',
                    style: TextStyle(fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFBA1541),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                margin: EdgeInsets.only(top: 10.0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => menudonhang()));
                  },
                  icon: Icon(
                    Icons.add_box,
                    size: 24.0,
                  ),
                  label: Text(
                    'Thông tin đơn hàng',
                    style: TextStyle(fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFBA1541),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
