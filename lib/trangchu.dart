import 'package:flutter/material.dart';
import 'package:ontap3011/cart.dart';
import 'package:ontap3011/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_screen.dart';
import 'menu_screen.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NavigationBar(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class NavigationBar extends StatefulWidget {
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

Future<String?> getTokenFromLocalStorage() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('token');
}

Future<String?> fetchData() async {
  String? token = await getTokenFromLocalStorage();
  if (token != null) {
    return token;
  } else {
    print('Không có token được tìm thấy trong local storage');
    return null;
  }
}

class _NavigationBarState extends State<NavigationBar> {
  int _currentIndex = 0;
  PageController _pageController = PageController();
  List<Widget> _pages = [
    MenuScreen(),
    FutureBuilder<String?>(
      future: fetchData(),
      builder: (context, snapshot) {
        if (snapshot.data == null) {
          return ProfileScreen();
        } else {
          return LoginScreen();
        }
      },
    ),
    Cart(),
    NotificationsScreen(),
    ProfileScreen(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      _pageController.animateToPage(index,
          duration: Duration(milliseconds: 300), curve: Curves.easeOut);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: PageView(
        controller: _pageController,
        children: _pages,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            activeIcon: Icon(Icons.home, color: Color(0xFFBA1541)),
            label: 'Trang chủ',
            // activeLabelStyle: TextStyle(color: Color(0xFFBA1541)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            activeIcon: Icon(Icons.account_circle, color: Color(0xFFBA1541)),
            label: 'Tài khoản',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            activeIcon: Icon(Icons.shopping_cart, color: Color(0xFFBA1541)),
            label: 'Giỏ hàng',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            activeIcon: Icon(Icons.search, color: Color(0xFFBA1541)),
            label: 'Tìm kiếm',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            activeIcon: Icon(Icons.search, color: Color(0xFFBA1541)),
            label: 'Profile',
          ),
        ],
        selectedLabelStyle: TextStyle(color: Color(0xFFBA1541)),
        onTap: _onTabTapped,
      ),
    );
  }
}

class trangchu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Trang chủ'),
    );
  }
}

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Tài khoản'),
    );
  }
}

class SuggestionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Gợi ý'),
    );
  }
}

class NotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Thông báo'),
    );
  }
}

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Giỏ hàng'),
    );
  }
}
