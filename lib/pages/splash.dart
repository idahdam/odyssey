import 'package:flutter/material.dart';
import 'package:odyssey/components/paymentCard.dart';
import 'package:odyssey/main.dart';
import 'package:odyssey/pages/about.dart';
import 'package:odyssey/pages/edit_guide.dart';
import 'package:odyssey/pages/edit_profile.dart';
import 'package:odyssey/pages/home.dart';
import 'package:odyssey/pages/sign_in.dart';
import 'package:odyssey/pages/sign_up.dart';
import 'package:odyssey/pages/add_destination.dart';
import 'package:odyssey/pages/settings.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = Duration(seconds: 2);
    return new Timer(duration, signInRoute);
  }

  // homeRoute() {
  //   Navigator.pushReplacement(context, MaterialPageRoute(
  //     builder: (context) => Main()
  //   ));
  // }
  signInRoute() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => SignUpScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return initWidget();
  }
}

initWidget() {
  return Scaffold(
    body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Color(0xFF21574A),
          ),
        ),
        Center(
          child: Image.asset('assets/images/white_logo.png', width: 220),
        ),
        Center(
            child: Text('odyssey',
                style: TextStyle(
                    fontFamily: 'KulimPark',
                    fontWeight: FontWeight.w300,
                    height: 13,
                    fontSize: 40,
                    color: Colors.white)))
      ],
    ),
  );
}
