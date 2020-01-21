import 'package:flutter/material.dart';
import 'package:tokopedia_app/pages/store/store_auto.dart';
import 'package:tokopedia_app/pages/store/store_category.dart';
import 'package:tokopedia_app/pages/store/store_groceries.dart';
import 'package:tokopedia_app/pages/store/store_home_baby.dart';
import 'package:tokopedia_app/pages/store/store_fashion.dart';
import 'package:tokopedia_app/pages/store/store_health.dart';
import 'package:tokopedia_app/pages/store/store_home.dart';
import 'package:tokopedia_app/pages/store/store_electronics.dart';

import '../../main.dart';

class Store extends StatefulWidget {
  @override
  _StoreState createState() => _StoreState();
}

class _StoreState extends State<Store> with TickerProviderStateMixin {
  TabController _tabController;

  int _currentIndex;

  final selectedColor = Color(0xff7908c9);
  final unselectedColor = Color(0xFF9fa6b0);
  final selectedLabelStyle = TextStyle(fontWeight: FontWeight.bold);
  final unselectedLabelStyle = TextStyle(fontWeight: FontWeight.w400);

  final List<Widget> listPages = [
    StoreHome(),
    StoreElectronics(),
    StoreFashion(),
    StoreHealth(),
    StoreGroceries(),
    StoreAuto(),
    StoreHomeBaby(),
    StoreCategory()
  ];
  final List<String> activeIcons = [
    "assets/tab_icons/active_home.png",
    "assets/tab_icons/active_electronics.png",
    "assets/tab_icons/active_fashion.png",
    "assets/tab_icons/active_health.png",
    "assets/tab_icons/active_groceries.png",
    "assets/tab_icons/active_auto.png",
    "assets/tab_icons/active_home_baby.png",
    "assets/tab_icons/active_category.png",
  ];
  final List<String> inactiveIcons = [
    "assets/tab_icons/inactive_home.png",
    "assets/tab_icons/inactive_electronics.png",
    "assets/tab_icons/inactive_fashion.png",
    "assets/tab_icons/inactive_health.png",
    "assets/tab_icons/inactive_groceries.png",
    "assets/tab_icons/inactive_auto.png",
    "assets/tab_icons/inactive_home_baby.png",
    "assets/tab_icons/inactive_category.png",
  ];
  final List<String> iconNames = [
    "Home",
    "Electronics",
    "Fashion",
    "Health Beauty",
    "Groceries",
    "Auto Hobbies",
    "Home & Baby",
    "Semua Katergori",
  ];

  @override
  void initState() {
    _currentIndex = 0;
    _tabController = TabController(length: activeIcons.length, vsync: this);
    _tabController.addListener(_listener);

    super.initState();
  }

  void _listener() {
    setState(() {
      _currentIndex = _tabController.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, isScroll) {
        return [
          SliverAppBar(
            floating: true,
            pinned: true,
            title: TextField(
              autofocus: false,
              decoration: InputDecoration(
                filled: true,
                hintText: "Cari produk atau toko",
                hintStyle: TextStyle(color: kLightSecondaryColor),
                disabledBorder: InputBorder.none,
                prefixIcon: Icon(Icons.search, color: kLightSecondaryColor),
                suffixIcon: Icon(Icons.camera_alt, color: kLightSecondaryColor),
                fillColor: kSecondaryColor,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(color: Colors.white),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.favorite),
                onPressed: () {
                  print("Favorite");
                },
              ),
              IconButton(
                icon: Icon(Icons.mail),
                onPressed: () {
                  print("Mail");
                },
              ),
              IconButton(
                icon: Icon(Icons.notifications),
                onPressed: () {
                  print("Notification");
                },
              ),
            ],
            bottom: TabBar(
              isScrollable: true,
              controller: _tabController,
              tabs: <Widget>[
                Tab(
                    icon: (_currentIndex == 0)
                        ? Image.asset(activeIcons[0], height: 34, width: 34)
                        : Image.asset(inactiveIcons[0], height: 34, width: 34),
                    text: iconNames[0]),
                Tab(
                  icon: (_currentIndex == 1)
                      ? Image.asset(activeIcons[1], height: 34, width: 34)
                      : Image.asset(inactiveIcons[1], height: 34, width: 34),
                  text: iconNames[1],
                ),
                Tab(
                  icon: (_currentIndex == 2)
                      ? Image.asset(activeIcons[2], height: 34, width: 34)
                      : Image.asset(inactiveIcons[2], height: 34, width: 34),
                  text: iconNames[2],
                ),
                Tab(
                  icon: (_currentIndex == 3)
                      ? Image.asset(activeIcons[3], height: 34, width: 34)
                      : Image.asset(inactiveIcons[3], height: 34, width: 34),
                  text: iconNames[3],
                ),
                Tab(
                  icon: (_currentIndex == 4)
                      ? Image.asset(activeIcons[4], height: 34, width: 34)
                      : Image.asset(inactiveIcons[4], height: 34, width: 34),
                  text: iconNames[4],
                ),
                Tab(
                  icon: (_currentIndex == 5)
                      ? Image.asset(activeIcons[5], height: 34, width: 34)
                      : Image.asset(inactiveIcons[5], height: 34, width: 34),
                  text: iconNames[5],
                ),
                Tab(
                  icon: (_currentIndex == 6)
                      ? Image.asset(activeIcons[6], height: 34, width: 34)
                      : Image.asset(inactiveIcons[6], height: 34, width: 34),
                  text: iconNames[6],
                ),
                Tab(
                  icon: (_currentIndex == 7)
                      ? Image.asset(activeIcons[7], height: 34, width: 34)
                      : Image.asset(inactiveIcons[7], height: 34, width: 34),
                  text: iconNames[7],
                ),
              ],
              indicatorColor: selectedColor,
              labelColor: selectedColor,
              labelStyle: selectedLabelStyle,
              unselectedLabelStyle: unselectedLabelStyle,
              unselectedLabelColor: unselectedColor,
            ),
          ),
        ];
      },
      body: TabBarView(
        children: listPages,
        controller: _tabController,
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
