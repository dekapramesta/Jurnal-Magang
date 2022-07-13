import 'package:aplikasi_magang/controller/PresensiController.dart';
import 'package:flutter/material.dart';
import 'package:aplikasi_magang/widget/herder_container.dart';
import 'package:get/get.dart';

class Presensi extends StatelessWidget {
    final PresensiController presensiController = Get.put(PresensiController());

  // Title List Here
  var tanggalList = [
    "2022-07-13",
    "2022-07-12",
    "2022-07-11",
    "2022-07-09",
    "2022-07-08",
    "2022-07-07",
    "2022-07-05"
  ];

  // Description List Here
  var timeList = [
    "08.00.",
    "16.00",
    "07.30",
    "16.50",
    "07.45",
    "16.30",
    "07.59"
  ];

  // Image Name List Here
  var imgList = [
    "assets/images/add.png",
    "assets/images/camera.png",
    "assets/images/journal.png",
    "assets/images/woman.png",
    "assets/images/add.png",
    "assets/images/woman.png",
    "assets/images/add.png"
  ];

  @override
  Widget build(BuildContext context) {
    // MediaQuery to get Device Width
    double width = MediaQuery.of(context).size.width * 0.6;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Histori Presensi"),
        // centerTitle: true,
        backgroundColor: const Color(0xffd63031),
      ),
      // Main List View With Builder
      body: Obx(() => ListView.builder(
        itemCount: presensiController.data_array.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // This Will Call When User Click On ListView Item
              showDialogFunc(
                  context, "https://jurnalmagang.aeritechnology.com/assets/images/foto_presensi/${presensiController.data_array[index]['foto_masuk']}", presensiController.data_array[index]['tanggal_presensi'], presensiController.data_array[index]['jam_presensi']);
            },
            // Card Which Holds Layout Of ListView Item
            child: Card(
              child: Row(
                children: <Widget>[
                  Container(
                    width: 50,
                    height: 50,
                    child: Image.network("https://jurnalmagang.aeritechnology.com/assets/images/foto_presensi/${presensiController.data_array[index]['foto_masuk']}"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "${presensiController.data_array[index]['tanggal_presensi']}",
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
                            " Jam Masuk : ${presensiController.data_array[index]['jam_presensi']}",
                            maxLines: 3,
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[500]),
                          ),
                        ),
                         Container(
                          width: width,
                          child: Text(
                            " Jam Pulang :  ${presensiController.data_array[index]['jam_pulang'] != null ? presensiController.data_array[index]['jam_pulang']:null}",
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
      ),)
    );
  }
}

showDialogFunc(context, img, title, desc) {
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
                      desc,
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
