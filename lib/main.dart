import 'package:flutter/material.dart';

import 'pages/account/account.dart';
import 'pages/cart/cart.dart';
import 'pages/feed/feed.dart';
import 'pages/home/home.dart';
import 'pages/login/login.dart';
import 'pages/store/store.dart';
import 'utils/text_style.dart';

const kPrimaryColor = Color(0xFF42b54a);
const kDarkSecondaryColor = Color(0xFF9fa6b0);
const kLightSecondaryColor = Color(0xffb5bbc5);
const kSecondaryColor = Color(0xFFF5F5F5);

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.white,
          textTheme: TextTheme(
            title: TextStyle(
              color: kDarkSecondaryColor,
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ),
          iconTheme: IconThemeData(color: kDarkSecondaryColor),
          brightness: Brightness.light,
        ),
        
        iconTheme: IconThemeData(color: kDarkSecondaryColor),
        primaryColor: kPrimaryColor,
        accentColor: kPrimaryColor,
        indicatorColor: kPrimaryColor,
        tabBarTheme: TabBarTheme(
          labelColor: kPrimaryColor,
          labelStyle: TextStyle(fontWeight: FontWeight.w800),
          unselectedLabelColor: kDarkSecondaryColor,
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w800),
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
  final List<Widget> listPages = [
    Home(),
    Feed(),
    Store(),
    Cart(),
    Account(),
  ];
  final List<String> inactiveIcon = [
    "assets/bottom_icons/inactive_home.png",
    "assets/bottom_icons/inactive_feed.png",
    "assets/bottom_icons/inactive_official.png",
    "assets/bottom_icons/inactive_cart.png",
    "assets/bottom_icons/inactive_account.png",
  ];
  final List<String> activeIcons = [
    "assets/bottom_icons/active_home.png",
    "assets/bottom_icons/active_feed.png",
    "assets/bottom_icons/active_official.png",
    "assets/bottom_icons/active_cart.png",
    "assets/bottom_icons/active_account.png",
  ];
  final List<String> pageNames = [
    "Home",
    "Feed",
    "Official Store",
    "Keranjang",
    "Akun"
  ];

  int _currentIndex;
  bool _isLogged;

  @override
  void initState() {
    _isLogged = false;
    _currentIndex = 0;

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
            if (_isLogged) {
              _currentIndex = index;
            } else {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Login()));
              _currentIndex = 0;
            }
          }
        },
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: textStyle(12, kPrimaryColor, null, null),
        unselectedLabelStyle: textStyle(12, kDarkSecondaryColor, null, null),
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(inactiveIcon[0], height: 24),
            activeIcon: Image.asset(activeIcons[0], height: 24),
            title: Text(pageNames[0]),
          ),
          BottomNavigationBarItem(
            icon: Image.asset(inactiveIcon[1]),
            activeIcon: Image.asset(activeIcons[1]),
            title: Text(pageNames[1]),
          ),
          BottomNavigationBarItem(
            icon: Image.asset(inactiveIcon[2]),
            activeIcon: Image.asset(activeIcons[2]),
            title: Text(pageNames[2]),
          ),
          BottomNavigationBarItem(
            icon: Image.asset(inactiveIcon[3], height: 24),
            activeIcon: Image.asset(activeIcons[3], height: 24),
            title: Text(pageNames[3]),
          ),
          BottomNavigationBarItem(
            icon: Image.asset(inactiveIcon[4]),
            activeIcon: Image.asset(activeIcons[4]),
            title: Text(pageNames[4]),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
