import 'package:flutter/material.dart';
import 'package:warrior/Veerangnas/Durgavati.dart';
import 'package:warrior/Veerangnas/Jijabai.dart';
import 'package:warrior/Veerangnas/Karmavati.dart';
import 'package:warrior/Veerangnas/Marnikarnika.dart';
import 'package:warrior/Veerangnas/Veeramati.dart';

class VeerangnaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var veerangna_name_list = [
      "Manikarnika",
      "Jijabai",
      "Rani Durgavati",
      "Virangna Veeramati",
      "Rani Karnavati"
    ];

    var veerangna_photo_list = [
      "manikarnika.png",
      "jijabai.png",
      "durgavati.png",
      "veeramati.png",
      "karmavati.png"
    ];

    var veerangna_route_list = [
      Manikarnika(),
      Jijabai(),
      Durgavati(),
      Veeramati(),
      Karmavati(),
    ];

    return Scaffold(
      backgroundColor: Colors.orange[200],
      appBar: AppBar(
        // backgroundColor: Colors.orange[400],
        backgroundColor: Colors.blue[600],
        title: Text("Veerangna", ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 300),
          itemBuilder: ((context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                  veerangna_route_list[index]
                ));
              },
              child: Card(
                // color: Colors.orange,
                color: Colors.blue[400],
                child: Column(
                  children: [
                    Padding(
                        padding: EdgeInsets.all(5),
                        child: InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return Container(
                                      child: Column(
                                    children: [
                                      AlertDialog(
                                        title: Text(veerangna_name_list[index]),
                                        content: Image.asset(
                                            'assets/images/${veerangna_photo_list[index]}'),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text("Cancel"))
                                        ],
                                      ),
                                    ],
                                  ));
                                });
                          },
                          child: CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.blue,
                            backgroundImage: AssetImage(
                                'assets/images/${veerangna_photo_list[index]}'),
                          ),
                        )),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        "${veerangna_name_list[index]}",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: 'Rubik'),
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
          itemCount: veerangna_name_list.length,
        ),
      ),
    );
  }
}
