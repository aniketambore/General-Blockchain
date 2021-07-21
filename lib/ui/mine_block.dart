import 'dart:async';

import 'package:flutter/material.dart';
import 'package:general_blockchain/model/mine_block_model.dart';
import 'package:general_blockchain/network/network.dart';
import 'package:general_blockchain/ui/widget/loader_card.dart';
import 'package:general_blockchain/util/constant.dart';
import 'widget/button_round_with_shadow.dart';
import 'package:general_blockchain/util/color.dart';
import 'widget/custom_text.dart';
import 'widget/custom_app_bar.dart';

class MineBlock extends StatefulWidget {
  @override
  _MineBlockState createState() => _MineBlockState();
}

class _MineBlockState extends State<MineBlock> {
  Future<MineBlockModel> mineBlockObject;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mineBlockObject = Network().mineBlock();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: persian_blue,
      appBar: CustomAppBar(
        height: 100,
        bartext: "Mine Block",
      ),
      body: Container(
        child: FutureBuilder<MineBlockModel>(
          future: Future.delayed(Duration(seconds: 3), () {
            return mineBlockObject;
          }),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return mineMessage(snapshot);
            }
            return Center(
                child: LoaderCard(
              loaderUrl: loaderUrl["mineBlock"],
            ));
          },
        ),
      ),
    );
  }

  mineMessage(AsyncSnapshot<MineBlockModel> snapshot) {
    return Center(
        child: Container(
      height: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      padding: EdgeInsets.all(24),
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            "Mine Block",
            style: TextStyle(
                color: persian_blue, fontSize: 30, fontWeight: FontWeight.w800),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Index : ${snapshot.data.index}",
                style: TextStyle(
                    color: wood_smoke,
                    fontSize: 22,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                "Proof : ${snapshot.data.proof}",
                style: TextStyle(
                    color: wood_smoke,
                    fontSize: 22,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                "Previous Hash : ${snapshot.data.previousHash}",
                style: TextStyle(
                    color: wood_smoke,
                    fontSize: 22,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                "Timestamp : ${snapshot.data.timestamp}",
                style: TextStyle(
                    color: wood_smoke,
                    fontSize: 22,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: Text(
              snapshot.data.message,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: black, fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    ));
  }
}
