import 'package:flutter/material.dart';

class StfWidget extends StatefulWidget {
  const StfWidget({super.key});

  @override
  State<StfWidget> createState() => _StfWidgetState();
}

class _StfWidgetState extends State<StfWidget> {
  final List<String> products  = [];
  bool isLoading = false;


  @override
  Widget build(BuildContext context) {
    return isLoading ? CircularProgressIndicator() : ProdudctWidget(1,color: Colors.red,name: "truong",price: 20000,);
  }
}




class ProdudctWidget extends StatelessWidget {
  const ProdudctWidget(this.id, {
    super.key,
    required this.color,
    this.name,
    this.price = 0,
    this.isActive = false,
  });
  final int id;
  final Color color;
  final String? name;
  final double price;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final _specialColor = Colors.amber;
    return Container(
      child: Text(
        name ?? 'unknown name',
        style: TextStyle(color: isActive ? color : _specialColor, fontSize: 20),
      ),
    );
  }
}
