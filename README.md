<div align="center">
    <img src="zREADME_Content/block_icon.png?raw=true" width="100px" alt="Blockchain Logo"/>
</div>

<h3 align="center">General Blockchain - A system to understand and explore, general blockchain intuition.</h3>

<div align="center">
    <img src="zREADME_Content/heading_banner.jpg?raw=true" alt="General Blockchain Logo"/>
</div>

<div align="center">

# [Working Website](https://general-blockchain.netlify.app/#/)

</div>

## Table of Contents

- [Setting up the development environment](#setting-up-the-development-environment)
- [Compiling and Migrating](#compiling-and-migrating)
- [Demonstration](#demonstration)
- [Proof Of Work](#proof-of-work)
- [Contributing](#contributing)

## Setting up the development environment

- Python [Flask](https://flask.palletsprojects.com/en/2.0.x/installation/) is used to create the general Blockchain API.
- Make sure to install [Flask](https://flask.palletsprojects.com/en/2.0.x/installation/) while running, `pip install Flask`
- Clone the project `git clone https://github.com/aniketambore/General-Blockchain.git`

## Compiling and Migrating

### Compilation
In the terminal, make sure you are in the **Blockchain_API** directory that contains the Python code, Run the following command:
**`python app.py`**

You should see output similar to the following:
<div align="center">
    <img src="zREADME_Content/blockchain_flask_api.png?raw=true" width="70%" alt="Flask Compile OP"/>
</div>

### Migration
Before we can migrate our Flutter app to the blockchain, we need to have a blockchain running.
Our local blockchain network in running on http://127.0.0.1:5000/
Therefore we can simply call the specific method which is defined in our Blockchain_API/blockchain.py.
- http://127.0.0.1:5000/get-chain
- http://127.0.0.1:5000/mine-block
- http://127.0.0.1:5000/scan-chain

```
📁 general_blockchain
   📁 lib
      📁 network
         🎯 network.dart
            It is used to link the blockchain with the flutter app.
```


## Demonstration
<div align="center">
    <img src="zREADME_Content/home_ss.png?raw=true" alt="Home Screen"/>
</div>

<div align="center">
    <img src="zREADME_Content/getChain_ss.png?raw=true" alt="Get Chain Screen"/>
</div>

<div align="center">
    <img src="zREADME_Content/mineBlock_ss.png?raw=true" alt="Mine Block Screen"/>
</div>

<div align="center">
    <img src="zREADME_Content/scanChain_ss.png?raw=true" alt="Scan Chain Screen"/>
</div>

## Proof Of Work
- The proof_of_work method is defined in `Blockchain_API/blockchain.py`
- Verifying the Proof Of Work Algorithm manually

Consider the Block1 and Block2 of the chain
<div align="center">
    <img src="zREADME_Content/pow_ss.png?raw=true" alt="Verifying Proof Of Work"/>
</div>

- Block1 => Proof = 1
- Block2 => Proof = 533

According to the algorithm :-
```python
import hashlib

hash_operation = hashlib.sha256(str(new_proof ** 2 - previous_proof ** 2).encode()).hexdigest()
```
The starting 4 character of the *hash_operation* has to be 4 leading zeros ("0000"), then only proof(nonce) is valid.
<div align="center">
    <img src="zREADME_Content/pow_cmd.png?raw=true" alt="Checking Proof Of Work"/>
</div>
As you can see the starting 4 digits of the hash_operation is 0s, Therefore 533 is a valid proof(nonce).


## Contributing:

 - Fork it!
 - Create your feature branch: `git checkout -b my-new-feature`
 - Commit your changes: `git commit -am 'Add some feature'`
 - Push to the branch: `git push origin my-new-feature`
 - Submit a pull request.


<h3 align="center">Show some ❤ and star the repo to support the project</h3>