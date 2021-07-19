class GetChainModel {
  List<Chain> chain;
  int length;

  GetChainModel({this.chain, this.length});

  GetChainModel.fromJson(Map<String, dynamic> json) {
    if (json['chain'] != null) {
      chain = new List<Chain>();
      json['chain'].forEach((v) {
        chain.add(new Chain.fromJson(v));
      });
    }
    length = json['length'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.chain != null) {
      data['chain'] = this.chain.map((v) => v.toJson()).toList();
    }
    data['length'] = this.length;
    return data;
  }
}

class Chain {
  int index;
  String previousHash;
  int proof;
  String timestamp;

  Chain({this.index, this.previousHash, this.proof, this.timestamp});

  Chain.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    previousHash = json['previous_hash'];
    proof = json['proof'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['index'] = this.index;
    data['previous_hash'] = this.previousHash;
    data['proof'] = this.proof;
    data['timestamp'] = this.timestamp;
    return data;
  }
}
