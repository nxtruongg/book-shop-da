import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:ontap3011/component/dialog.dart';
import 'package:ontap3011/models/cartmodels.dart';
import 'package:ontap3011/models/so_models.dart';

class Order {
  final List<CartObj> products;

  Order({
    required this.products,
  });
}

class Product {
  final String name;
  final double price;
  final String image;
  Product({required this.name, required this.price, required this.image});
}

class OderPage extends StatefulWidget {
  final List<CartObj> cart;
  const OderPage({super.key, required this.cart});

  @override
  State<OderPage> createState() => _OderPageState();
}

class _OderPageState extends State<OderPage> {
  final TextEditingController diachi = TextEditingController();
  final SoModels soModels = SoModels();
  void Submit(details, String dia_chi) async {
    await soModels.Postdata(details, dia_chi);
    CustomDialog.showMyDialog(context, "Thanh cong", "Tao don hang thanh cong");
  }

  void showSuccessSnackBar(String message) {
    final snackBar = SnackBar(
      content: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0),
        child: Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 18.0, color: Colors.white), // Thay đổi màu văn bản
        ),
      ),
      duration: Duration(seconds: 3),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.green, // Thay đổi màu nền
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    Order sampleOrder = Order(products: widget.cart);
    DateTime currentDate = DateTime.now();
    String formattedDate =
        "${currentDate.day}/${currentDate.month}/${currentDate.year}";

    return Scaffold(
      appBar: AppBar(
        title: Text('Chi tiết đặt hàng'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Ngày đặt: ${formattedDate}'),
            //Text('Ngày Mua:'),
            Text('Địa chỉ:'),

            TextField(
              controller: diachi,
              decoration: InputDecoration(
                hintText: 'Nhập địa chỉ của bạn',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            Text('Sản Phẩm:'),
            for (var product in sampleOrder.products)
              ProductItem(product: product),
            SizedBox(height: 16.0),
            SizedBox(height: 16.0),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Tổng Tiền: '),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Submit(sampleOrder.products, diachi.text);
                  },
                  child: Text('Xác Nhận Thanh Toán'),
                ),
              )
            ],
          )),
    );
  }
}

// class Oder extends StatelessWidget {
//   const Oder({super.key, required this.order});
//   final Order order;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Chi tiết đặt hàng'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 Text('Ngày Mua:'),
//                 TextField(
//                   decoration: InputDecoration(
//                     hintText: 'Nhập vào đây',
//                   ),
//                 )
//               ],
//             ),
//             Text('Ngày Mua: ${order.date}'),
//             Text('Địa Chỉ: ${order.address}'),
//             Text('Trạng Thái: ${order.status}'),
//             SizedBox(height: 16.0),
//             Text('Sản Phẩm:'),
//             for (var product in order.products) ProductItem(product: product),
//             SizedBox(height: 16.0),
//             SizedBox(height: 16.0),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomAppBar(
//           shape: CircularNotchedRectangle(),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               Text('Phương Thức Thanh Toán: ${order.paymentMethod}'),
//               Text('Tổng Tiền: ${order.totalAmount}'),
//               Center(
//                 child: ElevatedButton(
//                   onPressed: () {},
//                   child: Text('Xác Nhận Thanh Toán'),
//                 ),
//               )
//             ],
//           )

//           ),
//     );
//   }
// }

class ProductItem extends StatelessWidget {
  final CartObj product;

  ProductItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Image.asset(
          product.image,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
        title: Text(product.ten_sp),
        subtitle: Text('Giá: ${product.gia_ban}'),
        trailing: Text('Số lượng: 1'),
      ),
    );
  }
}
