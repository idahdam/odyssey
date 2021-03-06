// ignore_for_file: import_of_legacy_library_into_null_safe, prefer_final_fields, avoid_print, unused_field, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:odyssey/components/transaction_card_stateless.dart';
import 'package:odyssey/components/transaction_card_stateless_completed.dart';
import 'package:odyssey/model/order.dart';
import 'dart:convert';
import 'dart:ui';
import 'package:http/http.dart' as http;

class TransactionPage extends StatefulWidget {
  late final String id;
  TransactionPage({required this.id});
  // const TransactionPage({Key? key}) : super(key: key);

  @override
  _TransactionPageState createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  int _currentIndex = 1;
  List<Order> _orders = <Order>[];
  @override
  void initState() {
    super.initState();
    _populateDestinations();
  }

  void _populateDestinations() async {
    final destinations = await _fetchAllDestinations();
    setState(() {
      _orders = destinations;
      print(_orders);
    });
  }

  Future<List<Order>> _fetchAllDestinations() async {
    final response = await http.get(
        "https://odyssey-app-staging.herokuapp.com/api/v1/users/${widget.id}/order");

    if (response.statusCode == 200) {
      final List<dynamic> result = jsonDecode(response.body);
      print(response.body);
      return result.map((item) => Order.fromJson(item)).toList();
    } else {
      throw Exception("Failed to load movies");
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return DefaultTabController(
      length: 2,
      child: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Container(
              height: 48,
              decoration: BoxDecoration(
                  color: Color(0xff21574A),
                  // color: Colors.grey,
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TabBar(
                    indicator: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    tabs: [
                      Tab(
                        child: Text(
                          'Waiting/Failed',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              color: Color(0xff21574A)),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Completed',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              color: Color(0xff21574A)),
                        ),
                      ),
                    ]),
              ),
            ),
            Container(
                height: size.height * 0.7,
                child: TabBarView(
                  children: [
                    Container(
                        // height: 100,
                        // width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              Flexible(
                                  child: TransactionCardStateless(
                                id: widget.id,
                                orders: _orders,
                              )),
                            ],
                          ),
                        )),
                    Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              Flexible(
                                  child: TransactionCardStatelessCompleted(
                                id: widget.id,
                                orders: _orders,
                              )),
                            ],
                          ),
                        )),
                  ],
                ))
          ],
        ),
      )),
    );
  }
}
