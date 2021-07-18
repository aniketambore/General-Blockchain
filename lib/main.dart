import 'package:flutter/material.dart';
import 'package:general_blockchain/get_chain.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<BlockchainModel> blockchainModel;

  @override
  void initState() {
    super.initState();
    blockchainModel = fetchChain();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("General Blockchain"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        getChain();
                        setState(() {});
                      },
                      child: Text("Get Chain")),
                  SizedBox(
                    width: 5,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        mine_block();
                      },
                      child: Text("Mine Block"))
                ],
              ),
              getChain()
            ],
          ),
        ),
      ),
    );
  }

  getChain() {
    return FutureBuilder<BlockchainModel>(
      future: blockchainModel,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            padding: EdgeInsets.all(10),
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return Text(snapshot.data.chain[index]["timestamp"]);
            },
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        // By default, show a loading spinner.
        return CircularProgressIndicator();
      },
    );
  }

  mine_block() async {
    await http
        .get(Uri.parse('https://general-blockchain.herokuapp.com/mine_block'));
  }
}
