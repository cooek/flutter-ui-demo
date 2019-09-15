import 'package:flutter/material.dart';
import 'package:flutter_app_ui/Data/guidedata.dart';
import 'package:flutter_app_ui/view/guide/pageIndicator.dart';
import 'package:gradient_text/gradient_text.dart';
import 'package:flutter_app_ui/view/HomPage.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_app_ui/view/Login/Login.dart';

class GuideView extends StatefulWidget {
  @override
  _GuideViewState createState() => _GuideViewState();
}

class _GuideViewState extends State<GuideView> with TickerProviderStateMixin {
  PageController controller;

  int currentpage = 0;
  bool islastPage = false;
  AnimationController animationController;
  Animation<double> _scaleAnim;

  @override
  void initState() {
    if (Platform.isAndroid) {
      var systemUiOverlayStyle =
          SystemUiOverlayStyle(statusBarColor: Color(0xFF485563));
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }

    // TODO: implement initState
    super.initState();
    controller = PageController(initialPage: currentpage);
    animationController =
        AnimationController(duration: Duration(milliseconds: 300), vsync: this);
    _scaleAnim = Tween(begin: 0.6, end: 1.0).animate(animationController);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();

    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xFF485563), Color(0xFF29323C)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.clamp,
              stops: ([0.0, 1.0]))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            PageView.builder(
                itemCount: pageList.length,
                controller: controller,
                onPageChanged: (idx) {
                  setState(() {
                    currentpage = idx;
                    if (currentpage == pageList.length - 1) {
                      islastPage = true;
                      animationController.forward();
                    } else {
                      islastPage = false;
                    }
                  });
                },
                itemBuilder: (BuildContext context, idx) {
                  return Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      AnimatedBuilder(
                        animation: controller,
                        builder: (context, child) {
                          var page = pageList[idx];
                          var delta;
                          var y = 1.0;
                          if (controller.position.haveDimensions) {
                            delta = controller.page - idx;
                            y = 1 - delta.abs().clamp(0.0, 1.0);
                          }
                          return Column(
                            children: <Widget>[
                              SizedBox(height: 5),
                              Image.asset(page.imageUrl),
                              Container(
                                height: 80.0,
                                margin: EdgeInsets.only(left: 12.0),
                                child: Stack(
                                  children: <Widget>[
                                    Opacity(
                                      opacity: .10,
                                      child: GradientText(
                                        page.title,
                                        gradient: LinearGradient(
                                            colors: page.titleGradient),
                                        style: TextStyle(
                                            fontSize: 100.0,
                                            fontFamily: "Montserrat-Black",
                                            letterSpacing: -1.0),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 30.0, top: 22.0),
                                      child: GradientText(
                                        page.title,
                                        gradient: LinearGradient(
                                            colors: page.titleGradient),
                                        style: TextStyle(
                                            fontSize: 70.0,
                                            fontFamily: "Montserrat-Black",
                                            letterSpacing: 1.0),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 12.0, left: 34.0),
                                child: Transform(
                                  transform: Matrix4.translationValues(
                                      0.0, 50 * (1 - y), 0.0),
                                  child: Text(
                                    page.body,
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontFamily: "Montserrat-Medium",
                                      color: Color(0xFF989898),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          );
                        },
                      )
                    ],
                  );
                }),
            Positioned(
              left: 30.0,
              bottom: 55.0,
              child: Container(
                width: 160.0,
                child: PageIndicator(
                  curentIndx: currentpage,
                  pageCount: pageList.length,
                ),
              ),
            ),
            Positioned(
                right: 30.0,
                bottom: 30.0,
                child: ScaleTransition(
                  scale: _scaleAnim,
                  child: islastPage
                      ? FloatingActionButton(
                          backgroundColor: Colors.white,
                          child: Icon(Icons.arrow_forward, color: Colors.black),
                          onPressed: () {
//                            Navigator.push(
//                                context,
//                                MaterialPageRoute(
//                                    builder: (BuildContext context) =>
//                                        Login()));
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) => Login()),
                                (route) => route == null);
                          },
                        )
                      : Container(),
                ))
          ],
        ),
      ),
    );
  }
}
