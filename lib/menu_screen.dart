import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ontap3011/danhmucsanpham.dart';
import 'package:ontap3011/product_detail.dart';
import 'package:ontap3011/product_object.dart';

import 'pagedanhmucsanpham/anime.dart';
import 'pagedanhmucsanpham/ngontinh.dart';
import 'pagedanhmucsanpham/tamlinh.dart';
import 'pagedanhmucsanpham/tieuthuyet.dart';
import 'pagedanhmucsanpham/truyencuoi.dart';
import 'pagedanhmucsanpham/truyendangian.dart';

class MenuScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MenuScreenState();
  }
}

class MenuScreenState extends State<MenuScreen> {
  List<ProductObject> lsProducts = [];
  TextEditingController searchController = TextEditingController();
  Dio dio = Dio(); // Khởi tạo đối tượng Dio
  void _searchProducts(String query) async {
    try {
      // Thực hiện yêu cầu GET đến API với tham số tìm kiếm
      Response response = await dio.get(
          'https://api.goodapp.vn/api/648deb5c4992aaaa9b8a165d/product?access_token=flex.public.token',
          queryParameters: {'productname': query});

      if (response.statusCode == 200) {
        // Nếu yêu cầu thành công, giải mã dữ liệu từ response
        List<ProductObject> data = (response.data as List)
            .map((json) => ProductObject.fromJson(json))
            .toList();
        setState(() {
          lsProducts = data;
        });
      } else {
        // Xử lý lỗi nếu yêu cầu không thành công
        print('Lỗi khi tải dữ liệu từ API: ${response.statusMessage}');
      }
    } catch (e) {
      // Xử lý nếu có lỗi xảy ra
      print('Lỗi: $e');
    }
  }

  void _loadDanhSach() async {
    _searchProducts(searchController.text);
    try {
      // Thực hiện yêu cầu GET đến API của bạn
      Response response = await dio.get(
          'https://api.goodapp.vn/api/648deb5c4992aaaa9b8a165d/product?access_token=flex.public.token');

      if (response.statusCode == 200) {
        // Nếu yêu cầu thành công, giải mã dữ liệu từ response
        List<ProductObject> data = (response.data as List)
            .map((json) => ProductObject.fromJson(json))
            .toList();
        setState(() {
          lsProducts = data;
        });
      } else {
        // Xử lý lỗi nếu yêu cầu không thành công
        print('Lỗi khi tải dữ liệu từ API: ${response.statusMessage}');
      }
    } catch (e) {
      // Xử lý nếu có lỗi xảy ra
      print('Lỗi: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    _loadDanhSach();
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => danhmuctieuthuyet()),
                );
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => danhmucngontinh()),
                );
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.book, color: Colors.red), // Thêm icon tại đây
                  SizedBox(width: 10), // Khoảng cách giữa icon và tiêu đề
                  Text('Tâm Linh'),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => danhmuctamlinh()),
                );
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.book, color: Colors.red), // Thêm icon tại đây
                  //SizedBox(width: 10), // Khoảng cách giữa icon và tiêu đề

                  Text('Anime'),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => danhmucanime()),
                );
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
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => danhmuctruyencuoi()),
                );
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.book, color: Colors.red), // Thêm icon tại đây
                  SizedBox(width: 10), // Khoảng cách giữa icon và tiêu đề
                  Text('Truyện Dân Gian'),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => danhmuctruyendangian()),
                );
              },
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
              controller: searchController,
              onChanged: (value) {
                _searchProducts(value);
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Tìm kiếm sản phẩm',
                prefixIcon: Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    setState(() {
                      searchController.clear();
                      _searchProducts('');
                    });
                  },
                ),
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
          DanhMucSanPham(),
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
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          lsProducts[index].productname ?? '',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${lsProducts[index].giamgia} Vnd ',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        Text(
                          '${lsProducts[index].percent} %',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                        Text(
                          '${lsProducts[index].price} VNĐ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFBA1541),
                          ),
                        ),
                      ],
                    ),
                    leading: Hero(
                      tag: 'productimage_${lsProducts[index].productname}',
                      child: Image.network(
                          'https://api.goodapp.vn${lsProducts[index].picture}?access_token=flex.public.token' ??
                              ''),
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
                  ////////////////
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
