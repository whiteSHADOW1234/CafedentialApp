import 'package:cafedential/MainPageScreen/add_coffee_page.dart';
import 'package:cafedential/MainPageScreen/home_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

  int _selectedIndex = 0;
  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _widgetOptions = [
    const HomePage(),
    // Container(),
    // Container(),
  ];

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setPreferredOrientations(
    //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   statusBarColor: Colors.white,
    //   //color set to transperent or set your own color
    //   statusBarIconBrightness: Brightness.dark,
    //   //set brightness for icons, like dark background light icons
    // ));
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0.0,
          backgroundColor: Color.fromARGB(255, 127, 90, 82),
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
          // actions: [
          //   GestureDetector(
          //     onTap: () {
          //       Navigator.push(
          //           context, MaterialPageRoute(builder: (context) => BlogHome()));
          //     },
          //     child: Container(
          //       padding: EdgeInsets.all(2),
          //       decoration: BoxDecoration(
          //         shape: BoxShape.circle,
          //         gradient: LinearGradient(
          //           colors: [Colors.pink, Colors.redAccent, Colors.orange],
          //           begin: Alignment.topLeft,
          //           end: Alignment.bottomRight,
          //         ),
          //       ),
          //       child: Icon(Icons.notes_rounded),
          //     ),
          //   ),
          //   IconButton(
          //     icon: FaIcon(
          //       FontAwesomeIcons.paperPlane,
          //       color: Colors.black,
          //     ),
          //     onPressed: () {
          //       Navigator.pushNamed(context, ChatHome.id);
          //     },
          //   ),
          // ],
        ),
        body: _widgetOptions.elementAt(_selectedIndex),
        // bottomNavigationBar: SnakeNavigationBar.color(
        //   behaviour: SnakeBarBehaviour.floating,
        //   snakeShape: SnakeShape.circle,
        //   shape: const RoundedRectangleBorder(
        //     borderRadius: BorderRadius.all(Radius.circular(25)),
        //   ),
        //   padding: const EdgeInsets.all(12),
        //   snakeViewColor: Color.fromARGB(255, 208, 171, 162),
        //   selectedItemColor: Colors.white,
        //   unselectedItemColor: Colors.black,
        //   showUnselectedLabels: true,
        //   showSelectedLabels: true,
        //   currentIndex: 0,
        //   onTap: _onItemTap,
        //   items: const [
        //     BottomNavigationBarItem(
        //         icon: Icon(Icons.home), label: 'HOME'),
        //     BottomNavigationBarItem(
        //         icon: Icon(Icons.add), label: 'ADD'),
        //     BottomNavigationBarItem(
        //         icon: Icon(Icons.settings), label: 'SETTINGS'),
        //   ],



          // backgroundColor: Colors.grey.shade200,
          // buttonBackgroundColor: Color.fromARGB(255, 197, 100, 235),
          // height: 50.0,
          // color: Colors.white,
          // items: <Widget>[
          //   FaIcon(
          //     FontAwesomeIcons.comment,
          //       // FontAwesomeIcons.paperPlane,
          //       size: 25.0,
          //     ),
          //   Icon(
          //     Icons.home,
          //     color: Colors.black,
          //     size: 25,
          //   ),
          //   FaIcon(
          //     FontAwesomeIcons.locationDot,
          //       size: 25.0,
          //     ),
          //   // Icon(
          //   //   Icons.search,
          //   //   color: Colors.black,
          //   //   size: 25.0,
          //   // ),
          //   Icon(
          //     Icons.attach_money,
          //     color: Colors.black,
          //     size: 25.0,
          //   ),
          //   // FaIcon(
          //   //   FontAwesomeIcons.heart,
          //   //   size: 25.0,
          //   // ),
          //   Icon(
          //     Icons.person_outline,
          //     color: Colors.black,
          //     size: 25.0,
          //   ),
          // ],
          // index: _selectedIndex,
          // onTap: _onItemTap,
        // ),
      ),
    );
  }
}
