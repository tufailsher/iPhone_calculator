import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foodapp/Constants.dart';

import 'FirstRoute.dart';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
        Duration(
            milliseconds: 5000
        ),
            () {
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => FirstRoute()));
      });
    }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: Colors.black,
        child: Text("iPhone,s Calculator",
        style: kSplshScreenText,
        ),
      ),
    ),
    );
  }
}
