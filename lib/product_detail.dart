import 'package:flutter/material.dart';
import 'package:ontap3011/cart.dart';
import 'package:ontap3011/product_object.dart';

class ProductDetail extends StatefulWidget {
  ProductObject product;
  ProductDetail({Key? key, required this.product}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ProductDetailState();
  }
}

class ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFBA1541),
        title: Text('Chi Tiết Sản Phẩm'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 250,
                      height: 350,
                      child: Hero(
                        tag: 'productimage_${this.widget.product.productname}',
                        child: Image.network(
                            'https://api.goodapp.vn${this.widget.product.picture}?access_token=flex.public.token' ??
                                ''),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                      height: 100,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Nhà Cung Cấp',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          'Nhà Xuất Bản ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          'Tác Giả',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          'Hình Thức bìa ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 40,
                      height: 100,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 0,
                        ),
                        Text(
                          this.widget.product.nhacungcap ?? '',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        Text(
                          this.widget.product.nhaxuatban ?? '',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        Text(
                          this.widget.product.tacgia ?? '',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        Text(
                          this.widget.product.hinhthucbia ?? '',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  this.widget.product.productname ?? '',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    decoration: TextDecoration.underline,
                  ),
                ),
                Text(
                  'Giảm giá ${this.widget.product.percent}%',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  '${this.widget.product.giamgia} VNĐ',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                Text(
                  '${this.widget.product.price} VNĐ',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                //    ElevatedButton(
                //   onPressed: () {
                //     Navigator.push(context,
                //         MaterialPageRoute(builder: (context) => PayMentPage()));
                //     //  nút thanh toán
                //   },
                //   child: Text('Thanh toán'),
                //   style: ElevatedButton.styleFrom(
                //     primary: Color(0xFFBA1541),
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(18.0),
                //     ),
                //     padding:
                //         EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                //   ),
                // ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Cart()));
                    //  nút thanh toán
                  },
                  child: Text('Mua Ngay'),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFBA1541),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Thêm vào giỏ hàng'),
                        content: Text('Đã thêm vào giỏ hàng'),
                        actions: [
                          TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('OK'))
                        ],
                      );
                    });
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_cart),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Thêm Vào Giỏ Hàng'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
