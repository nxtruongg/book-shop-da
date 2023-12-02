import 'package:flutter/material.dart';
import 'package:ontap3011/pagedanhmucsanpham/tieuthuyet.dart';

import 'pagedanhmucsanpham/anime.dart';
import 'pagedanhmucsanpham/ngontinh.dart';
import 'pagedanhmucsanpham/tamlinh.dart';
import 'pagedanhmucsanpham/truyencuoi.dart';
import 'pagedanhmucsanpham/truyendangian.dart';

class DanhMucSanPham extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildCategory(context, "Images/1.png", 'Tiểu Thuyết', () {
            // Xử lý khi nhấp vào hình ảnh Tiểu Thuyết
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => danhmuctieuthuyet(),
                ));
          }),
          _buildCategory(context, "Images/2.png", 'Ngôn tình', () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => danhmucngontinh(),
                ));
            // Xử lý khi nhấp vào hình ảnh Ngôn tình
          }),
          _buildCategory(context, "Images/3.png", 'Tâm Linh', () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => danhmuctamlinh(),
                ));
            // Xử lý khi nhấp vào hình ảnh Ngôn tình
          }),
          _buildCategory(context, "Images/4.png", 'Anime', () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => danhmucanime(),
                ));
            // Xử lý khi nhấp vào hình ảnh Ngôn tình
          }),
          _buildCategory(context, "Images/5.png", 'Truyện Cười', () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => danhmuctruyencuoi(),
                ));

            // Xử lý khi nhấp vào hình ảnh Ngôn tình
          }),
          _buildCategory(context, "Images/6.png", 'Truyện dân Gian', () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => danhmuctruyendangian(),
                ));
            // Xử lý khi nhấp vào hình ảnh Ngôn tình
          }),
          // ...Thêm các hình ảnh khác tương tự
        ],
      ),
    );
  }

  Widget _buildCategory(BuildContext context, String imagePath,
      String categoryName, VoidCallback onTapCallback) {
    return GestureDetector(
      onTap: onTapCallback,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        margin: EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 40,
              height: 40,
            ),
            SizedBox(width: 8.0),
            Text(
              categoryName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 10,
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}
