import 'package:flutter/material.dart';
import 'package:ontap3011/payment.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  List<Product> cartItems = [
    Product(name: 'Sản phẩm 1', price: 20.0, image: 'images/logo.png'),
    Product(name: 'Sản phẩm 2', price: 30.0, image: 'images/logo.png')
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Giỏ Hàng'),
        backgroundColor: Color(0xFFBA1541),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          return CartItem(
            product: cartItems[index],
            onIncrease: () {
              setState(() {
                // Tăng số lượng sản phẩm
              });
            },
            onDecrease: () {
              setState(() {
                // Giảm số lượng sản phẩm
              });
            },
            onRemove: () {
              setState(() {
                // Xóa sản phẩm khỏi giỏ hàng
                cartItems.removeAt(index);
              });
            },
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Tổng tiền: ${calculateTotalPrice()}'),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PayMentPage()));
                  //  nút thanh toán
                },
                child: Text('Thanh toán'),
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
      ),
    );
  }

  double calculateTotalPrice() {
    return cartItems.fold(0.0, (sum, item) => sum + item.price);
  }
}

class Product {
  final String name;
  final double price;
  final String image;

  Product({required this.name, required this.price, required this.image});
}

class CartItem extends StatelessWidget {
  final Product product;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;
  final VoidCallback onRemove;

  CartItem({
    required this.product,
    required this.onIncrease,
    required this.onDecrease,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        leading: Image.asset(
          product.image,
          width: 56.0,
          height: 56.0,
          fit: BoxFit.cover,
        ),
        title: Text(product.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Giá: ${product.price}'),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: onDecrease,
                ),
                Text('1'),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: onIncrease,
                ),
              ],
            ),
          ],
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: onRemove,
        ),
      ),
    );
  }
}
