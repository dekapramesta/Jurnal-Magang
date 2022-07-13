import 'dart:convert';
import 'dart:developer';
import 'package:aplikasi_magang/nav.dart';
import 'package:aplikasi_magang/network/api.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  final formKey = GlobalKey<FormState>();
  var nama = TextEditingController();
  var nim = TextEditingController();
  var asal_sekolah = TextEditingController();
  var nomor = TextEditingController();
  var email = "".obs;
  var emailEdit = TextEditingController();

  var onShow = true.obs;




  @override
  void onInit() {
    getProfile();
    super.onInit();
  }

  getProfile() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();

    final id_user = localStorage.getString('id_user');
    final token = localStorage.getString('token');
    var data = {'id_user': id_user , 'token': token};
     var res = await Api().auth(data, 'Profile');
      Map<String, dynamic> body = new Map<String, dynamic>.from(json.decode(res.body));
      nama.text = body['nama_lengkap'];
      nim.text = body['nim'];
      asal_sekolah.text = body['sekolah'];
      nomor.text = body['no_wa'];
      emailEdit.text = body['email'];

      inspect(emailEdit);

    // var uri = 'Desa/Keluhan?id_warga=' + id.replaceAll('"', '');
    // var res = await Api().get(uri.toString());

    // var body = json.decode(res.body);
    // data_array.value = body;
    // inspect(data_array);
    // inspect('tes');

  }
  Future<void> pressProf(context) async {
    Get.focusScope?.unfocus();
        SharedPreferences localStorage = await SharedPreferences.getInstance();

    var data = {'nama_lengkap':nama.text,'nim':nim.text,'email':emailEdit.text,'no_wa':nomor.text,'sekolah':asal_sekolah.text,'id_user':localStorage.getString('id_user'),'token':localStorage.getString('token')};
    var res = await Api().auth(data, 'Profile/PfUpdate');
    inspect(data);
    if(res.statusCode == 200){
        var snackBar = const SnackBar(
          content: Text('Update Berhasil'),
          backgroundColor: Colors.green,
        );
        // inspect(body['data']['id_magang']);

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Get.delete<ProfileController>();
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Nav()),
        );
    }else{
        var snackBar = const SnackBar(
          content: Text('Gagal Update'),
          backgroundColor: Colors.red,
        );
        // inspect(body['data']['id_magang']);

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    //  Map<String, dynamic> body = new Map<String, dynamic>.from(json.decode(res.body));



    // inspect(res);
    // inspect(email);
    
  }
}