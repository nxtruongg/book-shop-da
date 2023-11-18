import 'package:flutter/material.dart';
import 'package:ontap3011/danhmucsanpham.dart';
import 'package:ontap3011/product_detail.dart';
import 'package:ontap3011/product_object.dart';
import 'package:ontap3011/product_provider.dart';

class MenuScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MenuScreenState();
  }
}

class MenuScreenState extends State<MenuScreen> {
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
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFFBA1541),
              ),
              child: Text(
                'Danh Mục Sản Phẩm',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.book, color: Colors.red), // Thêm icon tại đây
                  SizedBox(width: 10), // Khoảng cách giữa icon và tiêu đề
                  Text('Tiểu Thuyết'),
                ],
              ),
              onTap: () {
                // Xử lý khi người dùng chọn mục "Tiểu Thuyết"
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.book, color: Colors.red), // Thêm icon tại đây
                  SizedBox(width: 10), // Khoảng cách giữa icon và tiêu đề
                  Text('Ngôn Tình'),
                ],
              ),
              onTap: () {
                // Xử lý khi người dùng chọn mục "Ngôn tình"
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.home, color: Colors.red), // Thêm icon tại đây
                  SizedBox(width: 10), // Khoảng cách giữa icon và tiêu đề
                  Text('Tâm Linh'),
                ],
              ),
              onTap: () {
                // Xử lý khi người dùng chọn mục "Tiểu Thuyết"
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.book, color: Colors.red), // Thêm icon tại đây
                  //SizedBox(width: 10), // Khoảng cách giữa icon và tiêu đề

                  Text('\n Anime'),
                ],
              ),
              onTap: () {
                // Xử lý khi người dùng chọn mục "Tiểu Thuyết"
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.book, color: Colors.red), // Thêm icon tại đây
                  SizedBox(width: 10), // Khoảng cách giữa icon và tiêu đề
                  Text('Truyện Cười'),
                ],
              ),
              onTap: () {},
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.book, color: Colors.red), // Thêm icon tại đây
                  SizedBox(width: 10), // Khoảng cách giữa icon và tiêu đề
                  Text('Truyện Dân Gian'),
                ],
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 5),
            height: 50,
            width: 200,
            child: TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: ' tim kiem san pham',
                prefixIcon: Icon(Icons.search), // them icon cho tim kiếm
              ),
            ),
          ),
          Text(
            'Danh Mục Sản Phẩm',
            style: TextStyle(
              fontSize: 20,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          danhmucsanpham(),
          Text(
            'Sản Phẩm nỗi bật',
            style: TextStyle(
              fontSize: 20,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: GridView.count(
              padding: EdgeInsets.all(5),
              crossAxisCount: 2,
              childAspectRatio: 2,
              children: List.generate(lsProducts.length, (index) {
                return Card(
                  child: ListTile(
                    title: Text(
                      lsProducts[index].productname,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
            ),
          ),
        ],
      ),
    );
  }
}
