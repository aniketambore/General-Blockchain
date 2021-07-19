class MineBlockModel {
  int index;
  String message;
  String previousHash;
  int proof;
  String timestamp;

  MineBlockModel(
      {this.index,
      this.message,
      this.previousHash,
      this.proof,
      this.timestamp});

  MineBlockModel.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    message = json['message'];
    previousHash = json['previous_hash'];
    proof = json['proof'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['index'] = this.index;
    data['message'] = this.message;
    data['previous_hash'] = this.previousHash;
    data['proof'] = this.proof;
    data['timestamp'] = this.timestamp;
    return data;
  }
}
