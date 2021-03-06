// ignore_for_file: unnecessary_new, must_be_immutable, prefer_const_constructors, use_key_in_widget_constructors, unused_field, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:odyssey/pages/favorite.dart';
import 'package:odyssey/pages/home.dart';
import 'package:odyssey/pages/profile.dart';
import 'package:odyssey/pages/transaction.dart';
import 'package:odyssey/pages/splash.dart';
import 'package:odyssey/pages/sign_up.dart';
import 'package:odyssey/pages/sign_in.dart';

void main() => runApp(new MaterialApp(
      initialRoute: '/splash',
      routes: {
        // '/': (context) => Main(),
        '/sign_up': (context) => SignUpScreen(),
        // '/explore': (context) => Explore(
        // ),
        '/sign_in': (context) => SignInScreen(),
        '/splash': (context) => SplashScreen(),
        // '/picked_explore': (context) => PickedExplore(),
      },
    ));

class Main extends StatefulWidget {
  late String id;
  late int indexPage;

  Main({required this.id, required this.indexPage});

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  int _currentIndex = 0;
  String userId = "";

  void onTap(int index) {
    setState(() {
      _currentIndex = index;
      widget.indexPage = index;
    });
  }

  @override
  void initState() {
    super.initState();
    userId = widget.id;
  }

  @override
  Widget build(BuildContext context) {
    final pageController = PageController();
    List<Widget> pageList = <Widget>[
      Home(
        id: widget.id,
      ),
      TransactionPage(
        id: widget.id,
      ),
      Favorite(
        id: widget.id,
      ),
      Profile(
        id: widget.id,
      ),
    ];

    return Scaffold(
      body: pageList[widget.indexPage],
      // body: PageView(
      //   children: pageList,
      //   controller: pageController,
      //   onPageChanged: onTap,
      // ),
      // body: IndexedStack(
      //   index: widget.indexPage,
      //   children: pageList,
      // ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: widget.indexPage,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Color(0xFF21574A),
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
              backgroundColor: Colors.grey),
          BottomNavigationBarItem(
              icon: Icon(Icons.receipt_long),
              label: "Search",
              backgroundColor: Colors.grey),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Favorite",
              backgroundColor: Colors.grey),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
              backgroundColor: Colors.grey),
        ],
        onTap: onTap,
      ),
    );
  }
}
