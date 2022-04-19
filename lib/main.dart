import 'package:flutter/material.dart';


void main(){
  // WidgetsApp // MaterialApp // CupertinoApp
  runApp(MaterialApp(
    home: HomePage(),
    theme: ThemeData(
      primarySwatch: Colors.purple,
    ),
  ));
}


class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Awesome App"),
      ),
      body: Container(
        child: Text("Hi Flutter"),
      ),
    );
  }
}