import 'package:flutter/material.dart';
import 'package:general_blockchain/home.dart';
import 'package:general_blockchain/ui/get_chain.dart';
import 'package:general_blockchain/ui/mine_block.dart';
import 'package:general_blockchain/ui/scan_block.dart';
import 'package:general_blockchain/util/color.dart';

import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, widget) => ResponsiveWrapper.builder(
          BouncingScrollWrapper.builder(context, widget),
          maxWidth: 1100,
          minWidth: 450,
          defaultScale: true,
          breakpoints: [
            ResponsiveBreakpoint.resize(450, name: MOBILE),
            ResponsiveBreakpoint.autoScale(800, name: TABLET),
            ResponsiveBreakpoint.autoScale(1000, name: TABLET),
            ResponsiveBreakpoint.resize(1200, name: DESKTOP),
            ResponsiveBreakpoint.autoScale(2460, name: "4K"),
          ],
          background: Container(
              decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.grey, Colors.blueGrey],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft),
          ))),
      theme: ThemeData(primarySwatch: Colors.blue, primaryColor: persian_blue),
//      home: HomePage(),
      initialRoute: "/",
      routes: {
        "/": (context) => HomePage(),
        "/get-chain": (context) => GetChain(),
        "/mine-block": (context) => MineBlock(),
        "/scan-chain": (context) => ScanBlock()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
