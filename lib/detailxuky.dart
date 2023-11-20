import 'package:flutter/material.dart';

class Order {
  final String orderId;
  final String orderDate;
  final String orderTotal;
  final List<OrderItem> items;

  Order({
    required this.orderId,
    required this.orderDate,
    required this.orderTotal,
    required this.items,
  });
}

class OrderItem {
  final String productName;
  final String productImage;

  OrderItem({
    required this.productName,
    required this.productImage,
  });
}

class chitietxuly extends StatelessWidget {
  final Order order;

  chitietxuly({required this.order});

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
            _buildProductList(order.items),
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

  Widget _buildProductList(List<OrderItem> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Text(
            'Sản phẩm trong đơn hàng:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Image.network(
                items[index].productImage,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(items[index].productName),
            );
          },
        ),

        SizedBox(height: 20), // Khoảng cách giữa danh sách sản phẩm và nút
        Center(
          child: ElevatedButton(
            onPressed: () {
              // Xử lý logic khi nút hủy đơn được nhấn
              // Ví dụ: hiển thị hộp thoại xác nhận, gọi hàm hủy đơn, v.v.
            },
            child: Text('Hủy Đơn'),
            style: ElevatedButton.styleFrom(
              primary: Color(0xFFBA1541),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
            ),
          ),
        ),
      ],
    );
  }
}
