import 'package:flutter/material.dart';
import 'package:tokopedia_app/pages/account.dart';
import 'package:tokopedia_app/pages/cart.dart';
import 'package:tokopedia_app/pages/feed.dart';
import 'package:tokopedia_app/pages/home.dart';
import 'package:tokopedia_app/pages/login.dart';
import 'package:tokopedia_app/pages/store.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.white,
          iconTheme: IconThemeData(color: Color(0xFF9fa6b0)),
          brightness: Brightness.light,
        ),
      ),
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  TabController _tabController;
  PageController _pageController;

  int _currentIndex;
  bool _isLogged;

//  List<Widget> listPage = [Home(), Feed(), Store()];

  List<Widget> listPages = [Home(), Feed(), Store(), Cart(), Account()];
  List<String> namePages = [
    "Home",
    "Feed",
    "Official Store",
    "Keranjang",
    "Akun"
  ];

  @override
  void initState() {
    _isLogged = false;
    _currentIndex = 0;
    _pageController =
        PageController(initialPage: _currentIndex, keepPage: true);
    _tabController = TabController(initialIndex: 1, length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        children: listPages,
        index: _currentIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });

          if (_currentIndex == 3 || _currentIndex == 4) {
            if (_isLogged == true) {
              _currentIndex = index;
            } else {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Login()));
              _currentIndex = 0;
            }
          }
        },
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: IconThemeData(color: Colors.green[1000]),
        selectedItemColor: Colors.green[1000],
        selectedLabelStyle: TextStyle(fontSize: 12),
        unselectedLabelStyle: TextStyle(color: Color(0xFF9fa6b0)),
        unselectedIconTheme: IconThemeData(color: Color(0xFF9fa6b0)),
        items: [
          BottomNavigationBarItem(
            icon:
                Image.asset("assets/inactive_home.png", height: 24, width: 24),
            activeIcon:
                Image.asset("assets/active_home.png", height: 24, width: 24),
            title: Text(namePages[0]),
          ),
          BottomNavigationBarItem(
              icon: Image.asset("assets/inactive_feed.png"),
              activeIcon: Image.asset("assets/active_feed.png"),
              title: Text(namePages[1])),
          BottomNavigationBarItem(
              icon: Image.asset("assets/inactive_official.png"),
              activeIcon: Image.asset("assets/active_official.png"),
              title: Text(namePages[2])),
          BottomNavigationBarItem(
              icon: Image.asset("assets/inactive_cart.png",
                  height: 24, width: 24),
              activeIcon:
                  Image.asset("assets/active_cart.png", height: 24, width: 24),
              title: Text(namePages[3])),
          BottomNavigationBarItem(
              icon: Image.asset("assets/inactive_account.png"),
              activeIcon: Image.asset("assets/active_account.png"),
              title: Text(namePages[4])),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    _pageController.dispose();
    super.dispose();
  }
}
