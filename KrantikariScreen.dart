import 'package:flutter/material.dart';
import 'package:warrior/Krantikaris/BhagatSinh.dart';
import 'package:warrior/Krantikaris/BipinChandra.dart';
import 'package:warrior/Krantikaris/ChandraShekhar.dart';
import 'package:warrior/Krantikaris/KhudiramBose.dart';
import 'package:warrior/Krantikaris/Lajpatray.dart';
import 'package:warrior/Krantikaris/Rajguru.dart';
import 'package:warrior/Krantikaris/Ramprasad.dart';
import 'package:warrior/Krantikaris/Sukhdev.dart';

class KrantikariScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var kranti_name_list = [
      "Bhagat Sinh",
      "Chandrashekhar Azad",
      "Sukhdev",
      "Rajguru",
      "Khudiram Boze",
      "Lala Lajpatray",
      "Ramprasad Bismil",
      "Bipin Chandra Pal"
    ];

    var kranti_photo_list = [
      "bhagatsinh.png",
      "chandrashekhar.png",
      "sukhdev.png",
      "rajguru.png",
      "khudiram.png",
      "lajpatray.png",
      "ramprasad.png",
      "bipinchandra.png"
    ];

    var kranti_route_list = [BhagatSinh(),ChandraShekhar(),Sukhdev(),Rajguru(),Khudirambose(),Lajpatray(),Ramprasad(),BipinChandra()];

    return Scaffold(
      backgroundColor: Colors.orange[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[600],
        title: Text("Krantikari", style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 300),
          itemBuilder: ((context, index) {
            return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => kranti_route_list[index]));
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
                                        title: Text(kranti_name_list[index]),
                                        content: Image.asset(
                                            'assets/images/${kranti_photo_list[index]}'),
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
                                'assets/images/${kranti_photo_list[index]}'),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          kranti_name_list[index],
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontFamily: 'Rubik'),
                        ),
                      )
                    ],
                  ),
                ));
          }),
          itemCount: kranti_name_list.length,
        ),
      ),
    );
  }
}
