import 'package:http/http.dart' as http;
import 'dart:convert';

Future<BlockchainModel> fetchChain() async {
  final response = await http
      .get(Uri.parse('https://general-blockchain.herokuapp.com/get_chain'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return BlockchainModel.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class BlockchainModel {
  final int length;
  final List chain;

  BlockchainModel({
    this.length,
    this.chain,
  });

  factory BlockchainModel.fromJson(Map<String, dynamic> json) {
    return BlockchainModel(
      length: json['length'],
      chain: json['chain'],
    );
  }
}
