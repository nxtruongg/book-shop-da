import 'package:flutter/material.dart';

import 'OrderDetailPage.dart';

class OrderHistoryPage extends StatelessWidget {
  final List<Order> orders = [
    Order(orderId: '12345', orderDate: '01/01/2023', orderTotal: '\50.000'),
    Order(orderId: '67890', orderDate: '02/01/2023', orderTotal: '\75.000'),
    // Add more orders as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFBA1541),
        title: Text('Lịch sử đơn hàng'),
      ),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Đơn hàng ${orders[index].orderId}'),
            subtitle: Text('Ngày đặt: ${orders[index].orderDate}'),
            trailing: Text('Tổng cộng: ${orders[index].orderTotal}'),
            onTap: () {
              // Chuyển đến trang chi tiết đơn hàng khi nhấp vào
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OrderDetailPage(order: orders[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
