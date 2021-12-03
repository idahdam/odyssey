import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:odyssey/main.dart';
import 'package:odyssey/pages/payment_success.dart';
import 'package:odyssey/pages/payment_pending.dart';
import 'package:odyssey/pages/payment_fail.dart';

class OrderDetails extends StatefulWidget {
  @override
  OrderDetailsPage createState() => OrderDetailsPage();
}

class OrderDetailsPage extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    const appTitle = 'Checkout';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                  onPressed: () {
                    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("ASDASD")));
                    Navigator.pop(context);
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => Main()));
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
                          Container(
                              child: ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: Image.asset(
                              'assets/images/sangiang.png',
                              fit: BoxFit.cover,
                              height: 130,
                            ),
                          )),
                          Padding(padding: EdgeInsets.only(bottom: 10)),
                          Container(
                              alignment: Alignment.centerLeft,
                              child: RichText(
                                textAlign: TextAlign.left,
                                text: const TextSpan(children: [
                                  TextSpan(
                                      text: 'Sangiang Island',
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
                                      )),
                                  TextSpan(
                                      text: '\nRp250.000/pax',
                                      style: TextStyle(
                                        height: 1.5,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                        fontSize: 13,
                                      )),
                                ]),
                              )),
                          Divider(
                            color: Colors.black26,
                            thickness: 1.4,
                            height: 30.0,
                          ),
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
                                        text: '\nOct 21, 2021',
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
                                        text: '\nOct 23, 2021',
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
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    alignment: Alignment.centerLeft,
                    child: Text('Payment Details',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 20
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 10)),
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
                        Container(
                          child: Row(
                            children: [
                              RichText(
                                  text: const TextSpan(children: [
                                TextSpan(
                                    text: 'Sangiang Island',
                                    style: TextStyle(
                                      height: 1.5,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                      fontSize: 13,
                                    )),
                                TextSpan(
                                    text: '\nTotal Price',
                                    style: TextStyle(
                                      height: 2,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                      fontSize: 16,
                                    )),
                                TextSpan(text: '\n'),
                              ])),
                              RichText(
                                  textAlign: TextAlign.end,
                                  text: const TextSpan(children: [
                                    TextSpan(
                                        text: '2 Guest',
                                        style: TextStyle(
                                          height: 1.5,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                          fontSize: 13,
                                        )),
                                    TextSpan(
                                        text: '\nRp500.000',
                                        style: TextStyle(
                                          height: 2,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                          fontSize: 16,
                                        )),
                                    TextSpan(
                                        text:
                                            '\nMake sure the amount matches up',
                                        style: TextStyle(
                                          height: 2,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                          fontSize: 10,
                                        )),
                                  ])),
                            ],
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          ),
                        ),
                        Divider(
                          color: Colors.black26,
                          thickness: 1.4,
                          height: 30.0,
                        ),
                        Container(
                          child: Column(children: [
                            Container(
                              height: 60,
                              padding: EdgeInsets.only(left: 10, right: 3),
                              decoration: BoxDecoration(
                                  color: Color(0xff9CA18D),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'BCA',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text('12345678',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                      )),
                                  Container(
                                    child: TextButton(
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.content_copy,
                                              color: Colors.black,
                                              size: 15,
                                            ),
                                            Text(' Copy'),
                                          ],
                                        ),
                                        style: TextButton.styleFrom(
                                          tapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          alignment: Alignment.centerRight,
                                          primary: Colors.black,
                                          textStyle: const TextStyle(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        onPressed: () {
                                          Clipboard.setData(
                                              ClipboardData(text: '1234567'));
                                        }),
                                  ),
                                ],
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(bottom: 10)),
                            Container(
                              height: 60,
                              padding: EdgeInsets.only(left: 10, right: 3),
                              decoration: BoxDecoration(
                                  color: Color(0xff9CA18D),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Mandiri',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text('837491234',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                      )),
                                  Container(
                                    child: TextButton(
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.content_copy,
                                              color: Colors.black,
                                              size: 15,
                                            ),
                                            Text(' Copy'),
                                          ],
                                        ),
                                        style: TextButton.styleFrom(
                                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                          alignment: Alignment.centerRight,
                                          primary: Colors.black,
                                          textStyle: const TextStyle(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        onPressed: () {
                                          Clipboard.setData(
                                              ClipboardData(text: '837491234'));
                                        }),
                                  ),
                                ],
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(bottom: 15)),
                            Container(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Atas Nama',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500)),
                                    Text('PT Nusa Wisata',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w600)),
                                  ],
                                )),
                          ]),
                        ),
                      ],
                    ),
                  )),
                  Padding(padding: EdgeInsets.all(10)),
                  //Pay Now button
                  Container(
                    child:  
                      Container(
                        height: 60,
                        width: double.infinity,
                        child: ElevatedButton(
                          style: 
                          ElevatedButton.styleFrom(
                            primary: Color(0xff21574A),
                            alignment: Alignment.center,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                            textStyle: const TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 20
                            ),
                          ),
                          onPressed: () => {
                            // Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => PaymentSuccess()))
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => PaymentPending()))
                            // Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => PaymentFailed()))
                          },
                          child: Text('Pay Now'),
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}