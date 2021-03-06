// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:odyssey/components/card.dart';
import 'package:odyssey/components/card_stateless.dart';
import 'package:odyssey/model/destination.dart';
import 'package:http/http.dart' as http;

class Favorite extends StatefulWidget {
  late final String id;
  Favorite({required this.id});

  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  int _currentIndex = 2;

  List<Destination> _destinations = <Destination>[];
  @override
  void initState() {
    super.initState();
    _populateDestinations();
  }

  void _populateDestinations() async {
    final destinations = await _fetchAllDestinations();
    setState(() {
      _destinations = destinations;
      print(_destinations);
    });
  }

  Future<List<Destination>> _fetchAllDestinations() async {
    print(widget.id);
    final response = await http.get(
        "https://odyssey-app-staging.herokuapp.com/api/v1/users/${widget.id}/favorite");

    if (response.statusCode == 200) {
      final List<dynamic> result = jsonDecode(response.body);
      // print(response.body);
      return result.map((item) => Destination.fromJson(item)).toList();
    } else {
      throw Exception("Failed to load movies");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: <Widget>[
      SliverToBoxAdapter(
          child: Container(
        constraints: BoxConstraints(minHeight: 747),
        padding: EdgeInsets.only(top: 50),
        decoration: const BoxDecoration(color: Color(0xff21574A)),
        child: Column(children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.centerLeft,
            child: Text('Favorites',
                style: TextStyle(
                  fontFamily: 'KulimPark',
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.w600,
                )),
          ),
          CardStateless(
            destination: _destinations,
            id: widget.id,
          )
          // Container(
          //   padding: EdgeInsets.symmetric(horizontal: 20),
          //   child: GridView(
          //       physics: NeverScrollableScrollPhysics(),
          //       shrinkWrap: true,
          //       children: [
          //         // CardComponent(),
          //         // CardComponent(),
          //       ],
          //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //           crossAxisCount: 2,
          //           mainAxisSpacing: 20,
          //           crossAxisSpacing: 30,
          //           childAspectRatio: (1.4 / 2.0))),
          // ),
        ]),
      ))
    ]));
  }
}
