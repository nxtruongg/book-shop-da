import 'package:flutter/material.dart';
import 'detaillxacnhan.dart';
import 'detailxuky.dart'; // Đảm bảo rằng tên tệp import đúng

// class xuly extends StatelessWidget {
//   final List<Order> orders;

//   // Thêm dấu chấm phẩy sau khai báo biến
//   xuly({required this.orders});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView.builder(
//         itemCount: orders.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text('Đơn hàng ${orders[index].orderId}'),
//             subtitle: Text('Ngày đặt: ${orders[index].orderDate}'),
//             trailing: Text('Tổng cộng: ${orders[index].orderTotal}'),
//             onTap: () {
//               // Chuyển đến trang chi tiết đơn hàng khi nhấp vào
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => OrderHistoryPage(order: orders[index]), // Sửa tên lớp
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
