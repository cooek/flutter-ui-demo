import 'package:flutter/material.dart';
import 'package:flutter_app_ui/utils/utils.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_app_ui/Data/shopdata.dart';

class ShopView extends StatefulWidget {
  @override
  _ShopViewState createState() => _ShopViewState();
}

class _ShopViewState extends State<ShopView> {
  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      var systemUiOverlayStyle =
          SystemUiOverlayStyle(statusBarColor: Colors.transparent);
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          Color(0xFF696D77),
          Color(0xFF292c36),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        tileMode: TileMode.clamp,
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          bottomOpacity: 0.0,
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              size: screenAwareSize(20.0, context),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Energy Cloud',
            style: TextStyle(
              color: Colors.white,
              fontSize: screenAwareSize(18.0, context),
              fontFamily: "Montserrats-Bold",
            ),
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.favorite_border,
                    size: screenAwareSize(20.0, context), color: Colors.white),
                onPressed: () {})
          ],
        ),
        body: SingleChildScrollView(
          primary: true,
          child: Column(
            children: <Widget>[
              ProductScreeTopa(),
              ProductScreeBottomPart(),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductScreeTopa extends StatefulWidget {
  @override
  _ProductScreeTopaState createState() => _ProductScreeTopaState();
}

class _ProductScreeTopaState extends State<ProductScreeTopa> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: screenAwareSize(280.0, context),
      child: Stack(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                child: Image.asset(
                  "assets/adidas.png",
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60.0, right: 35.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: screenAwareSize(50.0, context),
                    height: screenAwareSize(50.0, context),
                    decoration: BoxDecoration(
                        color: Colors.black26, shape: BoxShape.circle),
                    child: Image.asset("assets/360.png"),
                  ),
                ),
              )
            ],
          ),
          Positioned(
            left: screenAwareSize(18.0, context),
            bottom: screenAwareSize(15.0, context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Rating',
                  style: TextStyle(
                      color: Color(0xFF949598),
                      fontSize: screenAwareSize(10.0, context),
                      fontFamily: "Montserrats-SemiBold"),
                ),
                SizedBox(height: screenAwareSize(8.0, context)),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 8.0,
                    ),
                    Icon(Icons.star, color: Color(0xFFFFE600)),
                    SizedBox(width: screenAwareSize(5.0, context)),
                    Text('4.5', style: TextStyle(color: Color(0xFFFE600))),
                    SizedBox(width: screenAwareSize(5.0, context)),
                    Text('378 People',
                        style: TextStyle(color: Colors.white, fontSize: 14.0))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ProductScreeBottomPart extends StatefulWidget {
  @override
  _ProductScreeBottomPartState createState() => _ProductScreeBottomPartState();
}

class _ProductScreeBottomPartState extends State<ProductScreeBottomPart> {
  bool isExpanded = false;
  int currentindex = 0;
  int counter = 0;
  int currentcolorindex = 0;

  void _increase() {
    setState(() {
      counter++;
    });
  }

  void _decrease() {
    setState(() {
      counter--;
    });
  }

  expand() {
    setState(() {
      isExpanded ? isExpanded = false : isExpanded = true;
    });
  }

  List<Widget> colorsList() {
    List<Widget> coloritemList = List();

    for (var i = 0; i < colors.length; i++) {
      coloritemList
          .add(colorList(colors[i], i == currentcolorindex, context, () {
        setState(() {
          currentcolorindex = i;
        });
      }));
    }
    return coloritemList;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: screenAwareSize(18.0, context)),
            child: Text('Product Description',
                style: TextStyle(
                    color: Color(0xFF949598),
                    fontSize: screenAwareSize(10.0, context),
                    fontFamily: "Montserrats-SemiBold")),
          ),
          SizedBox(
            height: screenAwareSize(8.0, context),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: screenAwareSize(26.0, context),
                right: screenAwareSize(18, context)),
            child: AnimatedCrossFade(
                firstChild: Text(desc,
                    maxLines: 2,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: screenAwareSize(10.0, context),
                        fontFamily: "Montserrats-Medium")),
                secondChild: Text(desc,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: screenAwareSize(10.0, context),
                        fontFamily: "Montserrats-Medium")),
                crossFadeState: isExpanded
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                duration: kThemeAnimationDuration),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: screenAwareSize(26.0, context),
                right: screenAwareSize(18.0, context)),
            child: GestureDetector(
                onTap: expand,
                child: Text(
                  isExpanded ? "less" : "more..",
                  style: TextStyle(
                      color: Color(0xFFFB382F), fontWeight: FontWeight.w700),
                )),
          ),
          SizedBox(height: screenAwareSize(12.0, context)),
          Padding(
            padding: EdgeInsets.only(
                left: screenAwareSize(15.0, context),
                right: screenAwareSize(75.0, context)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Size",
                    style: TextStyle(
                      color: Color(0xFF949598),
                      fontSize: screenAwareSize(10.0, context),
                      fontFamily: "Montserrats-SemiBold",
                    )),
                Text("Quantity",
                    style: TextStyle(
                      color: Color(0xFF949598),
                      fontSize: screenAwareSize(10.0, context),
                      fontFamily: "Montserrats-SemiBold",
                    )),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: screenAwareSize(20.0, context),
                right: screenAwareSize(10.0, context)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: screenAwareSize(38.0, context),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: sizeNumlist.map((item) {
                      var indx = sizeNumlist.indexOf(item);

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            currentindex = indx;
                          });
                        },
                        child: SizeItem(item, indx == currentindex, context),
                      );
                    }).toList(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    width: screenAwareSize(100.0, context),
                    height: screenAwareSize(30.0, context),
                    decoration: BoxDecoration(
                      color: Color(0xFF525663),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Flexible(
                            flex: 3,
                            child: GestureDetector(
                              onTap: _decrease,
                              child: Container(
                                height: double.infinity,
                                child: Center(
                                  child: Text('-',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0,
                                          fontFamily: "Montserrats-Bold")),
                                ),
                              ),
                            )),
                        divider(),
                        Flexible(
                            flex: 3,
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                height: double.infinity,
                                child: Center(
                                  child: Text(counter.toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15.0,
                                          fontFamily: "Montserrats-Bold")),
                                ),
                              ),
                            )),
                        divider(),
                        Flexible(
                            flex: 3,
                            child: GestureDetector(
                              onTap: _increase,
                              child: Container(
                                height: double.infinity,
                                child: Center(
                                  child: Text('+',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0,
                                          fontFamily: "Montserrats-Bold")),
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: screenAwareSize(18.0, context)),
            child: Text('Select Color',
                style: TextStyle(
                    color: Color(0xFF949598),
                    fontSize: screenAwareSize(18.0, context),
                    fontFamily: "Montserrats-SemiBold")),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(left: screenAwareSize(20.0, context)),
            height: screenAwareSize(34.0, context),
            child: Row(
              children: colorsList(),
            ),
          ),
          SizedBox(
            height: screenAwareSize(6.0, context),
          ),
          Padding(
              padding: EdgeInsets.only(left: screenAwareSize(20.0, context)),
              child: Text('Price',
                  style: TextStyle(
                      color: Color(0xFF949598),
                      fontFamily: "Montserrats-SemiBold"))),
          Container(
            width: double.infinity,
            height: screenAwareSize(120.0, context),
            child: Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: screenAwareSize(22.0, context)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                            left: screenAwareSize(18.0, context)),
                        child: Row(
                          children: <Widget>[
                            Text(
                              '\$',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenAwareSize(26.0, context),
                                  fontFamily: "Montserrats-Medium"),
                            ),
                            SizedBox(width: screenAwareSize(2.0, context)),
                            Text('80',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: screenAwareSize(35.0, context),
                                    fontFamily: "Montserrats-Medium"))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: screenAwareSize(10.0, context),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: MaterialButton(
                          color: Color(0xFFFB382F),
                          padding: EdgeInsets.symmetric(
                              vertical: screenAwareSize(14.0, context)),
                          onPressed: () {},
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: screenAwareSize(35.0, context)),
                              child: Text(
                                'Add To Card',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Montserrats-Medium",
                                    fontSize: screenAwareSize(18.0, context)),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  right: -40.0,
                  bottom: -45.0,
                  child: Image.asset(
                    "assets/cart.png",
                    width: screenAwareSize(190.0, context),
                    height: screenAwareSize(155.0, context),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget SizeItem(String size, bool isSelected, BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(left: 12.0),
    child: Container(
      width: screenAwareSize(30.0, context),
      height: screenAwareSize(30.0, context),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: isSelected ? Color(0xFFFC3930) : Color(0xFF525663),
          boxShadow: [
            BoxShadow(
                color:
                    isSelected ? Colors.black.withOpacity(.5) : Colors.black12,
                offset: Offset(0.0, 1.0)),
          ]),
      child: Center(
        child: Text(
          size,
          style: TextStyle(color: Colors.white, fontFamily: "Montserrats-Bold"),
        ),
      ),
    ),
  );
}

Widget divider() {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
    child: Container(
      width: 0.8,
      color: Colors.black,
    ),
  );
}

Widget colorList(
    Color color, bool isSelected, BuildContext context, VoidCallback _ontab) {
  return GestureDetector(
    onTap: _ontab,
    child: Padding(
      padding: EdgeInsets.only(left: screenAwareSize(10.0, context)),
      child: Container(
        width: screenAwareSize(30.0, context),
        height: screenAwareSize(30.0, context),
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(5.0),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(.8),
                      blurRadius: 10.0,
                      offset: Offset(0.0, 10.0),
                    )
                  ]
                : []),
        child: ClipPath(
          clipper: MClipper(),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: color,
          ),
        ),
      ),
    ),
  );
}

class MClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip

    var path = Path();

    path.lineTo(0.0, size.height);
    path.lineTo(size.width * 0.2, size.height);
    path.lineTo(size.width, size.height * 0.2);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
