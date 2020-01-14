import 'package:flutter/material.dart';

class FeedUpdate extends StatefulWidget {
  FeedUpdate({Key key}) : super(key: key);

  @override
  _FeedUpdateState createState() => _FeedUpdateState();
}

class _FeedUpdateState extends State<FeedUpdate> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(left: 8, top: 8, right: 8, bottom: 8),
          child: Container(
            height: 579,
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
          ),
        );
      },
    );
  }
}