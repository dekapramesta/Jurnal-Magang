import 'package:aplikasi_magang/controller/ProfileController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profil extends StatelessWidget {
    final ProfileController profileController = Get.put(ProfileController());

  final TextEditingController namaController = TextEditingController();
  final TextEditingController nisnController = TextEditingController();
  final TextEditingController sekolahController = TextEditingController();
  final TextEditingController nomorController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController kodeInstansiController = TextEditingController();
  TextEditingController displayNameController = TextEditingController();
  TextEditingController bioController = TextEditingController();

  // Profil({Key? key}) : super(key: key);

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
              painter: HeaderCurvedContainer(),
            ),
            //masukne sini
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 15, bottom: 10),
                child: Text(
                  "Profile",
                  style: TextStyle(
                    fontSize: 25,
                    letterSpacing: 1.5,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
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
                // kodeInstansiTextField(),
                // const SizedBox(
                //   height: 15,
                // ),
                RaisedButton(
                  color: const Color(0xffd63031),
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onPressed: () {
                    profileController.pressProf(context);
                  },
                  child: const Text(
                    "Update Profile",
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
      controller: profileController.nama,
      decoration: const InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.teal,
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
      controller: profileController.nim,
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
      controller: profileController.asal_sekolah,
      decoration: const InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.teal,
          width: 2,
        )),
        prefixIcon: Icon(
          Icons.domain,
          color: Colors.red,
        ),
        labelText: "Sekolah",
      ),
    );
  }

  Widget nomorTextField() {
    return TextFormField(
      controller: profileController.nomor,
      decoration: const InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.teal,
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
      controller: profileController.emailEdit,
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
      controller: emailController,
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

}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = const Color(0xffd63031);
    Path path = Path()
      ..relativeLineTo(0, 80)
      ..quadraticBezierTo(size.width / 2, 195, size.width, 80)
      ..relativeLineTo(0, -100)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
