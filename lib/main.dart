import 'package:flutter/material.dart';
import 'package:tokopedia_app/pages/account.dart';
import 'package:tokopedia_app/pages/cart.dart';
import 'package:tokopedia_app/pages/feed.dart';
import 'package:tokopedia_app/pages/home.dart';
import 'package:tokopedia_app/pages/store.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Colors.green[1000]),
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
    _tabController =
        TabController(initialIndex: 1, length: listPages.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        key: GlobalKey(),
        children: listPages,
        controller: _tabController,
      ),
      bottomNavigationBar: Container(
        height: 70,
        child: BottomAppBar(
          child: TabBar(
            isScrollable: false,
            key: GlobalKey(),
            indicator: UnderlineTabIndicator(borderSide: BorderSide.none, insets: EdgeInsets.zero),
            controller: _tabController,
            labelColor: Colors.green[1000],
            unselectedLabelColor: Colors.black45,
            labelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            labelPadding: EdgeInsets.zero,
            indicatorPadding: EdgeInsets.zero,
            tabs: <Widget>[
              Tab(icon: Icon(Icons.home), text: namePages[0]),
              Tab(icon: Icon(Icons.image), text: namePages[1]),
              Tab(icon: Icon(Icons.store_mall_directory), text: namePages[2]),
              Tab(icon: Icon(Icons.shopping_cart), text: namePages[3]),
              Tab(icon: Icon(Icons.account_circle), text: namePages[4]),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
