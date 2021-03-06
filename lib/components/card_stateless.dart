import 'package:flutter/material.dart';
import 'package:odyssey/model/destination.dart';
import 'package:odyssey/pages/picked_explore.dart';

class CardStateless extends StatelessWidget {
  final String id;
  final List<Destination> destination;
  // ignore: use_key_in_widget_constructors
  const CardStateless({required this.destination, required this.id});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: destination.length,
            itemBuilder: (context, index) {
              final item = destination[index];

              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5.0, vertical: 0),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  PickedExplore(id: item.id, userId: id)));
                    },
                    child: ListTile(
                      title: Row(
                        children: [
                          SizedBox(
                              width: 100,
                              child: ClipRRect(
                                child: Image.network(item.photo),
                                borderRadius: BorderRadius.circular(10),
                              )),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Text(item.name,
                                      style: const TextStyle(
                                        fontFamily: "Poppins",
                                        color: Colors.black,
                                        fontSize: 15,
                                      )),
                                  Text(
                                      "${item.type} | ${item.activityLevel} | rating: ${item.rating}",
                                      style: const TextStyle(
                                        fontFamily: "Poppins",
                                        color: Colors.black,
                                        fontSize: 12,
                                      ))
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }));
    //   return ListView.builder(
    //     shrinkWrap: true,
    //     itemCount: destination.length,
    //     itemBuilder: (context, index) {
    //       final item = destination[index];

    //       return ListTile(
    //         title: Row(
    //           children: [
    //             SizedBox(
    //               width: 100,
    //               child: Image.network(item.photo)
    //             ),
    //             Flexible(
    //               child: Padding(
    //                 padding: const EdgeInsets.all(8.0),
    //                 child: Column(children: [
    //                   Text(item.name)
    //                 ],),
    //               ),
    //             )
    //           ],
    //         ),

    //     );
    // });
  }
}
