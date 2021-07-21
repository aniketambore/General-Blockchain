import 'package:flutter/material.dart';
import 'package:general_blockchain/util/color.dart';

class LoaderCard extends StatelessWidget {
  final String loaderUrl;
  LoaderCard({this.loaderUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 24),
        padding: EdgeInsets.all(24),
//        width: 300,
        decoration: ShapeDecoration(
            color: dandelion,
            shadows: [
              BoxShadow(
                color: wood_smoke,
                offset: Offset(
                  0.0, // Move to right 10  horizontally
                  4.0, // Move to bottom 5 Vertically
                ),
              )
            ],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                side: BorderSide(color: wood_smoke, width: 2))),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Image.network(
              loaderUrl,
              height: 200,
              width: 300,
              fit: BoxFit.cover,
            ),
          ],
        ));
  }
}
