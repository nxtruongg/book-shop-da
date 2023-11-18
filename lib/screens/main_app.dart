import 'package:bookshop/screens/auth/login_screen.dart';
import 'package:bookshop/screens/home/home_screen.dart';
import 'package:bookshop/screens/product/product_group.dart';
import 'package:bookshop/screens/user/profile.dart';
import 'package:flutter/material.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationBar();
  }
}

class NavigationBar extends StatefulWidget {
  const NavigationBar({super.key});

  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  int _currentIndex = 0;
  PageController _pageController = PageController();
  List<Widget> _pages = [
    HomeScreen(),
    ProductGroup(),
    CartScreen(),
    NotificationsScreen(),
    LoginScreen(),
    //ProfileApp()
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      _pageController.animateToPage(index,
          duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
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
            icon: Icon(Icons.list_alt_outlined),
            activeIcon: Icon(Icons.list_alt, color: Color(0xFFBA1541)),
            label: 'Sản phẩm',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            activeIcon: Icon(Icons.shopping_cart, color: Color(0xFFBA1541)),
            label: 'Giỏ hàng',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            activeIcon: Icon(Icons.search, color: Color(0xFFBA1541)),
            label: 'Thông báo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            activeIcon: Icon(Icons.person, color: Color(0xFFBA1541)),
            label: 'Tài khoản',
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
