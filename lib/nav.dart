// ignore_for_file: library_private_types_in_public_api

import 'package:cafedential/MainPageScreen/home_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _auth = FirebaseAuth.instance;
User? loggedInUser = _auth.currentUser;

class Nav extends StatefulWidget {
  static const String id = 'nav';

  const Nav({Key? key}) : super(key: key);
  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  @override
  void initState() {
    super.initState();
  }

  final int _selectedIndex = 0;

  final List<Widget> _widgetOptions = [
    const HomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0.0,
          backgroundColor: const Color.fromARGB(255, 127, 90, 82),
          title: const Center(
            child: Text(
              'Coffee Notes',
              style: TextStyle(
                fontFamily: 'Metropolis',
                color: Color.fromARGB(255, 210, 206, 206),
                fontSize: 25.0,
                fontWeight: FontWeight.w700,
                letterSpacing: -1,
              ),
            ),
          ),
        ),
        body: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }
}
