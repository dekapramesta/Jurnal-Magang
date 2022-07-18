import 'package:aplikasi_magang/controller/RiwayatIzinController.dart';
import 'package:flutter/material.dart';
import 'package:aplikasi_magang/widget/herder_container.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Izin extends StatelessWidget {
  final RiwayatIzinController riwayatIzinController =
      Get.put(RiwayatIzinController());

  // Tanggal List Here
 

  @override
  Widget build(BuildContext context) {
    // MediaQuery to get Device Width
    double width = MediaQuery.of(context).size.width * 0.6;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Histori Pengajuan Izin"),
          // centerTitle: true,
          backgroundColor: const Color(0xffd63031),
        ),
        // Main List View With Builder
        body: Obx(
          () => ListView.builder(
            itemCount: riwayatIzinController.data_array.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  // This Will Call When User Click On ListView Item
                  showDialogFunc(
                      context,
                      "https://jurnalmagang.aeritechnology.com/assets/images/lampiran_izin/${riwayatIzinController.data_array[index]['lampiran']}",
                      riwayatIzinController.data_array[index]['keperluan'],
                      // riwayatIzinController.data_array[index]['tgl_mulai'],
                      DateFormat.yMMMd().format(DateTime.parse(riwayatIzinController.data_array[index]['tanggal_mulai']) ) ,
                      DateFormat.yMMMd().format(DateTime.parse(riwayatIzinController.data_array[index]['tanggal_selesai']) ), 
                      );
                },
                // Card Which Holds Layout Of ListView Item
                child: Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 50,
                        height: 50,
                        child: Image.network(
                            "https://jurnalmagang.aeritechnology.com/assets/images/lampiran_izin/${riwayatIzinController.data_array[index]['lampiran']}"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "${riwayatIzinController.data_array[index]['keperluan']}",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey.shade800,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: width,
                              child: Text(
                                " Tanggal Mulai Izin : ${DateFormat.yMMMd().format(DateTime.parse(riwayatIzinController.data_array[index]['tanggal_mulai']) ) }",
                                maxLines: 3,
                                style: TextStyle(
                                    fontSize: 15, color: Colors.grey[500]),
                              ),
                            ),
                            Container(
                              width: width,
                              child: Text(
                                " Tanggal Selesai Izin :  ${DateFormat.yMMMd().format(DateTime.parse(riwayatIzinController.data_array[index]['tanggal_selesai']) ) }",
                                maxLines: 3,
                                style: TextStyle(
                                    fontSize: 15, color: Colors.grey[500]),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ));
  }
}

showDialogFunc(context, img, title, tgl_mulai,tgl_selesai) {
  return showDialog(
    context: context,
    builder: (context) {
      return Center(
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            padding: EdgeInsets.all(15),
            height: 320,
            width: MediaQuery.of(context).size.width * 0.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                    img,
                    width: 200,
                    height: 200,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  // width: 200,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "${tgl_mulai} - ${tgl_selesai}",
                      maxLines: 3,
                      style: TextStyle(fontSize: 15, color: Colors.grey[500]),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
