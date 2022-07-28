import 'dart:developer';

import 'package:aplikasi_magang/controller/ProjectController.dart';
import 'package:flutter/material.dart';
import 'package:aplikasi_magang/widget/contact_model.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:get/get.dart';

class ProjectPage extends StatefulWidget {
  @override
  _ProjectPageState createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
    final ProjectController projectController = Get.put(ProjectController());

  List<ContactModel> contacts = [
    ContactModel("Aplikasi Jurnal Magang Android", "Team", false),
    ContactModel("Website Pelayanan Desa", "Team", false),
    ContactModel("Website Jual Beli HP Bekas", "Team", false),
    ContactModel("Aplikasi Jurnal Magang Android", "Team", false),
    ContactModel("Desain UI Aplikasi Magang", "Individu", false),
    ContactModel("Website Pelayanan Desa", "Team", false),
    ContactModel("Aplikasi Jurnal Magang Android", "Individu", true),
  ];

  List<ContactModel> selectedContacts = List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffd63031),
        elevation: 0,
        title: const Text(
          "Jurnal",
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Expanded(
                child:Obx(() =>  ListView.builder(
                    itemCount: projectController.data_array.length,
                    itemBuilder: (BuildContext context, int index) {
                      // return item
                      return ContactItem(
                        projectController.data_array[index]['task'],
                       int.parse( projectController.data_array[index]['on_project']),
                        int.parse(projectController.data_array[index]['status_task']) == 0 ? false : true,
                        int.parse(projectController.data_array[index]['id_task']),
                        index,
                      );
                    })),
              ),
              Obx(() => projectController.selectedList.length > 0
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 10,
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        child: RaisedButton(
                          color: Color(0xffd63031),
                          child: Text(
                            "Selesai (${projectController.selectedList.length})",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          onPressed: () => confirm(),
                        ),
                      ),
                    )
                  : Container(),)
            ],
          ),
        ),
      ),
    );
  }

  Widget ContactItem(
      String projectName, int projectCategory, bool isSelected, int checker, int index) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Color(0xffd63031),
        child: Icon(
          Icons.assessment_outlined,
          color: Colors.white,
        ),
      ),
      title: Text(
        projectName,
        style: TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(projectCategory == 0 ? "Individu":"Team" ),
      trailing: isSelected == false
          ? Obx(() => projectController.selectedList.contains(checker) ?  Icon(
              Icons.check_circle,
              color: Color.fromARGB(255, 211, 20, 20),
            ) :  Icon(
              Icons.check_circle,
              color: Color.fromARGB(255, 175, 164, 164),
            ),):null,
      onTap: () {
        
        projectController.checking_array(checker) ;
        
      },
    );
  }
  

  void confirm() {
    AlertDialog alert = AlertDialog(
      title: Text("Selesaikan Project "),
      actions: [
        TextButton(
          child: Text('Konfirmasi'),
          onPressed: () {
projectController.submit(context);
           Navigator.pop(context);

          } ,
        ),
      ],
    );

    showDialog(context: context, builder: (context) => alert);
    return;
  }
}
