import 'dart:io';
import 'package:aplikasi_magang/controller/IzinContorller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddIzin extends StatefulWidget {

  @override
  _AddIzinState createState() => _AddIzinState();
}

class _AddIzinState extends State<AddIzin> {
  final IzinController izinController = Get.put(IzinController());

  final TextEditingController uraianController = TextEditingController();
  final TextEditingController dueDateController = TextEditingController();

  File image;
  Future<File> openCamera() async {
    final image = await ImagePicker.pickImage(source: ImageSource.camera);
    File file = File(image != null ? image.path : "");
    return file;
  }

  DateTime _dueDate = DateTime.now();
  String _dateText = ''; //untuk menampilkan tanggal/kalendernya

  Future<void> _selectDueDate(BuildContext context) async {
    final picked = await showDatePicker(
        context: context,
        initialDate: _dueDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2090));

    if (picked != null) {
      //untuk cek user sudah pilih tanggal atau belum
      setState(() {
        _dueDate = picked;
        _dateText = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  DateTime _endDate = DateTime.now();
  String _dateTextTwo = ''; //untuk menampilkan tanggal/kalendernya

  Future<void> _selectEndDate(BuildContext context) async {
    final picked = await showDatePicker(
        context: context,
        initialDate: _endDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2090));

    if (picked != null) {
      //untuk cek user sudah pilih tanggal atau belum
      setState(() {
        _endDate = picked;
        _dateTextTwo = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  @override
  void initState() {
    //untuk ketika dibuka kalender akan menampilkan tanggal hari ini
    super.initState();
    _dateText = "${_dueDate.day}/${_dueDate.month}/${_dueDate.year}";
    _dateTextTwo = "${_endDate.day}/${_endDate.month}/${_endDate.year}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffd63031),
      appBar: AppBar(
        backgroundColor: const Color(0xffd63031),
        elevation: 0,
        title: const Text(
          "Pengajuan Izin",
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              height: 30,
              color: const Color(0xffd63031),
            ),
            // SizedBox(height: 500),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(7)),
                  color: Colors.white),
              width: 400,
              height: 600,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Keterangan",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 100,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 1),
                              ],
                            ),
                            child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 4),
                                margin: const EdgeInsets.only(top: 10),
                                child: Column(children: [
                                  buildUraian(),
                                ])),
                          ),
                          // Container(
                          //   height: 50,
                          //   width: double.infinity,
                          //   decoration: BoxDecoration(
                          //       color: Colors.grey.withOpacity(0.2),
                          //       borderRadius: const BorderRadius.only(
                          //           bottomRight: Radius.circular(15),
                          //           bottomLeft: Radius.circular(15)),
                          //       border: Border.all(
                          //           color: Colors.grey.withOpacity(0.5))),
                          // ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Tanggal Mulai",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                              padding: const EdgeInsets.all(10),
                              color: Colors.grey.withOpacity(0.2),
                              child: Row(
                                children: <Widget>[
                                  FlatButton(
                                      onPressed: () => izinController.selectTanggal(context),
                                      child: Obx(() => Text(
                                        izinController.dateText.value,
                                        style: const TextStyle(fontSize: 18),
                                      ),)),
                                ],
                              )),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "Tanggal Selesai",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                              padding: const EdgeInsets.all(10),
                              color: Colors.grey.withOpacity(0.2),
                              child: Row(
                                children: <Widget>[
                                  FlatButton(
                                      onPressed: () => izinController.selectSelesai(context),
                                      child: Obx(() => Text(
                                        izinController.dateTextTwo.value,
                                        style: const TextStyle(fontSize: 18),
                                      ),)),
                                ],
                              )),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "Lampiran",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: RaisedButton(
                              color: const Color(0xffd63031),
                              padding: const EdgeInsets.only(
                                  top: 10, bottom: 10, left: 10, right: 20),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              onPressed: () {
                             izinController.chooseImage();
                              },
                              child: const Text(
                                "Ambil Gambar Lampiran",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                              margin: const EdgeInsets.only(top: 20),
                              height: 40.0,
                              width: 300.0,
                              child: InkWell(
                                  onTap: () {izinController.pressSubmit(context);},
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color: const Color(0xffd63031),
                                          borderRadius:
                                              BorderRadius.circular(13)),
                                      child: Column(children: const <Widget>[
                                        Spacer(),
                                        Text("Ajukan Izin",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Color(0xFFFFFFFF),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20.0)),
                                        Spacer(),
                                      ]))))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildUraian() => TextField(
        controller: izinController.keterangan,
        decoration: const InputDecoration(
          hintText: 'Masukkan Uraian Kegiatan',
          // border: InputBorder.none(),
        ),
        textInputAction: TextInputAction.done,
      );
}