import 'package:flutter/material.dart';

import 'dangxuly.dart';
import 'detaillxacnhan.dart';

class menudonhang extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 5, // Số lượng tab
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFFBA1541),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context)
                    .pop(); // Điều này sẽ đóng trang hiện tại và quay lại trang trước đó.
              },
            ),
            title: Text('Trạng thái đơn hàng'),
            bottom: TabBar(
              tabs: [
                Tab(text: 'Chờ xác nhận'),
                Tab(text: 'Chờ lấy hàng'),
                Tab(text: 'Chờ giao hàng'),
                Tab(text: 'Đã giao'),
                Tab(text: 'Đã hủy'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              // Nội dung cho tab 'Chờ xác nhận'

              // Nội dung cho tab 'Chờ lấy hàng'
              Center(child: Text('Chờ lấy hàng')),
              // Nội dung cho tab 'Chờ giao hàng'
              Center(child: Text('Chờ giao hàng')),
              // Nội dung cho tab 'Đã giao'

              // Nội dung cho tab 'Đã hủy'
              Center(child: Text('Đã hủy')),
            ],
          ),
        ),
      ),
    );
  }
}
