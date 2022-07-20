import 'package:flutter/material.dart';
import 'package:aplikasi_magang/widget/contact_model.dart';
import 'package:cool_alert/cool_alert.dart';

class ProjectPage extends StatefulWidget {
  @override
  _ProjectPageState createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
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
                child: ListView.builder(
                    itemCount: contacts.length,
                    itemBuilder: (BuildContext context, int index) {
                      // return item
                      return ContactItem(
                        contacts[index].projectName,
                        contacts[index].projectCategory,
                        contacts[index].isSelected,
                        index,
                      );
                    }),
              ),
              selectedContacts.length > 0
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
                            "Selesai (${selectedContacts.length})",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          onPressed: () => confirm(),
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }

  Widget ContactItem(
      String projectName, String projectCategory, bool isSelected, int index) {
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
      subtitle: Text(projectCategory),
      trailing: isSelected
          ? Icon(
              Icons.check_circle,
              color: Color(0xffd63031),
            )
          : Icon(
              Icons.check_circle_outline,
              color: Colors.grey,
            ),
      onTap: () {
        setState(() {
          contacts[index].isSelected = !contacts[index].isSelected;
          if (contacts[index].isSelected == true) {
            selectedContacts
                .add(ContactModel(projectName, projectCategory, true));
          } else if (contacts[index].isSelected == false) {
            selectedContacts.removeWhere((element) =>
                element.projectName == contacts[index].projectCategory);
          }
        });
      },
    );
  }

  void confirm() {
    AlertDialog alert = AlertDialog(
      title: Text("Selesaikan Project "),
      actions: [
        TextButton(
          child: Text('Konfirmasi'),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    );

    showDialog(context: context, builder: (context) => alert);
    return;
  }
}
