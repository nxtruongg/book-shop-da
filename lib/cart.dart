import 'package:flutter/material.dart';
import 'package:ontap3011/models/cartmodels.dart';
import 'package:ontap3011/payment.dart';
import 'dart:convert';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartModels cartmodels = CartModels();
  late List<CartObj> cartItems = [];
  List<CartObj> selectproduct =[];

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
  Future<void> UpdateCart(CartObj item,int sl) async {
    final soluong = sl + item.sl;
   await cartmodels.UpdateItemCart(item, soluong);
  loadCarts();
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
                    UpdateCart(cartItems[index], 1);
                    setState(() {
                      // Tăng số lượng sản phẩm
                    });
                  },
                  onDecrease: () {
                    UpdateCart(cartItems[index], -1);
                    setState(() {
                      // Giảm số lượng sản phẩm
                    });
                  },
                  onRemove: () {
                    deleteItemCart(cartItems[index]);
                  },
                  oncheck: (ischeck){
                    if(ischeck==true){
                      setState(() {
                        selectproduct.add(cartItems[index]);
                      });
                    }else {
                        setState(() {
                          selectproduct.remove(cartItems[index]);
                          });
                    }
                   print(ischeck);
                  },
                  ischeck: selectproduct.contains(cartItems[index]),
                );
              },
            )
          : null,
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child:


              //Text('Tổng tiền: ${calculateTotalPrice()}'),
              ElevatedButton(
                onPressed: () {

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OderPage(cart: selectproduct)));
                  //  nút thanh toán
                },
                child: Text('Thanh toán'),
              ),


        ),
      ),
    );
  }

  double calculateTotalPrice() {
    return selectproduct.fold(0.0, (sum, item) => sum + (item.gia_ban*item.sl)*((100-item.tien_ck)/100));
  }
}

class CartItem extends StatelessWidget {
  final CartObj product;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;
  final VoidCallback onRemove;
  final bool ischeck;
  final ValueChanged<bool?> oncheck;

  CartItem({
    required this.product,
    required this.onIncrease,
    required this.onDecrease,
    required this.onRemove,
    required this.oncheck,
    required this.ischeck
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(4.0),
      child: ListTile(
        leading: Flexible(
          child: Checkbox(
            value: ischeck,
            onChanged: oncheck,
          )
        ),
        title: Row(
            children:[
              Container(width: 250,
                child:Text(product.ten_sp,softWrap: true)),
              Text(product.tien_ck>0?'- ${product.tien_ck}%':"",style: TextStyle(color: Colors.red),)
            ]),

        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            product.image,
            width: 40.0,
            height: 40.0,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 8.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Giá bán: ${product.gia_ban}'),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: onDecrease,
                  ),
                  Text('${product.sl}'),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: onIncrease,
                  ),
                ],
              ),
              Text('Thành tiền: ${(product.gia_ban * product.sl)*(100-product.tien_ck)/100}'),
            ],
          ),
        ],) ,
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: onRemove,
        ),
      ),
    );
  }
}
