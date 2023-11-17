import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:bookshop/product_object.dart';

class ProductProvider {
  //Lay danh sach du lieu tu json
  static Future<List<dynamic>> readJsonData() async {
    //Dung rootBundle de doc file tu resource ung dung
    var jsonText = await rootBundle.loadString('data/ontap.json');
    //Lay du lieu tu json (theo cau truc chua danh sach)
    var data = json.decode(jsonText);
    return data;
  }

  //Lay danh sach lien he
  static Future<List<ProductObject>> getAllContacts() async {
    List<ProductObject> lsResult = [];
    List<dynamic> data = await readJsonData();
    lsResult = data.map((e) => ProductObject.fromJson(e)).toList();
    return lsResult;
  }
}
