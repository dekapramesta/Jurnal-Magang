import 'dart:async';
import 'package:aplikasi_magang/nav.dart';
import 'package:flutter/material.dart';
// import 'package:flutterlogindesign/utils/color.dart';
import 'package:aplikasi_magang/login_screen.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(milliseconds: 4000), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(),
        child: Center(
          child: Image.asset("assets/images/jm_logo1.png"),
        ),
      ),
    );
  }
}
