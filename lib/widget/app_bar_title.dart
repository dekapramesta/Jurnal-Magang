import 'package:aplikasi_magang/res/custom_color.dart';
import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(width: 8),
        Text(
          'Jurnal Magang',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: CustomColors.firebaseYellow,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
