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

// class OrderHistoryPage extends StatelessWidget {
//   final List<Order> order;

//   OrderHistoryPage({required this.order});


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView.builder(
//         itemCount: order.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text('Đơn hàng ${order[index].orderId}'),
//             subtitle: Text('Ngày đặt: ${order[index].orderDate}'),
//             trailing: Text('Tổng cộng: ${order[index].orderTotal}'),
//             onTap: () {
//               // Chuyển đến trang chi tiết đơn hàng khi nhấp vào
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => OrderDetailPage(order: order[index]),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: ListView.builder(
  //       itemCount: order.length,
  //       itemBuilder: (context, index) {
  //         return ListTile(
  //           title: Text('Đơn hàng ${order[index].orderId}'),
  //           subtitle: Text('Ngày đặt: ${order[index].orderDate}'),
  //           trailing: Text('Tổng cộng: ${order[index].orderTotal}'),
  //           onTap: () {
  //             // Chuyển đến trang chi tiết đơn hàng khi nhấp vào
  //             // Navigator.push(
  //             //   context,
  //             //   MaterialPageRoute(
  //             //     builder: (context) => OrderDetailPage(order: order[index]),
  //             //   ),
  //             // );
  //           },
  //         );
  //       },
  //     ),
  //   );
  // }

