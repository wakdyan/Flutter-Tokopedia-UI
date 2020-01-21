import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import '../../main.dart';
import '../../utils/network_request.dart';
import '../../utils/text_style.dart';

const Color kDiscountColor = Color(0xfffa581d);
const Color kAccentDiscountColor = Color(0xffff5c85);
const Color kPriceColor = Color(0xFF31343b);

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> nameIcons = [
    "Semua Kategori",
    "Belanja",
    "Top-Up & Tagihan",
    "Travel & Entertainment",
    "Keuangan",
    "Elektronik",
    "Handphone & Tablet",
    "Pulsa",
    "Pascabayar",
    "Emas"
  ];

  final Color _primaryAccentColor = Color(0xffe5e7e9);

  double _currentIndex;

  @override
  void initState() {
    _currentIndex = 0.0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          title: TextField(
            autofocus: false,
            decoration: InputDecoration(
              filled: true,
              hintText: "Cari produk atau toko",
              disabledBorder: InputBorder.none,
              prefixIcon: Icon(Icons.search, color: kLightSecondaryColor),
              suffixIcon: Icon(Icons.camera_alt, color: kLightSecondaryColor),
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
        ),
        SliverToBoxAdapter(
          child: Column(
            children: <Widget>[
              CarouselSlider.builder(
                  autoPlay: true,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  aspectRatio: 2.99 / 1,
                  itemCount: homeImagePaths.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index.toDouble();
                    });
                  },
                  scrollDirection: Axis.horizontal,
                  viewportFraction: .955,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.only(left: 5, right: 5),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          child: Image.network(
                            homeImagePaths[index],
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    );
                  }),
              Padding(
                padding: const EdgeInsets.only(top: 6, left: 7, right: 7),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      DotsIndicator(
                        dotsCount: homeImagePaths.length,
                        position: _currentIndex,
                        decorator: DotsDecorator(
                          activeColor: kPrimaryColor,
                          color: _primaryAccentColor,
                        ),
                      ),
                      Text(
                        'Lihat Semua Promo',
                        style:
                            textStyle(12, kPrimaryColor, FontWeight.bold, null),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(8, 8, 7, 13),
                child: Container(
                  height: 48,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 0),
                            color: Colors.black12,
                            blurRadius: 2,
                            spreadRadius: 1),
                      ]),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 8, top: 3),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                "assets/bar_code.png",
                                height: 29,
                                width: 29,
                                filterQuality: FilterQuality.low,
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 2),
                                child: Text(
                                  'Scan',
                                  style: TextStyle(fontSize: 12),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      VerticalDivider(indent: 5, endIndent: 5),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Image.asset(
                                  "assets/star_egg.png",
                                  height: 25,
                                  width: 25,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 5),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'TokoPoint',
                                        style: textStyle(
                                          12,
                                          null,
                                          FontWeight.bold,
                                          null,
                                        ),
                                      ),
                                      Text(
                                        'Cek Sekarang',
                                        style: textStyle(
                                          12,
                                          kPrimaryColor,
                                          FontWeight.bold,
                                          null,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Image.network(
                              "https://ecs7.tokopedia.net/assets-tokopedia-lite/v2/atreus/production/c0cd353f.png",
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 74,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: nameIcons.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(left: 6),
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 48,
                        width: 48,
                        child: Image.network(iconPaths[index]),
                      ),
                      Container(
                        width: 65,
                        child: Text(
                          nameIcons[index],
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 11),
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                  left: 14,
                  top: 24,
                  right: 14,
                  bottom: 12,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    height: 72,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        Image.network(
                          "https://ecs7.tokopedia.net/img/attachment/2020/1/10/77927732/77927732_b93ff544-b5bc-4f1f-ae85-3ad2a6ae82c3.jpg",
                          fit: BoxFit.fill,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Home Living Deals',
                                  style: textStyle(
                                    null,
                                    Colors.white,
                                    FontWeight.w600,
                                    null,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'Diskon Hingga 80%',
                                  style: textStyle(
                                    13,
                                    Colors.white,
                                    null,
                                    null,
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () => print("Cek sekarang"),
                              child: Container(
                                height: 32,
                                width: 113,
                                child: Center(
                                    child: Text(
                                  'Cek Sekarang',
                                  style: textStyle(
                                    null,
                                    Colors.white,
                                    FontWeight.w800,
                                    null,
                                  ),
                                )),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.transparent,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 216,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.white, Color(0xFFFFEAEF)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter),
                ),
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  scrollDirection: Axis.horizontal,
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        height: 208,
                        width: 120,
                        color: Colors.white,
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 112,
                              width: 120,
                              child: Image.network(
                                products[index][0],
                                fit: BoxFit.fill,
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 3,
                                      top: 5,
                                      right: 3,
                                    ),
                                    child: Text(
                                      products[index][1],
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: textStyle(
                                        13,
                                        null,
                                        FontWeight.w800,
                                        null,
                                      ),
                                    ),
                                  ),
                                  (products[index][2] == null ||
                                          products[index][3] == null)
                                      ? price(products[index][4])
                                      : discountPrice(
                                          products[index][2],
                                          products[index][3],
                                          products[index][4])
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                    );
                  },
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  price(product) {
    return Padding(
      padding: EdgeInsets.only(left: 3),
      child: Text(
        product,
        style: textStyle(12, kDiscountColor, FontWeight.w700, null),
      ),
    );
  }

  discountPrice(percentage, realPrice, discountPrice) {
    return Padding(
      padding: EdgeInsets.fromLTRB(3, 5, 3, 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(3),
                child: Container(
                  height: 20,
                  width: 30,
                  color: Color(0xffffeaef),
                  child: Center(
                    child: Text(
                      percentage,
                      style: textStyle(
                        10,
                        kAccentDiscountColor,
                        FontWeight.w700,
                        null,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 3),
              Text(
                realPrice,
                style: textStyle(
                  10,
                  kPriceColor.withOpacity(.44),
                  FontWeight.w700,
                  TextDecoration.lineThrough,
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Text(
            realPrice,
            style: textStyle(
              12,
              kDiscountColor,
              FontWeight.w700,
              null,
            ),
          ),
        ],
      ),
    );
  }
}
