import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:ontap3011/models/cartmodels.dart';
import 'package:ontap3011/payment.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartModels cartmodels = CartModels();
  late List<CartObj> cartItems = [];

  @override
  void initState() {
    super.initState();
    loadCarts();
  }

  Future<void> loadCarts() async {
    try {
      cartItems = await cartmodels.getCart();
      setState(() {});
    } catch (e) {}
  }

  Future<void> deleteItemCart(CartObj item) async {
    await cartmodels.deleteItemCart(item);
    setState(() {
      cartItems.remove(item);
    });
  }

  Widget build(BuildContext context) {
    print(cartItems);
    return Scaffold(
      appBar: AppBar(
        title: Text('Giỏ Hàng'),
      ),
      body: cartItems != null
          ? ListView.builder(
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
                    deleteItemCart(cartItems[index]);
                  },
                );
              },
            )
          : null,
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Tổng tiền: ${calculateTotalPrice()}'),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OderPage(cart: cartItems)));
                  //  nút thanh toán
                },
                child: Text('Thanh toán'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  double calculateTotalPrice() {
    return cartItems.fold(0.0, (sum, item) => sum + item.gia_ban);
  }
}

class CartItem extends StatelessWidget {
  final CartObj product;
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
        title: Text(product.ten_sp),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Giá: ${product.gia_ban}'),
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
