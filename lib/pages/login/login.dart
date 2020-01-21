import 'package:flutter/material.dart';

import '../../main.dart';
import '../../utils/text_style.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _textEditingController = TextEditingController();
  final Color _color = Color(0xff31353b);
  final Color _lightColor = Color(0xffe5e7e9);
  final Color _borderButtonColor = Color(0xffdbdee2);
  final Color _closeBottomSheetColor = Color(0xff6c727c);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black87),
        title: Text(
          'Masuk',
          style: textStyle(null, _color.withOpacity(.96), null, null),
        ),
        brightness: Brightness.light,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: GestureDetector(
              onTap: () => print("Daftar"),
              child: Center(
                child: Text(
                  'Daftar',
                  style: TextStyle(color: kPrimaryColor),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Nomor Ponsel atau Email',
                style: TextStyle(
                  fontSize: 11.9,
                  color: _color.withOpacity(.96),
                ),
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                controller: _textEditingController,
              ),
              SizedBox(height: 5),
              Text(
                'Contoh: 08123456789',
                style: TextStyle(
                  fontSize: 11.9,
                  color: _color.withOpacity(.96),
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: _textEditingController.text.length >= 6
                      ? kPrimaryColor
                      : _lightColor,
                ),
                child: Center(
                  child: Text(
                    'Selanjutnya',
                    style: textStyle(null, _color, FontWeight.w800, null),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(child: Divider()),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        'atau masuk dengan',
                        style: TextStyle(color: Colors.black38),
                      ),
                    ),
                    Expanded(child: Divider())
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => loginOption(),
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 1),
                            blurRadius: 3),
                      ]),
                  child: Center(
                    child: Text(
                      'Akun Media Sosial',
                      style: textStyle(
                        null,
                        Colors.black54,
                        FontWeight.w800,
                        null,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: RichText(
                  text: TextSpan(
                      text: 'Belum punya akun Tokopedia?',
                      style: textStyle(11.9, Colors.black54, null, null),
                      children: [
                        TextSpan(
                          text: " Daftar",
                          style: textStyle(null, kPrimaryColor, null, null),
                        )
                      ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  loginOption() {
    return showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8), topRight: Radius.circular(8)),
          ),
          child: Wrap(
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.clear,
                      color: _closeBottomSheetColor,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  Text(
                    'Pilih akun untuk masuk',
                    style: textStyle(
                      18,
                      _color.withOpacity(.96),
                      FontWeight.w800,
                      null,
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 35, vertical: 8),
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    border: Border.all(
                      color: _borderButtonColor,
                    ),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 15),
                        child: Image.asset(
                          "assets/login_button/google.png",
                          height: 20,
                          width: 20,
                        ),
                      ),
                      Center(
                        child: Text(
                          "Google",
                          style: textStyle(
                            null,
                            _color.withOpacity(.68),
                            FontWeight.w800,
                            null,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 35, vertical: 8),
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    border: Border.all(
                      color: _borderButtonColor,
                    ),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 15),
                        child: Image.asset(
                          "assets/login_button/facebook.png",
                          height: 20,
                          width: 20,
                        ),
                      ),
                      Center(
                        child: Text(
                          "Facebook",
                          style: textStyle(
                            null,
                            _color.withOpacity(.68),
                            FontWeight.w800,
                            null,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
