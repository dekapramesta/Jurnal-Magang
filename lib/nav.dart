import 'package:aplikasi_magang/home_screen.dart';
import 'package:aplikasi_magang/presensi_screen.dart';
import 'package:aplikasi_magang/profile_screen.dart';
import 'package:flutter/material.dart';
import 'add_jurnal_screen.dart';
import 'add_presensi_screen.dart';

class Nav extends StatefulWidget {
  // const Nav({Key? key}) : super(key: key);

  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    Home(),
    AddJurnal(),
    AddPresensi(),
    Profil(),
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 10,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            backgroundColor: Colors.white,
            label: ('Beranda'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_active),
            backgroundColor: Colors.white,
            label: ('Jurnal'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.text_snippet),
            backgroundColor: Colors.white,
            label: ('Presensi'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            backgroundColor: Colors.white,
            label: ('Profil'),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
      ),
    );
  }
}
