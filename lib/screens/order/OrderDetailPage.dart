import 'package:flutter/material.dart';

class Order {
  final String orderId;
  final String orderDate;
  final String orderTotal;

  Order(
      {required this.orderId,
      required this.orderDate,
      required this.orderTotal});
}

class OrderDetailPage extends StatelessWidget {
  final Order order;

  OrderDetailPage({required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFBA1541),
        title: Text('Chi tiết đơn hàng ${order.orderId}'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Ngày đặt: ${order.orderDate}'),
            Text('Tổng cộng: ${order.orderTotal}'),
            // Thêm các thông tin chi tiết khác nếu cần
          ],
        ),
      ),
    );
  }
}
