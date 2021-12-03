import 'package:flutter/material.dart';
import 'package:odyssey/model/order.dart';

class TransactionCardStateless extends StatefulWidget {
  final List<Order> orders;
  const TransactionCardStateless({required this.orders});

  @override
  State<TransactionCardStateless> createState() =>
      _TransactionCardStatelessState();
}

class _TransactionCardStatelessState extends State<TransactionCardStateless> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.orders.length,
        itemBuilder: (context, index) {
          final item = widget.orders[index];
          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: Color(0x40C4C4C4),
            child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {
                  print('Card tapped.');
                },
                child: IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        flex: 4,
                        child: Container(
                            padding: EdgeInsets.all(10),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image(
                                  image: NetworkImage(item.destination!.photo),
                                  width: 70,
                                  fit: BoxFit.cover,
                                ))),
                      ),
                      Expanded(
                        flex: 6,
                        child: Column(
                          children: [
                            Padding(padding: EdgeInsets.only(bottom: 15)),
                            ListTile(
                              title: Text(item.destination!.name,
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13,
                                  )),
                              subtitle: Text('${item.destination!.type} | ${item.destination!.activityLevel}',
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12)),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  "Status: ${item.status}",
                                  style: TextStyle(fontFamily: 'Poppins', fontSize: 12),
                                ),
                                const SizedBox(width: 8),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
          );
        });
  }
}