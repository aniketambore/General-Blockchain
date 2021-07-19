import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:general_blockchain/model/get_chain_model.dart';
import 'package:general_blockchain/network/network.dart';

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
      appBar: AppBar(
        title: Text("Get Chain"),
      ),
      body: Container(
        child: FutureBuilder<GetChainModel>(
          future: getChainObject,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
//                  print(snapshot.data.chain[0].timestamp);
              return ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: snapshot.data.chain.length,
                itemBuilder: (context, index) {
                  return midView(snapshot.data.chain[index]);
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  midView(Chain block) {
    var index = block.index;
    var proof = block.proof;
    var previous_hash = block.previousHash;
    var timestamp = block.timestamp;

    return Container(
      child: Column(
        children: [
          Text(index.toString()),
          Text(proof.toString()),
          Text(previous_hash),
          Text(timestamp)
        ],
      ),
    );
  }
}
