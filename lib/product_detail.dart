import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
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
    //Lấy kích thước của màn hình
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFBA1541),
          title: Text('Chi Tiết Sản Phẩm'),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: size.height * 0.25),
              height: size.height * 0.75,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 162, 68, 68),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 250,
                    height: 190,
                    child: Hero(
                      tag: 'productimage_${this.widget.product.productname}',
                      child: Image.network(this.widget.product.picture),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AnimatedTextKit(
                        animatedTexts: [
                          TyperAnimatedText(
                            this.widget.product.productname,
                            textStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '${this.widget.product.price} VNĐ',
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 185, 180),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Text(
                    this.widget.product.description,
                    softWrap: true,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: size.height * 0.75,
                right: 0, // Đặt right thành 0 để căn giữa
              ),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 146, 43, 6)),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(10), // Tùy chỉnh padding cho nút
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.shopping_cart), // Biểu tượng giỏ hàng (icon)
                        SizedBox(
                            width:
                                10), // Khoảng cách giữa biểu tượng và văn bản
                        Text('Đặt Ngay'),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
