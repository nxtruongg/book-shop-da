 import 'package:flutter/material.dart';
import 'package:bookshop/screens/product/product_detail.dart';
import 'package:bookshop/models/product_object.dart';
import 'package:bookshop/provider/product_provider.dart';

import '../auth/login_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFBA1541),
        title: Text('Trang chủ'),
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
          IconButton(
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              );
            },
          )
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
