import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aplikasi_magang/controller/TambahJurnalController.dart';

class AddJurnal extends StatefulWidget {
  @override
  _AddJurnalState createState() => _AddJurnalState();
}

class _AddJurnalState extends State<AddJurnal> {
  final TambahJurnalController TjhController =
      Get.put(TambahJurnalController());

  final TextEditingController uraianController = TextEditingController();
  final TextEditingController dueDateController = TextEditingController();

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

  @override
  void initState() {
    //untuk ketika dibuka kalender akan menampilkan tanggal hari ini
    super.initState();
    _dateText = "${_dueDate.day}/${_dueDate.month}/${_dueDate.year}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffd63031),
      appBar: AppBar(
        backgroundColor: const Color(0xffd63031),
        elevation: 0,
        title: const Text(
          "Jurnal",
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
              margin: const EdgeInsets.symmetric(horizontal: 30),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(7)),
                  color: Colors.white),
              width: 400,
              height: 600,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Uraian Kegiatan",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 150,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(15),
                                    topLeft: Radius.circular(15)),
                                border: Border.all(
                                    color: Colors.grey.withOpacity(0.5))),
                            child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 4),
                                margin: const EdgeInsets.only(top: 10),
                                child: Column(children: [
                                  buildUraian(),
                                ])),
                          ),
                          Container(
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.2),
                                borderRadius: const BorderRadius.only(
                                    bottomRight: Radius.circular(15),
                                    bottomLeft: Radius.circular(15)),
                                border: Border.all(
                                    color: Colors.grey.withOpacity(0.5))),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Tanggal",
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
                                      onPressed: () => _selectDueDate(context),
                                      child: Text(
                                        _dateText,
                                        style: const TextStyle(fontSize: 18),
                                      )),
                                ],
                              )),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                              margin: const EdgeInsets.only(top: 20),
                              height: 40.0,
                              width: 300.0,
                              child: InkWell(
                                  onTap: () {
                                    TjhController.pressSubmit(context);
                                  },
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color: const Color(0xffd63031),
                                          borderRadius:
                                              BorderRadius.circular(13)),
                                      child: Column(children: const <Widget>[
                                        Spacer(),
                                        Text("Tambah",
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
        controller: TjhController.uraian,
        decoration: const InputDecoration(
          hintText: 'Masukkan Uraian Kegiatan',
          // border: InputBorder.none(),
        ),
        textInputAction: TextInputAction.done,
      );
}
