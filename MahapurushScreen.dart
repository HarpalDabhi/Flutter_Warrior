import 'package:flutter/material.dart';
import 'package:warrior/Mahapuruses/Ashoka.dart';
import 'package:warrior/Mahapuruses/PratapSinh.dart';
import 'package:warrior/Mahapuruses/Pritviraj.dart';
import 'package:warrior/Mahapuruses/Sambhaji.dart';
import 'package:warrior/Mahapuruses/Shivaji.dart';

class MahapurushScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var maha_nm_list = [
      "Maharana Pratap",
      "Shivaji Maharaj",
      "Chhatrapati Sambhaji",
      "Samrat Ahoka",
      "Prithviraj Chauhan"
    ];

    var maha_photo_list = [
      "pratapsinh.png",
      "shivaji.png",
      "sambhaji.png",
      "ashoka.png",
      "prithviraj.png"
    ];

    var maha_route_list = [
      PratapSinh(),
      Shivaji(),
      Sambhaji(),
      Ashoka(),
      Prithviraj()
    ];
    return Scaffold(
      backgroundColor: Colors.orange[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[600],
        title: Text("Mahapurush", style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 300),
          itemBuilder: ((context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>maha_route_list[index]
                ));
              },
              child: 
            Card(
              
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
                                    title: Text(maha_nm_list[index]),
                                    content: Image.asset(
                                        'assets/images/${maha_photo_list[index]}'),
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
                            'assets/images/${maha_photo_list[index]}'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(
                      maha_nm_list[index],
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
          itemCount: maha_nm_list.length,
        ),
      ),
    );
  }
}
