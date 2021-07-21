import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:general_blockchain/model/get_chain_model.dart';
import 'package:general_blockchain/network/network.dart';
import 'package:general_blockchain/ui/widget/loader_card.dart';
import 'package:general_blockchain/util/constant.dart';
import 'widget/button_round_with_shadow.dart';
import 'package:general_blockchain/util/color.dart';
import 'widget/custom_text.dart';
import 'widget/custom_app_bar.dart';

class GetChain extends StatefulWidget {
  @override
  _GetChainState createState() => _GetChainState();
}

class _GetChainState extends State<GetChain> {
  Future<GetChainModel> getChainObject;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getChainObject = Network().getChain();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: persian_blue,
      appBar: CustomAppBar(
        height: 100,
        bartext: "Get Chain",
        child: null,
      ),
      body: Container(
        child: FutureBuilder<GetChainModel>(
          future: Future.delayed(Duration(seconds: 3), () {
            return getChainObject;
          }),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print(snapshot.data.chain[0].timestamp);
              return Column(
                children: [Spacer(), bottomView(snapshot, context), Spacer()],
              );
            } else {
              return Center(
                  child: LoaderCard(
                loaderUrl: loaderUrl["getChain"],
              ));
            }
          },
        ),
      ),
    );
  }

  bottomView(snapshot, context) {
    var chain = snapshot.data.chain;
    return Container(
      height: 300,
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(top: 100.0, bottom: 90),
          child: Container(
            width: 30.0,
            color: caribbean_color,
          ),
        ),
        itemCount: chain.length,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: ChainCard(
              snapshot: snapshot,
              index: index,
            ),
          );
        },
      ),
    );
  }
}

class ChainCard extends StatelessWidget {
  final AsyncSnapshot<GetChainModel> snapshot;
  final int index;
  ChainCard({this.snapshot, this.index});

  @override
  Widget build(BuildContext context) {
    var blockIndex = snapshot.data.chain[index].index;
    var blockProof = snapshot.data.chain[index].proof;
    var previousHash = snapshot.data.chain[index].previousHash;
    var timestamp = snapshot.data.chain[index].timestamp;

    int max = 11;

    int randomNumber = Random().nextInt(max);

    return Container(
        padding: EdgeInsets.all(24),
        width: 300,
        decoration: ShapeDecoration(
            color: colors[randomNumber],
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 23,
                  backgroundColor: persian_blue,
                  child: Text(
                    blockIndex.toString(),
                    style: TextStyle(color: white),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Proof : $blockProof",
                  style: TextStyle(
                      fontSize: 15, color: trout, fontWeight: FontWeight.w800),
                )
              ],
            ),
            Text(
              "Previous Hash :",
              style: TextStyle(
                  fontSize: 20, color: trout, fontWeight: FontWeight.w600),
            ),
            Flexible(
              child: Text(
                previousHash,
                style: TextStyle(
                    fontSize: 18,
                    color: wood_smoke,
                    fontWeight: FontWeight.w800),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            index == 0
                ? Text(
                    "Genesis Block",
                    style: TextStyle(
                        fontSize: 20,
                        color: persian_blue,
                        fontWeight: FontWeight.bold),
                  )
                : Text(""),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Timestamp : ",
                  style: TextStyle(
                      fontSize: 15, color: trout, fontWeight: FontWeight.w800),
                ),
                Text(
                  timestamp,
                  style: TextStyle(
                      fontSize: 13,
                      color: wood_smoke,
                      fontWeight: FontWeight.w800),
                )
              ],
            )
          ],
        ));
  }
}
