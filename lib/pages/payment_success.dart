// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:odyssey/main.dart';
import 'package:url_launcher/url_launcher.dart';

class PaymentSuccess extends StatefulWidget {
  late final String userId;
  late final String id;
  late final String name;
  late final String dueDate;
  late final String startDate;
  late final String finishedDate;
  late final String status;
  late final int price;
  late final String photo;
  late final int desPrice;

  // ignore: non_constant_identifier_names
  PaymentSuccess({
    required this.userId,
    required this.id,
    required this.name,
    required this.dueDate,
    required this.startDate,
    required this.finishedDate,
    required this.status,
    required this.price,
    required this.photo,
    required this.desPrice,
  });
  @override
  PaymentSuccessPage createState() => PaymentSuccessPage();
}

class PaymentSuccessPage extends State<PaymentSuccess> {
  final phoneNumber = '081388122001';
  @override
  Widget build(BuildContext context) {
    var dateDue = DateTime.parse('${widget.dueDate}');
    var dateStart = dateDue.subtract(const Duration(days: 2));
    var totalPerson = widget.price / widget.desPrice;
    const appTitle = 'Order Details';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => Main(
                                  id: widget.userId,
                                  indexPage: 1,
                                )));
                  },
                  icon: Icon(Icons.chevron_left));
            },
          ),
          title: const Text(appTitle,
              style: TextStyle(fontFamily: 'Poppins', fontSize: 20)),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                children: [
                  //Container Purshace Succesful
                  Container(
                    child: Stack(
                      children: [
                        Container(
                            child: Container(
                          padding: EdgeInsets.fromLTRB(15, 25, 15, 25),
                          alignment: Alignment.topCenter,
                          constraints: BoxConstraints(maxWidth: 355),
                          decoration: BoxDecoration(
                              color: Color(0x40C4C4C4),
                              borderRadius: BorderRadius.circular(15.0)),
                          child: Column(
                            children: <Widget>[
                              //Purchase Successful
                              Container(
                                  padding: EdgeInsets.only(top: 20, bottom: 20),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Purchase Succesful',
                                    style: TextStyle(
                                        fontFamily: 'KulimPark',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 24),
                                  )),
                              //Bagian Tengah
                              Container(
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      //Bagian Kiri
                                      Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('Purchased on',
                                                style: TextStyle(
                                                  height: 2.5,
                                                  fontFamily: 'Poppins',
                                                )),
                                            Text('Payment Method',
                                                style: TextStyle(
                                                  height: 2.5,
                                                  fontFamily: 'Poppins',
                                                )),
                                            Text('Price details',
                                                style: TextStyle(
                                                  height: 2.5,
                                                  fontFamily: 'Poppins',
                                                ))
                                          ]),
                                      //Bagian Kanan
                                      Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                                dateStart
                                                    .toIso8601String()
                                                    .split("T")[0],
                                                style: TextStyle(
                                                  height: 2.5,
                                                  fontFamily: 'Poppins',
                                                )),
                                            Text('BCA Transfer',
                                                style: TextStyle(
                                                  height: 2.5,
                                                  fontFamily: 'Poppins',
                                                )),
                                            Text('Rp ${widget.price}',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  height: 2.5,
                                                  fontFamily: 'Poppins',
                                                ))
                                          ])
                                    ]),
                              ),
                              Padding(padding: EdgeInsets.only(bottom: 15)),
                              //Button Review
                              Container(
                                  child: Container(
                                height: 40,
                                width: double.infinity,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Color(0xff21574A),
                                    alignment: Alignment.center,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    textStyle: const TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                        fontSize: 15),
                                  ),
                                  onPressed: () => {},
                                  child: Text('Review Your Trip'),
                                ),
                              )),
                            ],
                          ),
                        )),
                        Container(
                            child: Image.asset('assets/images/check.png',
                                width: 75),
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.all(10)),
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 15)),
                  //Teks Product Details
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Product Details',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 20),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 15)),
                  //Container Product Details
                  Container(
                    child: Container(
                      padding: EdgeInsets.all(15),
                      alignment: Alignment.topCenter,
                      constraints: BoxConstraints(maxWidth: 355),
                      decoration: BoxDecoration(
                          color: Color(0x40C4C4C4),
                          borderRadius: BorderRadius.circular(15.0)),
                      child: Column(
                        children: [
                          //gambar destinasi
                          Container(
                              child: ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: Image.network(
                              widget.photo,
                              fit: BoxFit.cover,
                              height: 130,
                            ),
                          )),
                          Padding(padding: EdgeInsets.only(bottom: 10)),
                          //Detail Tulisan destinasi sama provided by siapa
                          Container(
                              alignment: Alignment.centerLeft,
                              child: RichText(
                                textAlign: TextAlign.left,
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: '${widget.name}',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                        fontSize: 15,
                                      )),
                                  TextSpan(
                                      text: '\nProvided by ',
                                      style: TextStyle(
                                        height: 2.5,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                        fontSize: 13,
                                      )),
                                  TextSpan(
                                      text: 'Nusa Travel Agent',
                                      style: TextStyle(
                                        height: 2.5,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                        fontSize: 13,
                                      ))
                                ]),
                              )),
                          Padding(padding: EdgeInsets.only(bottom: 10)),
                          //Dua tombol kontak dan view itenary
                          Container(
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                //Contact Guide button
                                Container(
                                  height: 40,
                                  width: 150,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Color(0xff9CA18D),
                                        alignment: Alignment.center,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        textStyle: const TextStyle(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                            fontSize: 12),
                                      ),
                                      onPressed: () async {
                                        launch('tel://$phoneNumber');
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Icon(
                                            Icons.phone,
                                            color: Colors.white,
                                            size: 13,
                                          ),
                                          Text(' Contact Guide'),
                                        ],
                                      )),
                                ),
                                //View Destination button
                                Container(
                                  height: 40,
                                  width: 150,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Color(0xff9CA18D),
                                      alignment: Alignment.center,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      textStyle: const TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                          fontSize: 12),
                                    ),
                                    onPressed: () => {},
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(
                                          Icons.search,
                                          color: Colors.white,
                                          size: 15,
                                        ),
                                        Text(' View Destination'),
                                      ],
                                    ),
                                  ),
                                ),
                              ])),
                          //Garis divider
                          Divider(
                            color: Colors.black26,
                            thickness: 1.4,
                            height: 30.0,
                          ),
                          //Kapan Start sama End
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                        text: 'Start From',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black38,
                                          fontSize: 13,
                                        )),
                                    TextSpan(
                                        text:
                                            '\n${widget.startDate.split("T")[0]}',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                          fontSize: 13,
                                        )),
                                  ])),
                                ),
                                Container(
                                  child: Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: Color(0xffC4C4C4),
                                          borderRadius:
                                              BorderRadius.circular(30.0)),
                                      child: Text(
                                        '2 nights',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                          fontSize: 13,
                                        ),
                                      )),
                                ),
                                Container(
                                  child: RichText(
                                      textAlign: TextAlign.right,
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text: 'End',
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black38,
                                              fontSize: 13,
                                            )),
                                        TextSpan(
                                            text:
                                                '\n${widget.finishedDate.split("T")[0]}',
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black,
                                              fontSize: 13,
                                            )),
                                      ])),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 15)),
                  //Teks Adeventurer Information
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Aventurer Information',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 20),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 15)),
                  Container(
                      child: Container(
                    padding: EdgeInsets.all(15),
                    alignment: Alignment.topCenter,
                    constraints: BoxConstraints(maxWidth: 355),
                    decoration: BoxDecoration(
                        color: Color(0x40C4C4C4),
                        borderRadius: BorderRadius.circular(15.0)),
                    child: Column(
                      children: [
                        //atas
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text('Lead Guest',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: Colors.black26)),
                              ),
                              Container(
                                child: Text('Muhammad Hadi',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: Colors.black)),
                              ),
                            ],
                          ),
                        ),
                        //pembatas
                        Divider(
                          color: Colors.black26,
                          thickness: 1.4,
                          height: 30.0,
                        ),
                        //bawah
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text('Booked Capacity',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: Colors.black26)),
                              ),
                              Container(
                                child: Text('${totalPerson} Pax',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: Colors.black)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
                  Padding(padding: EdgeInsets.all(10)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
