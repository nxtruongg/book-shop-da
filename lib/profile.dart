import 'package:flutter/material.dart';
import 'package:ontap3011/models/profile_models.dart';

import 'editprofile.dart';
import 'login_screen.dart';
import 'menudonhang.dart';

class ProfileScreen extends StatelessWidget {
  final Profilemodel profilemodel = Profilemodel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFBA1541),
        title: Text('Thông tin cá nhân'),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
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
              FutureBuilder(
                future: profilemodel.GetProfile(),
                builder: (context, snapshot) {
                  print(snapshot);
                  if (snapshot.hasData) {
                    final data = snapshot.data;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        Text(
                          '${data!['name'] ?? 'Chưa có tên'}',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 174, 32, 22),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Email:  ${data['email2'] ?? 'Chưa có'}',
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Số điện thoại: ${data!['email'] ?? 'Không có'}',
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Địa chỉ:',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          '${data!['eddress'] ?? 'Chung cư 212 Nguyễn Trãi, Thành phố HCM'}',
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    );
                  } else {
                    return Text('lỗi');
                  }
                },
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
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                margin: EdgeInsets.only(top: 10.0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Đăng Xuất'),
                          content: Text('Bạn có chắc muốn đăng xuất!!!'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context); // Đóng dialog
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => LoginScreen()));
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  icon: Icon(
                    Icons.exit_to_app,
                    size: 24.0,
                  ),
                  label: Text(
                    'Đăng xuất',
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
