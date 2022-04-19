import 'package:flutter/material.dart';



class MyDrawer extends StatelessWidget {
  const MyDrawer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Adoumadje Caleb"), 
              accountEmail: Text("admcaleb@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://images.unsplash.com/photo-1567899735474-c2a942086894?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDJ8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=600&q=60"
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Adoumadje Caleb"),
              subtitle: Text("Developper"),
              trailing: Icon(Icons.edit),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text("Email"),
              subtitle: Text("admcaleb@gmail.com"),
              trailing: Icon(Icons.edit),
            )
          ],
        ),
      );
  }
}