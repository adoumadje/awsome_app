import 'package:awsome_app/pages/login_page.dart';
import 'package:awsome_app/utils/constants.dart';
import 'package:flutter/material.dart';

import '../widgets/drawer.dart';
import '../widgets/name_card_widget.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class HomePageSB extends StatelessWidget {
  static const String routeName = "/home";

  var datafb, datasb;

  Future fetchData() async {
    final url = Uri.parse("https://jsonplaceholder.typicode.com/photos");
    var res = await http.get(url);
    datafb = jsonDecode(res.body);
    return datafb;
  }

  Stream<List<String>> getStream() {
    datasb = Stream<List<String>>.fromIterable(
      [List<String>.generate(20, (index) => "Item $index")]
    );
    return datasb;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Awesome App"),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Constants.prefs?.setBool("loggedIn", false);
              Navigator.pushReplacementNamed(context, LoginPage.routeName);
            }, 
            icon: Icon(Icons.exit_to_app)
          )
        ],
      ),
      body: StreamBuilder(
        stream: getStream(),
        builder: (context, snapshot) {
          switch(snapshot.connectionState) {
            case ConnectionState.none:
              return Center(
                child: Text("Fetch Something"),
              );
            case ConnectionState.active:
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.done:
              if(snapshot.hasError) {
                return Center(
                  child: Text("Some error occured"),
                );
              }

              return ListView.builder(
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(datasb[index]),
                        );
                      },
                      itemCount: datasb.length,
                    );
          }
        },
      ),
      drawer: MyDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () { 
          // myText = _nameController.text; 
          // setState(() {});
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}