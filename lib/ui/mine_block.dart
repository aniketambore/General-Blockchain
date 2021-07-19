import 'package:flutter/material.dart';
import 'package:general_blockchain/model/mine_block_model.dart';
import 'package:general_blockchain/network/network.dart';

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
      appBar: AppBar(
        title: Text("Mine Block"),
      ),
      body: Container(
        child: FutureBuilder<MineBlockModel>(
          future: mineBlockObject,
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
