import 'dart:io';
import 'package:aplikasi_magang/add_izin_screen.dart';
import 'package:aplikasi_magang/izin_screen.dart';
import 'package:aplikasi_magang/jurnal_screen.dart';
import 'package:aplikasi_magang/presensi_screen.dart';

import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
      Container(
          height: 240.0,
          width: 430.0,
          decoration: const BoxDecoration(color: Color(0xffd63031)),
          child: Column(children: <Widget>[])),
      Container(
          alignment: Alignment.center,
          child: Column(children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 180),
              height: 500.0,
              width: 330.0,
              decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffd63031)),
                  borderRadius: BorderRadius.circular(13),
                  color: const Color(0xFFFFFFFF)),
            )
          ])),
      // Container(
      //   alignment: Alignment.center,
      //   child: Column(children: <Widget>[
      //     Container(
      //         margin: const EdgeInsets.only(top: 50),
      //         height: 140.0,
      //         width: 350.0,
      //         decoration: BoxDecoration(
      //             border: Border.all(color: const Color(0xFF5D4037)),
      //             borderRadius: BorderRadius.circular(6),
      //             color: const Color(0xFFFFFFFF)),
      //
      //     ),
      //   ]),
      // ),
      Container(
        alignment: Alignment.bottomLeft,
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 280, left: 40),
              height: 120.0,
              width: 120.0,
              child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Jurnal()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xffd63031)),
                        borderRadius: BorderRadius.circular(13),
                        color: const Color(0xFFFFFFFF)),
                    child: Column(children: <Widget>[
                      const Spacer(),
                      Image.asset(
                        'assets/images/journal.png',
                        height: 80.0,
                        width: 80.0,
                      ),
                      const Spacer(),
                      const Text("Jurnal Harian",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Baumans",
                              fontSize: 14.0))
                    ]),
                  )),
            )
          ],
        ),
      ),
      Container(
        alignment: Alignment.bottomLeft,
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 460, left: 40),
              height: 120.0,
              width: 120.0,
              child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AddIzin()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xffd63031)),
                        borderRadius: BorderRadius.circular(13),
                        color: const Color(0xFFFFFFFF)),
                    child: Column(children: <Widget>[
                      const Spacer(),
                      Image.asset(
                        'assets/images/schedule.png',
                        height: 80.0,
                        width: 80.0,
                      ),
                      const Spacer(),
                      const Text("Pengajuan Izin",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Baumans",
                              fontSize: 14.0))
                    ]),
                  )),
            )
          ],
        ),
      ),
      Container(
        alignment: Alignment.bottomLeft,
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 280, left: 200),
              height: 120.0,
              width: 120.0,
              child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Presensi()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xffd63031)),
                        borderRadius: BorderRadius.circular(13),
                        color: const Color(0xFFFFFFFF)),
                    child: Column(children: <Widget>[
                      const Spacer(),
                      Image.asset(
                        'assets/images/checked.png',
                        height: 80.0,
                        width: 80.0,
                      ),
                      const Spacer(),
                      const Text(" Histori Presensi",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Baumans",
                              fontSize: 14.0))
                    ]),
                  )),
            )
          ],
        ),
      ),
      Container(
        alignment: Alignment.bottomLeft,
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 460, left: 200),
              height: 120.0,
              width: 120.0,
              child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Izin()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xffd63031)),
                        borderRadius: BorderRadius.circular(13),
                        color: const Color(0xFFFFFFFF)),
                    child: Column(children: <Widget>[
                      const Spacer(),
                      Image.asset(
                        'assets/images/sign-out.png',
                        height: 80.0,
                        width: 80.0,
                      ),
                      const Spacer(),
                      const Text("Histori Izin",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Baumans",
                              fontSize: 14.0))
                    ]),
                  )),
            )
          ],
        ),
      ),
    ]));
  }
}
