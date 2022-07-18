import 'package:aplikasi_magang/controller/RegisterController.dart';
import 'package:aplikasi_magang/login_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:aplikasi_magang/widget/btn_widget.dart';
import 'package:aplikasi_magang/widget/herder_container.dart';
import 'package:aplikasi_magang/nav.dart';
import 'package:get/get.dart';

class Regist extends StatefulWidget {
  @override
  _RegistState createState() => _RegistState();

}

class _RegistState extends State<Regist> {
      final RegisterController regisController = Get.put(RegisterController());

  final TextEditingController namaController = TextEditingController();
  final TextEditingController nisnController = TextEditingController();
  final TextEditingController sekolahController = TextEditingController();
  final TextEditingController nomorController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController kodeInstansiController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController konfirmasiPasswordController =
      TextEditingController();
  final TextEditingController tanggalMulaiMagangController =
      TextEditingController();
  final TextEditingController tanggalSelesaiMagangController =
      TextEditingController();
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
      body: Stack(alignment: Alignment.center, children: [
        Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: CustomPaint(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
            ),
            //masukne sini
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(15.0),
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 5),
                  shape: BoxShape.circle,
                  color: Colors.white,
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/woman.png'),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(
                  right: 20, left: 20, top: 20, bottom: 40),
              children: <Widget>[
                nameTextField(),
                const SizedBox(
                  height: 15,
                ),
                nisnTextField(),
                const SizedBox(
                  height: 15,
                ),
                sekolahTextField(),
                const SizedBox(
                  height: 15,
                ),
                nomorTextField(),
                const SizedBox(
                  height: 15,
                ),
                emailTextField(),
                const SizedBox(
                  height: 15,
                ),
                kodeInstansiTextField(),
                const SizedBox(
                  height: 15,
                ),
                passwordTextField(),
                const SizedBox(
                  height: 15,
                ),
                konfirmasiPasswordTextField(),

                tanggalMulaiMagangContainer(),
                tanggalSelesaiMagangContainer(),
                RaisedButton(
                  color: const Color(0xffd63031),
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onPressed: () {
                    regisController.pressRegis(context);
                  },
                  child: const Text(
                    "Register",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ]),
    );
  }

  Widget nameTextField() {
    return TextFormField(
      controller: regisController.namalengkap,
      decoration: const InputDecoration(
        // width:
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.redAccent,
          width: 2,
        )),
        prefixIcon: Icon(
          Icons.person,
          color: Colors.red,
        ),
        labelText: "Nama",
      ),
    );
  }

  Widget nisnTextField() {
    return TextFormField(
      controller: regisController.nim,
      decoration: const InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.teal,
          width: 2,
        )),
        prefixIcon: Icon(
          Icons.confirmation_number,
          color: Colors.red,
        ),
        labelText: "NISN/NIM",
      ),
    );
  }

  Widget sekolahTextField() {
    return TextFormField(
      controller: regisController.asal_sekolah,
      decoration: const InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.red,
          width: 2,
        )),
        prefixIcon: Icon(
          Icons.domain,
          color: Colors.red,
        ),
        labelText: "Asal Instansi/Sekolah",
      ),
    );
  }

  Widget nomorTextField() {
    return TextFormField(
      controller: regisController.nomor,
      decoration: const InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.red,
          width: 2,
        )),
        prefixIcon: Icon(
          Icons.phone_android,
          color: Colors.red,
        ),
        labelText: "Nomor",
      ),
    );
  }

  Widget emailTextField() {
    return TextFormField(
      controller: regisController.email,
      decoration: const InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.teal,
          width: 2,
        )),
        prefixIcon: Icon(
          Icons.email,
          color: Colors.red,
        ),
        labelText: "Email",
      ),
    );
  }

  Widget kodeInstansiTextField() {
    return TextFormField(
      controller: regisController.kode_instasni,
      decoration: const InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.teal,
          width: 2,
        )),
        prefixIcon: Icon(
          Icons.add_business_rounded,
          color: Colors.red,
        ),
        labelText: "Kode Instansi",
      ),
    );
  }

  Widget passwordTextField() {
    return TextFormField(
      controller: regisController.password,
      decoration: const InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.teal,
          width: 2,
        )),
        prefixIcon: Icon(
          Icons.add_business_rounded,
          color: Colors.red,
        ),
        labelText: "Password",
      ),
    );
  }

  Widget konfirmasiPasswordTextField() {
    return TextFormField(
      controller: regisController.conf_pass,
      decoration: const InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.teal,
          width: 2,
        )),
        prefixIcon: Icon(
          Icons.add_business_rounded,
          color: Colors.red,
        ),
        labelText: "Konfirmasi Password",
      ),
    );
  }

  Widget tanggalMulaiMagangContainer() {
    DateTime _goDate = DateTime.now();
    String _dateText = ''; //untuk menampilkan tanggal/kalendernya

    Future<void> _selectDueDate(BuildContext context) async {
      final picked = await showDatePicker(
          context: context,
          initialDate: _goDate,
          firstDate: DateTime(2000),
          lastDate: DateTime(2090));

      if (picked != null) {
        //untuk cek user sudah pilih tanggal atau belum
        setState(() {
          _goDate = picked;
          _dateText = "${picked.day}/${picked.month}/${picked.year}";
        });
      }
    }

    return Container(
      padding: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Tanggal Mulai Magang",
            style: TextStyle(fontSize: 15),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
              padding: const EdgeInsets.all(10),
              color: Colors.grey.withOpacity(0.1),
              // decoration: BoxDecoration(
              //     border: Border.all(
              //   color: Colors.grey,
              //   width: 2,
              // )),
              child: Row(
                children: <Widget>[
                  FlatButton(
                      onPressed: () => regisController.selectTanggal(context),
                       child: Obx(() => Text(
                                        regisController.dateText.value,
                                        style: const TextStyle(fontSize: 18),
                                      ),)
                     ),
                ],
              )),
        ],
      ),
    );
  }

  Widget tanggalSelesaiMagangContainer() {
    DateTime _lalastDate = DateTime.now();
    String _dateTextLast = ''; //untuk menampilkan tanggal/kalendernya

    Future<void> _selectDueDate(BuildContext context) async {
      final picked = await showDatePicker(
          context: context,
          initialDate: _lalastDate,
          firstDate: DateTime(2000),
          lastDate: DateTime(2090));

      if (picked != null) {
        //untuk cek user sudah pilih tanggal atau belum
        setState(() {
          _lalastDate = picked;
          _dateTextLast = "${picked.day}/${picked.month}/${picked.year}";
        });
      }
    }

    return Container(
      padding: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Tanggal Selesai Magang",
            style: TextStyle(fontSize: 15),
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
                      onPressed: () => regisController.selectSelesai(context),
                       child: Obx(() => Text(
                                        regisController.dateTextTwo.value,
                                        style: const TextStyle(fontSize: 18),
                                      ),)),
                ],
              )),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
