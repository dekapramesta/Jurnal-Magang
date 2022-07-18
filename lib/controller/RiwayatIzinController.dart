import 'dart:convert';
import 'dart:developer';
import 'package:aplikasi_magang/network/api.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RiwayatIzinController extends GetxController {
  final formKey = GlobalKey<FormState>();
  var data_array = [].obs;
    var onShow = true.obs;


  @override
  void onInit() {
    getIzin();
    super.onInit();
  }

  getIzin() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();

    final id_magang = localStorage.getString('id_magang');
    final token = localStorage.getString('token');
    var data = {'id_magang': id_magang , 'token': token};
     var res = await Api().auth(data, 'Presensi/IzinById');
    // var uri = 'Desa/Keluhan?id_warga=' + id.replaceAll('"', '');
    // var res = await Api().get(uri.toString());

    var body = json.decode(res.body);
    data_array.value = body;
    var tgl = DateTime.parse(data_array[0]['tanggal_mulai']);
    inspect(DateFormat.yMMMEd().format(tgl));
    inspect('tes');

  }
}