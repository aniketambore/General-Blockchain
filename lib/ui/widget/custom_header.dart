import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:general_blockchain/util/color.dart';
import 'custom_text.dart';

class CustomHeader extends StatelessWidget {
  String lineOneText;
  String lineTwotext;
  Color fg_color;
  Color bg_color;
  Color color;
  double fontSize;

  CustomHeader(
      {this.lineOneText,
      this.lineTwotext,
      this.color,
      this.fg_color,
      this.bg_color,
      this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Stack(
            children: <Widget>[
              // Stroked text as border.
              Text(
                lineOneText,
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w800,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 1
                    ..color = fg_color,
                ),
              ),
              // Solid text as fill.
              Text(
                lineOneText,
                style: TextStyle(
                    fontSize: fontSize,
                    color: bg_color,
                    fontWeight: FontWeight.w800),
              ),
            ],
          ),
          CustomText(
            text: lineTwotext,
            alignment: Alignment.centerLeft,
            size: fontSize,
            color: color,
          ),
        ],
      ),
    );
  }
}
