import 'package:flutter/material.dart';

class danhmucsanpham extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          //for (int i = 1; i < 7; i++)
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "Images/1.png",
                  width: 40,
                  height: 40,
                ),
                Text(
                  'Tiểu Thuyết',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                    color: Colors.red,
                  ),
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "Images/2.png",
                  width: 40,
                  height: 40,
                ),
                Text(
                  'Ngôn tình',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                    color: Colors.red,
                  ),
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "Images/3.png",
                  width: 40,
                  height: 40,
                ),
                Text(
                  'Tâm Linh',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                    color: Colors.red,
                  ),
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "Images/4.png",
                  width: 40,
                  height: 40,
                ),
                Text(
                  'Anime',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                    color: Colors.red,
                  ),
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "Images/5.png",
                  width: 40,
                  height: 40,
                ),
                Text(
                  'truyện cười',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                    color: Colors.red,
                  ),
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "Images/6.png",
                  width: 40,
                  height: 40,
                ),
                Text(
                  'Truyện Dân Gian',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                    color: Colors.red,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
///body: Column(
//         children: [
//           Container(
//             margin: EdgeInsets.symmetric(horizontal: 15),
//             padding: EdgeInsets.symmetric(horizontal: 15),
//             height: 50,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(25),
//             ),
//             child: Row(
//               children: [
//                 Container(
//                   margin: EdgeInsets.only(left: 5),
//                   height: 50,
//                   width: 200,
//                   child: TextFormField(
//                     decoration: InputDecoration(
//                       border: InputBorder.none,
//                       hintText: ' tim kiem san pham',
//                       prefixIcon: Icon(Icons.search), // them icon cho tim kiếm
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),

