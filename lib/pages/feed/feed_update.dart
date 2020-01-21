import 'package:flutter/material.dart';

import '../../main.dart';
import '../../utils/network_request.dart';
import '../../utils/text_style.dart';

class FeedUpdate extends StatefulWidget {
  FeedUpdate({Key key}) : super(key: key);

  @override
  _FeedUpdateState createState() => _FeedUpdateState();
}

class _FeedUpdateState extends State<FeedUpdate> {
  ScrollController _scrollController;

  final Color _color = Color(0xfffa581d);

  @override
  void initState() {
    _scrollController = ScrollController(initialScrollOffset: 4);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: Container(
            height: 540,
            width: 344,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 0),
                      blurRadius: 2)
                ]),
            child: Padding(
              padding: EdgeInsets.only(top: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: NetworkImage(feedUpdates[index][0]),
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Image.asset(
                                  "assets/crown.png",
                                  height: 12,
                                  width: 12,
                                ),
                                SizedBox(width: 3),
                                Text(
                                  feedUpdates[index][1],
                                  style: textStyle(
                                    12,
                                    null,
                                    FontWeight.w700,
                                    null,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              feedUpdates[index][2],
                              style: textStyle(10, null, null, null),
                            )
                          ],
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(3),
                                child: Container(
                                  height: 30,
                                  width: 70,
                                  color: _color,
                                  child: Center(
                                    child: Text(
                                      "Follow",
                                      style: textStyle(
                                        10,
                                        Colors.white,
                                        FontWeight.w700,
                                        null,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.more_vert),
                                onPressed: () {},
                                splashColor: Colors.transparent,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      height: 300,
                      width: 300,
                      child: Image.network(
                        feedUpdates[index][3],
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Text(
                      'Klik untuk melihat produk',
                      style: TextStyle(fontWeight: FontWeight.w800),
                    ),
                  ),
                  Container(
                    height: 96,
                    width: 344,
                    child: ListView.separated(
                      controller: _scrollController,
                      padding: EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 12,
                      ),
                      scrollDirection: Axis.horizontal,
                      itemCount: 2,
                      itemBuilder: (context, i) {
                        // print(feedUpdates[index][4][index][0]);
                        return Container(
                          width: 285,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 2,
                                offset: Offset(0, 0),
                              )
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 16,
                              horizontal: 16,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Container(
                                    height: 64,
                                    width: 64,
                                    child: Image.network(
                                        feedUpdates[index][4][i][0]),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Container(
                                      width: 115,
                                      child: Text(
                                        feedUpdates[index][4][i][1],
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ),
                                    Text(
                                      feedUpdates[index][4][i][2],
                                      style: textStyle(
                                        null,
                                        _color,
                                        FontWeight.w700,
                                        null,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 10),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Container(
                                    height: 30,
                                    width: 54,
                                    color: _color,
                                    child: Center(
                                      child: Text(
                                        'Beli',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4),
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () => print("Like"),
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.thumb_up,
                                  color: kDarkSecondaryColor,
                                  size: 18,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  'Like',
                                  style: TextStyle(
                                    color: kDarkSecondaryColor,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(width: 8),
                          GestureDetector(
                            onTap: () => print("Comment"),
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.comment,
                                  color: kDarkSecondaryColor,
                                  size: 18,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  'Comment',
                                  style: TextStyle(color: kDarkSecondaryColor),
                                )
                              ],
                            ),
                          ),
                          SizedBox(width: 8),
                          GestureDetector(
                            onTap: () => print("Share"),
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.share,
                                  color: kDarkSecondaryColor,
                                  size: 18,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  'Share',
                                  style: TextStyle(color: kDarkSecondaryColor),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
