import 'package:flutter/material.dart';

class Izin extends StatefulWidget {
  
  const Izin({Key key}) : super(key: key);

  @override
  _IzinState createState() => _IzinState();
}

class _IzinState extends State<Izin> {
  get firebaseGreen => null;

  // final RiwayatSuratSkbController skbController =
  //     Get.put(RiwayatSuratSkbController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Riwayat Izin"),
          // centerTitle: true,
          backgroundColor: const Color(0xffd63031),
        ),
        resizeToAvoidBottomInset: false,
        body: Column(children: <Widget>[
          Expanded(
              child: ListView(children: [
            // for (var items in skbController.data_skb)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                  width: double.infinity,
                  height: 100,
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: const Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xFF5D4037))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              height: 35,
                              width: 35,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                        'assets/images/camera.png',
                                      )))),
                          Expanded(
                              child: Container(
                            margin: const EdgeInsets.only(left: 30),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width * 2,
                                      child:
                                          const Text("13/06/2022 - 13/06/2022 ",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                color: Color(0xFF5D4037),
                                                fontFamily: "Baumans",
                                                fontSize: 18.0,
                                              ))),
                                  const Text("Sakit",
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          color: Color(0xFF5D4037),
                                          fontFamily: "Baumans",
                                          fontSize: 19.0)),
                                  // if (items['status_skb'] == "0") ...[
                                  //   const Text('Diproses',
                                  //       textAlign: TextAlign.justify,
                                  //       style: TextStyle(
                                  //           color: Color(0xFF5D4037),
                                  //           fontFamily: "Baumans",
                                  //           fontSize: 13.0)),
                                  // ] else if (items['status_skb'] ==
                                  //     "1") ...[
                                  //   const Text('Proses',
                                  //       textAlign: TextAlign.justify,
                                  //       style: TextStyle(
                                  //           color: Color(0xFF5D4037),
                                  //           fontFamily: "Baumans",
                                  //           fontSize: 13.0)),
                                  // ] else ...[
                                  //   const Text('Ditolak',
                                  //       textAlign: TextAlign.justify,
                                  //       style: TextStyle(
                                  //           color: Color(0xFF5D4037),
                                  //           fontFamily: "Baumans",
                                  //           fontSize: 13.0)),
                                ]),
                          )),
                        ],
                      ),
                    ],
                  )),
            ),
          ]))
        ]));
  }
}
