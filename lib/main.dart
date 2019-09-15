import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app_ui/constant/counstom.dart';
import 'package:flutter_app_ui/Data/data.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_app_ui/view/HomPage.dart';
import 'package:flutter_app_ui/view/Login/Login.dart';
import 'package:flutter_app_ui/view/guide/guide.dart';
import 'package:flutter_app_ui/view/shop/shop.dart';
void main() {
  if(Platform.isAndroid){
    var systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Color(0xFF2D3447));
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);

  }
  runApp(MaterialApp(
    routes: {
      'login':(BuildContext context)=>Login(),
      'guide':(BuildContext context) =>GuideView(),
      'homepage':(BuildContext context)=>HomePage(),

    },
    home: GuideView(),
    debugShowCheckedModeBanner: false,
  ));
}

