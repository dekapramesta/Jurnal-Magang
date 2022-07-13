import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

import 'package:aplikasi_magang/controller/JHController.dart';
import 'package:get/get.dart';


class Jurnal extends StatefulWidget {
  // const Jurnal({Key? key}) : super(key: key);

  @override
  _JurnalState createState() => _JurnalState();
}

class _JurnalState extends State<Jurnal> {
  final JHController jurnalController = Get.put(JHController());

  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;

  List<Widget> itemsData = [];

  void getPostsData() async{
    List<Widget> listItems = [];
     listItems.add(Obx(() => Column(
      children: [
        for (var post in jurnalController.data_array) 
        Container(
          height: 150,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20.0)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
              ]),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      post["uraian"],
                      style: const TextStyle(
                          fontSize: 23, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      post["tanggal_jurnal"],
                      style: const TextStyle(fontSize: 17, color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ],
            ),
          ))]),
    ),);
    
    setState(() {
      itemsData = listItems;
    });
  }

  @override
  void initState() {
    super.initState();
    getPostsData();
    controller.addListener(() {
      double value = controller.offset / 119;

      setState(() {
        topContainer = value;
        closeTopContainer = controller.offset > 50;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double categoryHeight = size.height * 0.30;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color(0xffd63031),
          elevation: 0,
          title: const Text(
            "Jurnal",
            style: TextStyle(fontSize: 25),
          ),
        ),
        body: SizedBox(
          height: size.height,
          child: Column(
            children: <Widget>[
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   children: const <Widget>[
              //     Text(
              //       "Dashboard",
              //       style: TextStyle(
              //           color: Colors.black54,
              //           fontWeight: FontWeight.bold,
              //           fontSize: 20),
              //     ),
              //   ],
              // ),
              const SizedBox(
                height: 10,
              ),
              // AnimatedOpacity(
              //   duration: const Duration(milliseconds: 200),
              //   opacity: closeTopContainer ? 0 : 1,
              //   child: AnimatedContainer(
              //       duration: const Duration(milliseconds: 200),
              //       width: size.width,
              //       alignment: Alignment.topCenter,
              //       height: closeTopContainer ? 0 : categoryHeight,
              //       child: categoriesScroller),
              // ),
              // isi listview
              Expanded(
                
                  child: ListView.builder(
                      controller: controller,
                      itemCount: itemsData.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        double scale = 1.0;
                        if (topContainer > 0.5) {
                          scale = index + 0.5 - topContainer;
                          if (scale < 0) {
                            scale = 0;
                          } else if (scale > 1) {
                            scale = 1;
                          }
                        }
                        return Opacity(
                          opacity: scale,
                          child: Transform(
                            transform: Matrix4.identity()..scale(scale, scale),
                            alignment: Alignment.bottomCenter,
                            child: Align(
                                heightFactor: 0.7,
                                alignment: Alignment.topCenter,
                                child: itemsData[index]),
                          ),
                        );
                      })),
            ],
          ),
        ),
      ),
    );
  }
}
