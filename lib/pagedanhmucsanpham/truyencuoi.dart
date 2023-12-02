import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ontap3011/product_detail.dart';
import 'package:ontap3011/product_object.dart';

class danhmuctruyencuoi extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MenuScreenState();
  }
}

class MenuScreenState extends State<danhmuctruyencuoi> {
  List<ProductObject> lsProducts = [];
  Dio dio = Dio(); // Khởi tạo đối tượng Dio

  void _loadDanhSach() async {
    try {
      // Thực hiện yêu cầu GET đến API của bạn
      Response response = await dio.get(
          'https://api.goodapp.vn/api/648deb5c4992aaaa9b8a165d/product?access_token=flex.public.token');

      if (response.statusCode == 200) {
        // Nếu yêu cầu thành công, giải mã dữ liệu từ response
        List<ProductObject> data = (response.data as List)
            .map((json) => ProductObject.fromJson(json))
            .toList();
        List<ProductObject> filteredProducts =
            data.where((product) => product.ma_nsp == "5").toList();
        setState(() {
          lsProducts = filteredProducts;
        });
        //lay id sp =1
        // setState(() {
        //   lsProducts = data;
        // });
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Container(
          //   margin: EdgeInsets.only(left: 5),
          //   height: 50,
          //   width: 200,
          //   child: TextFormField(
          //     decoration: InputDecoration(
          //       border: InputBorder.none,
          //       hintText: ' tim kiem san pham',
          //       prefixIcon: Icon(Icons.search), // them icon cho tim kiếm
          //     ),
          //   ),
          // ),
          Text(
            'Truyện Cười',
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
              childAspectRatio: 4,
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
