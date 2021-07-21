import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:general_blockchain/util/color.dart';
import 'package:general_blockchain/util/constant.dart';
import 'ui/widget/custom_text.dart';
import 'ui/widget/custom_app_bar.dart';
import 'ui/widget/custom_header.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: persian_blue,
      appBar: CustomAppBar(
        height: 100,
        child: CustomHeader(
          lineOneText: "General",
          lineTwotext: "Blockchain",
          color: lightening_yellow,
          bg_color: white,
          fg_color: wood_smoke,
          fontSize: MediaQuery.of(context).size.width > 500 ? 44 : 34,
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MediaQuery.of(context).size.width > 500
                  ? greaterResolution(context)
                  : lowerResolution(context),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: InkWell(
                        child: CustomText(
                          color: athen_gray,
                          size: 44,
                          weight: FontWeight.w800,
                          alignment: Alignment.centerLeft,
                          text: "<General Blockchain Intuition/>",
                        ),
                        onTap: () => launchURL(
                            "https://github.com/aniketambore/General-Blockchain"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: InkWell(
                        child: CustomText(
                          color: lightening_yellow,
                          size: 21,
                          weight: FontWeight.w500,
                          alignment: Alignment.centerLeft,
                          text: "<Github/>",
                        ),
                        onTap: () => launchURL(
                            "https://github.com/aniketambore/General-Blockchain"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void launchURL(url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';

  greaterResolution(context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CardWidget(
            url: methodUrl["getChain"],
            method: methodName[0],
            size: 0,
            routeName: "get-chain",
          ),
          CardWidget(
            url: methodUrl["mineBlock"],
            method: methodName[1],
            size: 0,
            routeName: "mine-block",
          ),
          CardWidget(
            url: methodUrl["getChain"],
            method: methodName[2],
            size: 0,
            routeName: "scan-chain",
          ),
        ],
      ),
    );
  }

  lowerResolution(context) {
    return Container(
      child: Column(
        children: [
          CardWidget(
            url: methodUrl["getChain"],
            method: methodName[0],
            size: 300,
            routeName: "get-chain",
          ),
          SizedBox(
            height: 8,
          ),
          CardWidget(
            url: methodUrl["mineBlock"],
            method: methodName[1],
            size: 300,
            routeName: "mine-block",
          ),
          SizedBox(
            height: 8,
          ),
          CardWidget(
            url: methodUrl["getChain"],
            method: methodName[2],
            size: 300,
            routeName: "scan-chain",
          ),
          SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  final String url;
  final String method;
  final double size;
  final String routeName;
  CardWidget({this.url, this.method, this.size, this.routeName});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size == 0 ? MediaQuery.of(context).size.width / 3.5 : size,
      decoration: ShapeDecoration(
          shadows: [
            BoxShadow(
              color: wood_smoke,
              offset: Offset(0, 2),
            )
          ],
          color: white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              side: BorderSide(
                color: wood_smoke,
                width: 2,
              ))),
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(4),
            child: Image.network(
              url,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
              right: 14,
              bottom: 14,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/$routeName");
                  },
                  child: Text(method),
                  style: ElevatedButton.styleFrom(
                    primary: wood_smoke,
                    textStyle:
                        TextStyle(color: white, fontWeight: FontWeight.bold),
                  )))
        ],
      ),
    );
  }
}
