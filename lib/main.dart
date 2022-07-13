import 'package:aplikasi_magang/nav.dart';
import 'package:aplikasi_magang/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {    
  runApp(MyApp()); 
}
 
class MyApp extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Jurnal Magang',  
        theme: ThemeData(primarySwatch: Colors.red, fontFamily: 'Baumans'),
        home: SplashPage());
  }
}
