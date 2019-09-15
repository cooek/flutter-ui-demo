import 'package:flutter/material.dart';

class Sciallocons extends StatelessWidget {
  final List<Color> colors;
  final IconData iconData;
  final Function onpressd;

  Sciallocons({this.colors, this.iconData, this.onpressd});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:14.0),
      child: Container(
        width: 45.0,
        height: 45.0,
        decoration: BoxDecoration(
          shape:BoxShape.circle,
          gradient: LinearGradient(colors: colors,tileMode: TileMode.clamp)
        ),
        child: RawMaterialButton(onPressed:onpressd,shape: CircleBorder(),
          child:Icon(iconData,color: Colors.white,)

        ),
      ),
    );
  }
}
