import 'package:flutter/material.dart';
import 'package:tokopedia_app/utils/utils.dart';

class FeedUpdate extends StatefulWidget {
  FeedUpdate({Key key}) : super(key: key);

  @override
  _FeedUpdateState createState() => _FeedUpdateState();
}

class _FeedUpdateState extends State<FeedUpdate> {
  ScrollController _scrollController;

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
                            child: FlutterLogo(),
                            backgroundColor: Colors.white),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Image.network(
                                  "https://ecs7.tokopedia.net/img/newtkpd/powermerchant/ic-powermerchant-130px.png",
                                  height: 12,
                                  width: 12,
                                ),
                                SizedBox(width: 3),
                                Text("Apocalypse"),
                              ],
                            ),
                            Text('4 menit yang lalu')
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
                                  color: Colors.green[1000],
                                  child: Center(
                                    child: Text(
                                      "Follow",
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.more_vert,
                                  color: Color(0xFF9fa6b0),
                                ),
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
                      color: Colors.green[1000],
                      child: Image.network(
                        product[index][0],
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
                      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                      scrollDirection: Axis.horizontal,
                      itemCount: 2,
                      itemBuilder: (context, i) {
                        return Container(
                          width: 305,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 2,
                                  offset: Offset(0, 0))
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
                                    child: FlutterLogo(),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Container(
                                      width: 135,
                                      child: Text(
                                        product[i][1],
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Text(
                                      product[i][4],
                                      style: TextStyle(
                                        color: Color(0xfffa581d),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
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
                                    color: Color(0xfffa581d),
                                    child: Center(
                                      child: Text(
                                        'Beli',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
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
                                  color: Color(0xFF9fa6b0),
                                  size: 18,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  'Like',
                                  style: TextStyle(
                                    color: Color(0xFF9fa6b0),
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
                                  color: Color(0xFF9fa6b0),
                                  size: 18,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  'Comment',
                                  style: TextStyle(
                                    color: Color(0xFF9fa6b0),
                                  ),
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
                                  color: Color(0xFF9fa6b0),
                                  size: 18,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  'Share',
                                  style: TextStyle(
                                    color: Color(0xFF9fa6b0),
                                  ),
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
