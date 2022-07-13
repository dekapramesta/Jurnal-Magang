import 'dart:convert';
import 'dart:developer';
import 'package:aplikasi_magang/network/api.dart';
import 'package:aplikasi_magang/nav.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class RegisterController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final namalengkap = TextEditingController();
  final nim = TextEditingController();
  final asal_sekolah = TextEditingController();
  final email = TextEditingController();
  final nomor = TextEditingController();
  final password = TextEditingController();
  final conf_pass = TextEditingController();
  final kode_instasni = TextEditingController();

  DateTime _dueDate = DateTime.now();
  var dateText = ''.obs;
  DateTime _endDate = DateTime.now();
  var dateTextTwo = ''.obs;

   @override
  void onInit() {
    dateText.value = "${_dueDate.day}/${_dueDate.month}/${_dueDate.year}";
    dateTextTwo.value = "${_endDate.day}/${_endDate.month}/${_endDate.year}";
    super.onInit();
  }

  Future<void> selectTanggal(BuildContext context) async {
    final picked = await showDatePicker(
        context: context,
        initialDate: _dueDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2090));

    if (picked != null) {
      //untuk cek user sudah pilih tanggal atau belum

      _dueDate = picked;
      dateText.value = "${picked.day}/${picked.month}/${picked.year}";
    }
    inspect(dateText.value);
  }

   Future<void> selectSelesai(BuildContext context) async {
    final picked = await showDatePicker(
        context: context,
        initialDate: _endDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2090));

    if (picked != null) {
      //untuk cek user sudah pilih tanggal atau belum

      _endDate = picked;
      dateTextTwo.value = "${picked.day}/${picked.month}/${picked.year}";
    }
    inspect(dateTextTwo);
  }


  Future<void> pressRegis(context) async {
    Get.focusScope?.unfocus();
    var data = {'email': email.text, 'password': password.text, 'nama_lengkap':namalengkap.text,'nim':nim.text,'sekolah':asal_sekolah.text,'no_wa':nomor.text,'code_ins':kode_instasni.text,'conf_pass':conf_pass.text, 'tgl_mulai':dateText.value, 'tgl_selesai':dateTextTwo.value};

    var res = await Api().auth(data, 'Register');
    Map<String, dynamic> body = new Map<String, dynamic>.from(json.decode(res.body));
    inspect(body['status']);
    if(body['status'] == true){
       Navigator.pop(context);
        var snackBar = const SnackBar(
          content: Text('Sukses Daftar'),
          backgroundColor: Colors.green,
        );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }else{
        var snackBar = const SnackBar(
          content: Text("Gagal Daftar"),
          backgroundColor: Colors.red,
        );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);

    }


    inspect(data);
    // inspect(email);
    
  }
//untuk menampilkan tanggal/kalendernya

}