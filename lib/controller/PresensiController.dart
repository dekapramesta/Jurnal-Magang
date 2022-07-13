import 'dart:convert';
import 'dart:developer';
import 'package:aplikasi_magang/network/api.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PresensiController extends GetxController {
  final formKey = GlobalKey<FormState>();
  var data_array = [].obs;
    var onShow = true.obs;


  @override
  void onInit() {
    getPresensi();
    super.onInit();
  }

  getPresensi() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();

    final id_magang = localStorage.getString('id_magang');
    final token = localStorage.getString('token');
    var data = {'id_magang': id_magang , 'token': token};
     var res = await Api().auth(data, 'Presensi/ById');
    // var uri = 'Desa/Keluhan?id_warga=' + id.replaceAll('"', '');
    // var res = await Api().get(uri.toString());

    var body = json.decode(res.body);
    data_array.value = body;
    inspect(data_array);
    inspect('tes');

  }
}