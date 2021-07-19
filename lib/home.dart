import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:general_blockchain/util/color.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    return Scaffold(
        body: Center(
            child: Container(
                constraints: BoxConstraints.expand(),
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [persian_blue, trout])),
                child: MediaQuery.of(context).size.width < 500
                    ? lowerResolution(context)
                    : greaterResolution(context))));
  }

  Widget titleText() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        "General Blockchain",
        style:
            TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: athens),
      ),
    );
  }

  customCardContainer(method, url, context, size) {
    return Container(
      color: santas_gray,
//      width: 300,
      width: size == 0 ? MediaQuery.of(context).size.width / 3.5 : size,
      child: Card(
          elevation: 10,
          child: Column(
            children: [
              Image.network(
                url,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(onPressed: () {}, child: Text(method)),
              )
            ],
          )),
    );
  }

  greaterResolution(context) {
    return Column(
      children: [
        titleText(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            customCardContainer("Get-Chain",
                "https://i.ibb.co/dP7gLQN/blockchain-2.png", context, 0),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 300),
                customCardContainer("Mine-Block",
                    "https://i.ibb.co/hck2DBk/gpu-mining-2.png", context, 0)
              ],
            ),
            customCardContainer("Scan-Chain",
                "https://i.ibb.co/dP7gLQN/blockchain-2.png", context, 0)
          ],
        ),
      ],
    );
  }

  lowerResolution(context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            titleText(),
            customCardContainer("Get-Chain",
                "https://i.ibb.co/dP7gLQN/blockchain-2.png", context, 250),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(),
                customCardContainer("Mine-Block",
                    "https://i.ibb.co/hck2DBk/gpu-mining-2.png", context, 250),
              ],
            ),
            customCardContainer("Scan-Chain",
                "https://i.ibb.co/dP7gLQN/blockchain-2.png", context, 250)
          ],
        ),
      ),
    );
  }
}
