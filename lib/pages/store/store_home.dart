import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import '../../utils/network_request.dart';
import '../../utils/text_style.dart';
import '../home/home.dart';

class StoreHome extends StatefulWidget {
  @override
  _StoreHomeState createState() => _StoreHomeState();
}

class _StoreHomeState extends State<StoreHome> {
  final Color _selectedColor = Color(0xff7908c9);
  final Color _unselectedColor = Color(0xffe5e7e9);

  double _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        CarouselSlider.builder(
          autoPlay: true,
          autoPlayCurve: Curves.fastOutSlowIn,
          itemCount: storeImagePaths.length,
          height: 180,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index.toDouble();
            });
          },
          scrollDirection: Axis.horizontal,
          viewportFraction: 1.0,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              child: Image.network(
                storeImagePaths[index],
                fit: BoxFit.fill,
              ),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.only(top: 14, left: 16, right: 16),
          child: Align(
            alignment: Alignment.topLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                DotsIndicator(
                  dotsCount: storeImagePaths.length,
                  position: _currentIndex,
                  decorator: DotsDecorator(
                    activeColor: _selectedColor,
                    color: _unselectedColor,
                    size: Size.square(8),
                    activeSize: Size.square(8),
                    spacing: EdgeInsets.all(4),
                  ),
                ),
                Text(
                  'Lihat Semua',
                  style: textStyle(null, _selectedColor, null, null),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(17, 22, 17, 0),
          child: Text(
            'Brand pilihan',
            style: textStyle(
              18.0,
              Colors.black.withOpacity(.7),
              FontWeight.bold,
              null,
            ),
          ),
        ),
        GridView.count(
          physics: NeverScrollableScrollPhysics(),
          childAspectRatio: 89 / 48,
          mainAxisSpacing: 2,
          crossAxisSpacing: 2,
          crossAxisCount: 2,
          shrinkWrap: true,
          children: <Widget>[
            Container(child: Image.network(selectedProductPaths[0])),
            Container(child: Image.network(selectedProductPaths[1])),
            Container(child: Image.network(selectedProductPaths[2])),
            Container(child: Image.network(selectedProductPaths[3])),
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(17, 22, 17, 17),
          child: Row(
            children: <Widget>[
              Text(
                'Flash Sale',
                style: textStyle(
                  18.0,
                  Colors.black.withOpacity(.7),
                  FontWeight.bold,
                  null,
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        _timeContainer("00"),
                        _timeDivider(),
                        _timeContainer("00"),
                        _timeDivider(),
                        _timeContainer("00"),
                      ],
                    ),
                    Text(
                      'Lihat Semua',
                      style: textStyle(null, _selectedColor, null, null),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 166,
          width: MediaQuery.of(context).size.width,
          child: ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 5),
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, i) {
              return Container(
                height: 148,
                width: MediaQuery.of(context).size.width / 3.24,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 2,
                      offset: Offset(0, 1),
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Image.network(
                      flashSales[0][i][0],
                      fit: BoxFit.fill,
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
                            child: (flashSales[0][i][1] == null ||
                                    flashSales[0][i][3] == null)
                                ? _price(flashSales[0][i][2])
                                : _discountPrice(flashSales[0][i][1],
                                    flashSales[0][i][2], flashSales[0][i][3]),
                          )
                        ],
                      ),
                    )
                  ],
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
        SizedBox(height: 15)
      ],
    );
  }

  _price(product) {
    return Padding(
      padding: EdgeInsets.only(left: 3),
      child: Text(
        product,
        style: textStyle(12, kDiscountColor, FontWeight.w700, null),
      ),
    );
  }

  _discountPrice(percentage, realPrice, discountPrice) {
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

  _timeContainer(String time) {
    return Container(
      height: 24,
      width: 24,
      decoration: BoxDecoration(
          color: kDiscountColor, borderRadius: BorderRadius.circular(4)),
      child: Center(
        child: Text(
          time,
          style: textStyle(12, Colors.white, FontWeight.w600, null),
        ),
      ),
    );
  }

  _timeDivider() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 2),
      child: Text(
        ':',
        style: textStyle(
          null,
          kDiscountColor,
          FontWeight.w600,
          null,
        ),
      ),
    );
  }
}
