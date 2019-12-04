import 'package:flutter/material.dart';

class PageDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountEmail: Text("Edvilson2000@gmail.com", style: TextStyle(color: Colors.black),),
              accountName: Text("Edvilson Dos Santos", style: TextStyle(color: Colors.black),),
              currentAccountPicture: Icon(Icons.person, size: 50,),
              decoration: BoxDecoration(
                color: Colors.green[100],
              ),
            ),
            Divider(),
            ListTile(
              title: Text('Cadastro Chacara', style: TextStyle(fontSize: 20)),
              onTap: () {
                Navigator.of(context).pushNamed('/CadChacara');
              },
            ),


          ],
        ),
    );
  }
}

