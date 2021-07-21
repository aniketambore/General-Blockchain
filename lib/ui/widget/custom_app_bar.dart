import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:general_blockchain/ui/widget/button_round_with_shadow.dart';
import 'package:general_blockchain/ui/widget/custom_text.dart';
import 'package:general_blockchain/util/color.dart';

class CustomAppBar extends PreferredSize {
  final double height;
  final String bartext;
  final Widget child;

  CustomAppBar({@required this.height, this.child, this.bartext});

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      alignment: Alignment.bottomCenter,
      child: child != null
          ? child
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 24.0),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: ButtonRoundWithShadow(
                        size: 48,
                        borderColor: lightening_yellow,
                        color: lightening_yellow,
                        callback: () {
                          Navigator.pop(context);
                        },
                        shadowColor: wood_smoke,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: CustomText(
                    size: 27,
                    color: white,
                    alignment: Alignment.bottomCenter,
                    text: bartext,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    width: 20,
                  ),
                )
              ],
            ),
    );
  }
}
