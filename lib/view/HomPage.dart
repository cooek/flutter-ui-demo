import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app_ui/Data/data.dart';

import 'package:flutter_app_ui/constant/counstom.dart';
import 'package:flutter_app_ui/view/Login/Login.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_app_ui/view/shop/shop.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

var cardAspectRatio = 12.0 / 16.0;
var widgetAspect = cardAspectRatio * 1.2;

class _HomePageState extends State<HomePage> {
  var currentPage = images.length - 1.0;

  @override
  Widget build(BuildContext context) {
    if(Platform.isAndroid){

      var systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Color(0xFF2D3447));
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);

    }


    PageController controller = PageController(initialPage: images.length - 1);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page;
      });
    });

    _indexitemTop(int item){
      if(item==images.length-1){
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) =>ShopView()));
      }
    }

    return Scaffold(
      backgroundColor: Color(0xFF2D3447),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  left: 12.0, right: 12.0, top: 30.0, bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.menu),
                    color: Colors.white,
                  ),
                  IconButton(
                    icon: Icon(Icons.trending_flat),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>ShopView()));
                    },
                    color: Colors.white,
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Favourite',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 46.0,
                          letterSpacing: 1.0,
                          fontFamily: "Calibre-Semibold")),
                  IconButton(
                      icon: Icon(CounstomIcos.option, size: 12.0),
                      onPressed: () {})
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xFFff6e6e),
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 22.0, vertical: 6.0),
                        child: Text('Latest',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                  SizedBox(width: 15.0),
                  Text('9+ Stories', style: TextStyle(color: Colors.blueAccent))
                ],
              ),
            ),
            Stack(
              children: <Widget>[
                CardScrollWidget(currentPage),
                Positioned.fill(
                    child: PageView.builder(

                      reverse: true,
                      controller: controller,
                      itemCount: images.length,
                      itemBuilder: (controller, idx) {
                        return Container();
                      },

                    )),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Trending',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 46.0,
                          letterSpacing: 1.0,
                          fontFamily: "Calibre-Semibold")),
                  IconButton(
                      icon: Icon(CounstomIcos.option, size: 12.0),
                      onPressed: () {})
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xFFff6e6e),
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 22.0, vertical: 6.0),
                        child: Text('Animated',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                  SizedBox(width: 15.0),
                  Text('25+ Stories',
                      style: TextStyle(color: Colors.blueAccent))
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 18.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.asset(
                        "assets/image_02.jpg",
                        width: 296.0,
                        height: 222.0,
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CardScrollWidget extends StatelessWidget {
  var currentpage;
  var padding = 20.0;
  var vertiaclinset = 20.0;

  CardScrollWidget(this.currentpage);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: widgetAspect,
      child: LayoutBuilder(builder: (context, contracins) {
        var maxWidth = contracins.maxWidth;

        var maxHeight = contracins.maxHeight;

        var sefewidth = maxWidth - 2 * padding;
        var sefheight = maxHeight - 2 * padding;

        var heightofPrim = sefheight;
        var widofPrim = heightofPrim * cardAspectRatio;

        var primaryleft = sefewidth - widofPrim;

        var horizontallinst = primaryleft / 2;

        List<Widget> cardList = List();

        for (var i = 0; i < images.length; i++) {
          var delta = i - currentpage;
          bool isonRight = delta > 0;

          var start = padding +
              max(primaryleft - horizontallinst * -delta * (isonRight ? 15 : 1),
                  0.0);

          var cardItem = Positioned.directional(
            top: padding + vertiaclinset * max(-delta, 0.0),
            bottom: padding + vertiaclinset * max(-delta, 0.0),
            start: start,
            textDirection: TextDirection.rtl,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Container(
                decoration: BoxDecoration(
//                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          offset: Offset(3.0, 6.0),
                          blurRadius: 10.0)
                    ]),
                child: AspectRatio(
                  aspectRatio: cardAspectRatio,
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Image.asset(images[i], fit: BoxFit.cover),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8.0),
                              child: Text(title[i],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25.0,
                                      fontFamily: "SF-Pro-Text-Regular")),
                            ),
                            SizedBox(height: 10.0),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 12.0, bottom: 12.0),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 22.0, vertical: 6.0),
                                decoration: BoxDecoration(
                                    color: Colors.blueAccent,
                                    borderRadius: BorderRadius.circular(20.0)),
                                child: Text('Read Later',
                                    style: TextStyle(color: Colors.white)),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
          cardList.add(cardItem);
        }
        return Stack(
          children: cardList,
        );
      }),
    );
  }
}
