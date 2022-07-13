import 'dart:convert';
import 'dart:developer';
import 'package:aplikasi_magang/network/api.dart';
import 'package:aplikasi_magang/nav.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();

  var onShow = true.obs;

  Future<void> pressLogin(context) async {
    Get.focusScope?.unfocus();
    // inspect(email);
    var data = {'email': email.text, 'password': password.text};
    // inspect(data);
    if (email.text == '' || password.text == '') {
      if (email.text == '') {
        var snackBar = const SnackBar(
          content: Text('Email kosong'),
          backgroundColor: Colors.red,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else if (password.text == '') {
        var snackBar = const SnackBar(
          content: Text('Password kosong'),
          backgroundColor: Colors.red,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        var snackBar = const SnackBar(
          content: Text('Email dan password belum dimasukkan'),
          backgroundColor: Colors.red,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    
    } else {
      inspect('kene');
      var res = await Api().auth(data, 'Login');
      Map<String, dynamic> body = new Map<String, dynamic>.from(json.decode(res.body));
      inspect('as');
      // Map<String, dynamic> body = json.decode(res.body);
      // List<dynamic> token = body["token"]  ;

      // var token =jsonDecode(body['data'])['token'] as String;
      // inspect(res);
     
      if (body['status']) {
         var id_magang = body['data']['id_magang'];
      var id_user = body['data']['id_user'];
      var token = body['data']['token'];
      var email = body['data']['email'];
            inspect(id_magang);

        inspect('tes');
        
        SharedPreferences localStorage = await SharedPreferences.getInstance();
        Navigator.push(context, MaterialPageRoute(builder: (context) => Nav()));
        var snackBar = const SnackBar(
          content: Text('Login berhasil'),
          backgroundColor: Colors.green,
        );
        // inspect(body['data']['id_magang']);

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        localStorage.setString('user', jsonEncode(body['data']));
        localStorage.setString('id_user', id_user);
        localStorage.setString('id_magang', id_magang);
        localStorage.setString('email', email);
        localStorage.setString('token',token);

        
        inspect(json.encode(body['data']));
      } else {
        debugPrint('email atau pass salah');
          var snackBar = const SnackBar(
          content: Text('Email atau Password Salah'),
          backgroundColor: Colors.red,
        );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);


      }
    }
  }
}