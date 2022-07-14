import 'dart:io';
import 'package:aplikasi_magang/controller/AddPresensi.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';

class AddPresensi extends StatefulWidget {
  @override
  _AddPresensiState createState() => _AddPresensiState();
}

class _AddPresensiState extends State<AddPresensi> {
  final AddPresensiController addPresensi =
      Get.put(AddPresensiController());
  File image;
  Future<File> openCamera() async {
    final image = await ImagePicker.pickImage(source: ImageSource.camera);
    File file = File(image != null ? image.path : "");
    return file;
  }

  final items = ['Masuk', 'Pulang'];
  String value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Presensi"),
          backgroundColor: const Color(0xffd63031),
        ),
        resizeToAvoidBottomInset: false,
        body: Stack(children: <Widget>[
          Container(
              alignment: Alignment.center,
              child: Column(children: <Widget>[
                Container(
                    margin: const EdgeInsets.only(top: 20),
                    height: 530.0,
                    width: 330.0,
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xffd63031)),
                        borderRadius: BorderRadius.circular(13),
                        color: const Color(0xFFFFFFFF)),
                    child: Column(children: <Widget>[
                      Container(
                          alignment: Alignment.center,
                          child: Column(children: <Widget>[
                            Container(
                                margin:
                                    const EdgeInsets.only(top: 40, right: 170),
                                child: Column(children: const <Widget>[
                                  Text("Pilih Presensi",
                                      style: TextStyle(
                                          color: Color(0xffd63031),
                                          fontFamily: "Baumans",
                                          fontSize: 15.0)),
                                ]))
                          ])),
                      Container(
                          alignment: Alignment.center,
                          child: Obx(() => Container(
                            margin: const EdgeInsets.all(16),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border:
                                  Border.all(color: const Color(0xffd63031)),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: addPresensi.selected.value,
                                iconSize: 36,
                                icon: const Icon(Icons.arrow_drop_down,
                                    color: Color(0xffd63031)),
                                isExpanded: true,
                                items: items.map(buildMenuItem).toList(),
                                onChanged: (value) =>
                                   addPresensi.setSelected(value),
                              ),
                            ),
                          ),)),
                      Container(
                        alignment: Alignment.center,
                        child: Column(children: <Widget>[
                          Container(
                              margin:
                                  const EdgeInsets.only(top: 20, right: 160),
                              child: Column(children: const <Widget>[
                                Text("Ambil Gambar",
                                    style: TextStyle(
                                        color: Color(0xFF09310C),
                                        fontFamily: "Baumans",
                                        fontSize: 15.0)),
                              ])),
                          const SizedBox(height: 10),
                          RaisedButton(
                            color: const Color(0xffd63031),
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            onPressed: () {
                             addPresensi.chooseImage();
                            },
                            child: const Text(
                              "Ambil Gambar",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          RaisedButton(
                            color: const Color(0xffd63031),
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            onPressed: () {
                            addPresensi.pressSubmit(context);
                              // profileController.pressProf(context);
                            },
                            child: const Text(
                              "Kirim Presensi",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ])),
                const SizedBox(height: 10),
              ]))
        ]));
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Text(item,
          style: const TextStyle(color: Color(0xffd63031), fontSize: 15)));

  // Widget buildKeterangan() => TextField(
  //       controller: keteranganController,
  //       decoration: const InputDecoration(
  //         hintText: 'Masukkan Keterangan',
  //         prefixIcon: Icon(Icons.document_scanner),
  //         border: OutlineInputBorder(),
  //       ),
  //       textInputAction: TextInputAction.done,
  //     );

  // Widget buildLokasi() => TextField(
  //       controller: lokasiController,
  //       decoration: const InputDecoration(
  //         hintText: 'Masukkan Lokasi',
  //         prefixIcon: Icon(Icons.location_city),
  //         border: OutlineInputBorder(),
  //       ),
  //       textInputAction: TextInputAction.done,
  //     );
}
