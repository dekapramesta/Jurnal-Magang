import 'package:aplikasi_magang/authentication/terms_of_use.dart';
import 'package:aplikasi_magang/controller/LoginController.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:aplikasi_magang/widget/btn_widget.dart';
import 'package:aplikasi_magang/widget/herder_container.dart';
import 'package:aplikasi_magang/nav.dart';
import 'package:aplikasi_magang/register_screen.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
   
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final LoginController loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 30),
        child: Column(
          children: <Widget>[
            HeaderContainer("Login"),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 30),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    _textInput(controller: loginController.email, hint: "Email", icon: Icons.email),
                    _PasstextInput(controller: loginController.password,hint: "Password", icon: Icons.vpn_key),
                    Expanded(
                      child: Center(
                        child: ButtonWidget(
                          btnText: "Login",
                          onClick: () {
                                loginController.pressLogin(context);
                          },
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                      //child: Text('Don\'t have an account? Create'),
                      child: Text.rich(TextSpan(children: [
                        TextSpan(text: "Tidak Punya Akun ? "),
                        TextSpan(
                          text: 'Register',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Regist()));
                            },
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).accentColor),
                        ),
                      ])),
                    ),
                    SizedBox(height: 20,),
                    TermsOfUse(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _textInput({controller, hint, icon}) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
      ),
      padding: EdgeInsets.only(left: 10),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          prefixIcon: Icon(icon),
        ),
      ),
    );
  }

  Widget _PasstextInput({controller, hint, icon}) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
      ),
      padding: EdgeInsets.only(left: 10),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          prefixIcon: Icon(icon),
        ),
      ),
    );
  }
}
