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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoTable('Ngày đặt', order.orderDate),
            _buildInfoTable('Tổng cộng', order.orderTotal),
            // Thêm các thông tin chi tiết khác nếu cần
          ],
        ),
      ),
    );
  }

  Widget _buildInfoTable(String title, String value) {
    return Table(
      columnWidths: {0: FlexColumnWidth(1.0), 1: FlexColumnWidth(2.0)},
      children: [
        TableRow(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                value,
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
