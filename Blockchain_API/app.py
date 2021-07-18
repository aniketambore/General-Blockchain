import blockchain
from flask import Flask, jsonify

# Part 2 - Mining a Blockchain

# Creating a Web App
app = Flask(__name__)

# Creating a Blockchain
blockchain = blockchain.Blockchain()


# Mining a new block
@app.route("/mine_block", methods=["GET"])
def mine_block():
    previous_block = blockchain.get_previous_block()
    previous_proof = previous_block["proof"]
    proof = blockchain.proof_of_work(previous_proof)

    previous_hash = blockchain.hash(previous_block)

    block = blockchain.create_block(proof, previous_hash)

    response = {
        "message": "Congratulation, You just mined a block!",
        "index": block["index"],
        "timestamp": block["timestamp"],
        "proof": block["proof"],
        "previous_hash": block["previous_hash"]
    }

    response = jsonify(response)

    # Enable Access-Control-Allow-Origin
    response.headers.add("Access-Control-Allow-Origin", "*")
    return response, 200


# Getting the full Blockchain
@app.route("/get_chain", methods=["GET"])
def get_chain():
    response = {
        "chain": blockchain.chain,
        "length": len(blockchain.chain)
    }

    response = jsonify(response)

    # Enable Access-Control-Allow-Origin
    response.headers.add("Access-Control-Allow-Origin", "*")
    return response, 200


# Checking if the Blockchain is valid
@app.route("/is_valid", methods=["GET"])
def is_valid():
    is_valid = blockchain.is_chain_valid(blockchain.chain)
    if is_valid:
        response = {"message": "All good, the blockchain is valid."}
    else:
        response = {"message": "Houston, we have a problem. The Blockchain is not valid."}
    return jsonify(response), 200


# Running the app
# app.run(host="0.0.0.0", port=5000)
if __name__ == "__main__":
    app.run(debug=True)