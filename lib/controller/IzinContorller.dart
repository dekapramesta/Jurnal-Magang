import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:aplikasi_magang/nav.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class IzinController extends GetxController {
  final formKey = GlobalKey<FormState>();
  DateTime _dueDate = DateTime.now();
  var dateText = ''.obs;

  DateTime _endDate = DateTime.now();
  var dateTextTwo = ''.obs;
  var keterangan = TextEditingController();
  final selected = "".obs;
  File uploadimage;
  File file;
  var onShow = true.obs;

  void setSelected(String value) {
    selected.value = value;
  }

  Future<void> chooseImage() async {
    var choosedimage = await ImagePicker.pickImage(source: ImageSource.camera);
    uploadimage = File(choosedimage != null ? choosedimage.path : "");
    file = File(uploadimage.path);
    inspect(file);
  }
//untuk menampilkan tanggal/kalendernya

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

  Future<void> pressSubmit(context) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    inspect(localStorage.getString('token'));
    Get.focusScope?.unfocus();
    inspect(keterangan);
    var request = http.MultipartRequest("POST",
        Uri.parse('https://jurnalmagang.aeritechnology.com/Api/Presensi/Izin'));
    request.fields['id_magang'] = localStorage.getString('id_magang');
    request.fields['token'] = localStorage.getString('token');
    request.fields['tgl_mulai'] = dateText.value;
    request.fields['tgl_akhir'] = dateTextTwo.value;
    request.fields['keperluan'] = keterangan.text;

    request.files.add(http.MultipartFile.fromBytes(
        'lampiran', File.fromUri(file.uri).readAsBytesSync(),
        filename: file.path));

    // http.StreamedResponse response = await request.send();
    var response = await request.send();
    var responsed = await http.Response.fromStream(response);
    inspect(responsed.body);

    inspect(response);
    if (response.statusCode == 200) {
      var snackBar = const SnackBar(
        content: Text('Izin berhasil dikirim'),
        backgroundColor: Colors.green,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Nav()),
      );
    } else {
      var snackBar = const SnackBar(
        content: Text('Izin gagal dikirm'),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
