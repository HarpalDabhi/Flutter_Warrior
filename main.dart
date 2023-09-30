import 'package:flutter/material.dart';
import 'package:warrior/KrantikariScreen.dart';
import 'package:warrior/MahapurushScreen.dart';
import 'package:warrior/VeerangnaScreen.dart';
import 'package:warrior/Veerangnas/Marnikarnika.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Warrior',
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Warrior'),
      // home: Manikarnika(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var categories = ["Mahapurush", "Veerangna", "Krantikari"];
    var Screens=[MahapurushScreen(),VeerangnaScreen(),KrantikariScreen()];
    return Scaffold(
      backgroundColor: Colors.orange[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[600],
        title: Text(
          widget.title,style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(top: 10, right: 15, left: 15),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context)=>Screens[index]));
              },
              child: Card(
                color: Colors.blue[400],
                elevation: 5,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      categories[index],
                      style: TextStyle(fontSize: 20, color: Colors.white,fontFamily: 'Rubik'),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        itemCount: categories.length,
      ),
    );
  }
}
