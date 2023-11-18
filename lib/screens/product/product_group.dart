import 'package:bookshop/screens/product/product_detail.dart';
import 'package:flutter/material.dart';

import '../../models/product_object.dart';
import '../../provider/product_provider.dart';
import '../auth/login_screen.dart';
class ProductGroup extends StatefulWidget {
  const ProductGroup({super.key});

  @override
  State<ProductGroup> createState() => _ProductGroupState();
}

class _ProductGroupState extends State<ProductGroup> {
  List<ProductObject> lsProducts = [];
  void _LoadDanhSach() async {
    final data = await ProductProvider.getAllContacts();
    setState(() {});
    lsProducts = data;
  }
  @override
  void initState() {
    // TODO: implemet initState
    super.initState();
    _LoadDanhSach();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFBA1541),
        title: Text('Danh mục sản phẩm'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          PopupMenuButton<String>(
            itemBuilder: (BuildContext context) {
              return <PopupMenuEntry<String>>[
                PopupMenuItem(
                  value: 'theloai1',
                  child: Text('Thể loại 1'),
                ),
                PopupMenuItem(
                  value: 'theloai2',
                  child: Text('Thể loại 2'),
                ),
                PopupMenuItem(
                  value: 'theloai3',
                  child: Text('Thể loại 3'),
                ),
              ];
            },
            onSelected: (String choice) {
              // Xử lý khi chọn một thể loại từ menu
            },
          ),
          // IconButton(
          //   icon: Icon(
          //     Icons.exit_to_app,
          //     color: Colors.white,
          //   ),
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => LoginScreen(),
          //       ),
          //     );
          //   },
          // )
        ],
      ),
      body: ListView.builder(
          padding: EdgeInsets.all(5),
          itemCount: lsProducts.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(
                  lsProducts[index].productname,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // leading: Image.network(lsProducts[index].url),
                leading: Hero(
                  tag: 'productimage_${lsProducts[index].productname}',
                  child: Image.network(lsProducts[index].picture),
                ),
                subtitle: Text(
                  '${lsProducts[index].price} VNĐ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFBA1541),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ProductDetail(product: lsProducts[index]),
                    ),
                  );
                },
              ),
            );
          }),
    );
  }
}
