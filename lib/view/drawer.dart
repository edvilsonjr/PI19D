import 'package:flutter/material.dart';

class PageDwawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Image.asset(
                'imagem/semfundo.png',
                width: 250,
                height: 250,
              ),
            ),
            ListTile(
              title: Text('Cadastro Chacara'),
              onTap: () {
                Navigator.of(context).pushNamed('/CadChacara');
              },
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
    );
  }
}

