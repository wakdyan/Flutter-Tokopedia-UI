import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _textEditingController;

  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black87),
        title: Text('Masuk',
            style: TextStyle(color: Color(0xff31353b).withOpacity(.96))),
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
                  color: Color(0xff31353b).withOpacity(.96),
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
                  color: Color(0xff31353b).withOpacity(.96),
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: _textEditingController.text.length >= 6
                      ? Colors.green[1000]
                      : Color(0xffe5e7e9),
                ),
                child: Center(
                  child: Text(
                    'Selanjutnya',
                    style: TextStyle(
                        color: Color(0xff31353b), fontWeight: FontWeight.w800),
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
                      style: TextStyle(
                          color: Colors.black54, fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: RichText(
                  text: TextSpan(
                      text: 'Belum punya akun Tokopedia?',
                      style: TextStyle(color: Colors.black54, fontSize: 11.9),
                      children: [
                        TextSpan(
                          text: " Daftar",
                          style: TextStyle(
                            color: Colors.green[1000],
                          ),
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
                      color: Color(0xff6c727c),
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  Text(
                    'Pilih akun untuk masuk',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Color(0xff31353b).withOpacity(.96),
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
                      color: Color(0xffdbdee2),
                    ),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                        child: Image.network(
                          "https://www.freepnglogos.com/uploads/google-logo-png/google-logo-png-suite-everything-you-need-know-about-google-newest-0.png",
                          height: 20,
                          width: 20,
                        ),
                      ),
                      Center(
                        child: Text(
                          "Google",
                          style: TextStyle(
                            color: Color(0xff31353b).withOpacity(.68),
                            fontWeight: FontWeight.w800,
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
                      color: Color(0xffdbdee2),
                    ),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                        child: Image.network(
                          "https://cdn3.iconfinder.com/data/icons/happily-colored-snlogo/512/facebook.png",
                          height: 20,
                          width: 20,
                        ),
                      ),
                      Center(
                        child: Text(
                          "Facebook",
                          style: TextStyle(
                            color: Color(0xff31353b).withOpacity(.68),
                            fontWeight: FontWeight.w800,
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
