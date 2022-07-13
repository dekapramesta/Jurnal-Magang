import 'package:flutter/material.dart';
// import 'package:aplikasi_magang/utils/color.dart';

class ButtonWidget extends StatelessWidget {
  var btnText = "";
  var onClick;

  ButtonWidget({this.btnText, this.onClick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
          // gradient: LinearGradient(
          //     colors: [orangeColors, orangeLightColors],
          //     end: Alignment.centerLeft,
          //     begin: Alignment.centerRight),
          color: const Color(0xffd63031),
          borderRadius: BorderRadius.all(
            Radius.circular(100),
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          btnText,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
