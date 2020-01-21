import 'package:flutter/material.dart';

import 'feed_explorer.dart';
import 'feed_update.dart';

class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> with TickerProviderStateMixin {
  List<Tab> _tab = [
    Tab(child: Text("Updates")),
    Tab(child: Text("Explore")),
  ];
  List<Widget> feedPages = [
    FeedUpdate(),
    FeedExplorer(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tab.length,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, value) {
            return [
              SliverAppBar(
                title: Text('Feed'),
                pinned: true,
                floating: true,
                bottom: TabBar(
                  tabs: _tab,
                  indicatorWeight: 4,
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
              ),
            ];
          },
          body: TabBarView(
            children: feedPages,
          ),
        ),
      ),
    );
  }
}
