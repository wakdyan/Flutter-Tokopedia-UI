import 'package:flutter/material.dart';
import 'package:tokopedia_app/pages/feed_explorer.dart';
import 'package:tokopedia_app/pages/feed_update.dart';

class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> with TickerProviderStateMixin {
  TabController _tabController;
  List<Tab> _tab = [
    Tab(
      child: Text(
        "Updates",
        style: _tabStyle,
      ),
    ),
    Tab(
      child: Text(
        "Explore",
        style: _tabStyle,
      ),
    ),
  ];
  List<Widget> feedPages = [FeedUpdate(), FeedExplorer()];

  static var _tabStyle =
      TextStyle(color: Colors.green[1000], fontWeight: FontWeight.w800);

  @override
  void initState() {
    _tabController =
        TabController(length: _tab.length, initialIndex: 0, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, value) {
          return [
            SliverAppBar(
              title: Text(
                'Feed',
                style: TextStyle(
                  color: Color(0xFF9fa6b0),
                  fontWeight: FontWeight.w800,
                ),
              ),
              pinned: true,
              floating: true,
              bottom: TabBar(
                controller: _tabController,
                tabs: _tab,
                indicatorColor: Colors.green[1000],
                indicatorWeight: 4,
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.favorite),
                  color: Color(0xFF9fa6b0),
                  onPressed: () {
                    print("Favorite");
                  },
                ),
                IconButton(
                  icon: Icon(Icons.mail),
                  color: Color(0xFF9fa6b0),
                  onPressed: () {
                    print("Mail");
                  },
                ),
                IconButton(
                  icon: Icon(Icons.notifications),
                  color: Color(0xFF9fa6b0),
                  onPressed: () {
                    print("Notification");
                  },
                ),
              ],
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: feedPages,
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
