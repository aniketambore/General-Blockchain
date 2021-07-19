import 'package:flutter/material.dart';
import 'package:general_blockchain/model/scan_block_model.dart';
import 'package:general_blockchain/network/network.dart';

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
      appBar: AppBar(
        title: Text("Scan Block"),
      ),
      body: Container(
        child: FutureBuilder<ScanBlockModel>(
          future: scanBlockObject,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data.message);
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
