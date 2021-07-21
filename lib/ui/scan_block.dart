import 'package:flutter/material.dart';
import 'package:general_blockchain/model/scan_block_model.dart';
import 'package:general_blockchain/network/network.dart';
import 'package:general_blockchain/ui/widget/loader_card.dart';
import 'package:general_blockchain/util/color.dart';
import 'package:general_blockchain/util/constant.dart';
import 'widget/custom_app_bar.dart';

class ScanBlock extends StatefulWidget {
  @override
  _ScanBlockState createState() => _ScanBlockState();
}

class _ScanBlockState extends State<ScanBlock> {
  Future<ScanBlockModel> scanBlockObject;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scanBlockObject = Network().scanBlock();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: persian_blue,
      appBar: CustomAppBar(
        height: 100,
        bartext: "Scan Chain",
      ),
      body: Container(
        child: FutureBuilder<ScanBlockModel>(
          future: Future.delayed(Duration(seconds: 3), () {
            return scanBlockObject;
          }),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return scanIt(snapshot);
            }
            return Center(
              child: LoaderCard(
                loaderUrl: loaderUrl["scanChain"],
              ),
            );
          },
        ),
      ),
    );
  }

  scanIt(AsyncSnapshot<ScanBlockModel> snapshot) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
          child: Container(
        padding: EdgeInsets.all(24),
        width: 400,
        height: 300,
        decoration: ShapeDecoration(
            color: foam,
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
        child: Center(
          child: Text(
            snapshot.data.message,
            style: TextStyle(
                color: persian_blue, fontSize: 40, fontWeight: FontWeight.w800),
          ),
        ),
      )),
    );
  }
}
