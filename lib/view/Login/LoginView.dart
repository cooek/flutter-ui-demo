import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: ScreenUtil.getInstance().setHeight(500),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, 15.0),
                blurRadius: 15.0),
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, -10.0),
                blurRadius: 10.0)
          ]),
      child: Padding(
        padding:
        EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Login',
              style: TextStyle(
                  fontSize: ScreenUtil.getInstance().setSp(45),
                  fontFamily: "Poppins-Bold",
                  letterSpacing: .6),
            ),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(30),
            ),
            Text('Username',
                style: TextStyle(
                    fontFamily: "Poppins - Nedium",
                    fontSize:
                    ScreenUtil.getInstance().setSp(26))),
            TextField(
              decoration: InputDecoration(
                  hintText: "username",
                  hintStyle: TextStyle(
                      color: Colors.grey, fontSize: 12.0)),
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'password',
                hintStyle:
                TextStyle(color: Colors.grey, fontSize: 12.0),
              ),
            ),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(35.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text("Forgot Password?",style: TextStyle(
                    color: Colors.blue,
                    fontSize: ScreenUtil.getInstance().setSp(28))
                )],
            )
          ],
        ),
      ),
    );
  }
}
