import 'dart:convert';
import 'package:general_blockchain/model/get_chain_model.dart';
import 'package:general_blockchain/model/mine_block_model.dart';
import 'package:general_blockchain/model/scan_block_model.dart';
import 'package:http/http.dart' as http;

class Network {
  Future<GetChainModel> getChain() async {
    var url = "http://127.0.0.1:5000/get_chain";

    final response = await http.get(Uri.parse(url));

//    print("URL is ${Uri.encodeFull(url)}");

    if (response.statusCode == 200) {
      return GetChainModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Error Getting Block Data");
    }
  }

  Future<MineBlockModel> mineBlock() async {
    var url = "http://127.0.0.1:5000/mine_block";

    final response = await http.get(Uri.parse(url));

//    print("URL is ${Uri.encodeFull(url)}");

    if (response.statusCode == 200) {
      return MineBlockModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Error Getting Block Data");
    }
  }

  Future<ScanBlockModel> scanBlock() async {
    var url = "http://127.0.0.1:5000/is_valid";

    final response = await http.get(Uri.parse(url));

//    print("URL is ${Uri.encodeFull(url)}");

    if (response.statusCode == 200) {
      return ScanBlockModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Error Getting Block Data");
    }
  }
}
