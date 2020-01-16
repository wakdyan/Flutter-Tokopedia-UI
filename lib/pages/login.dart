import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black87),
        title: Text('Masuk', style: TextStyle(color: Colors.black87)),
        brightness: Brightness.light,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: GestureDetector(
              onTap: () => print("Daftar"),
              child: Center(
                child: Text(
                  'Daftar',
                  style: TextStyle(color: Colors.green[1000]),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
