import 'package:flutter/material.dart';
import 'package:pi/model/pessoa_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PageDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountEmail: Text(PessoaModel.of(context).email ?? "", style: TextStyle(color: Colors.black),),
              accountName: Text(PessoaModel.of(context).nome ?? "", style: TextStyle(color: Colors.black),),
              currentAccountPicture: Icon(FontAwesomeIcons.solidUserCircle, size: 70.0, color: Colors.grey[600],),
              decoration: BoxDecoration(
                color: Colors.green[100],
              ),
            ),
            ListTile(
              title: Text('Página Inicial', style: TextStyle(fontSize: 18)),
              onTap: () {
                Navigator.of(context).pushNamed('/Home');
              },
              trailing: Icon(Icons.arrow_forward_ios, size: 17.0,) ,
            ),
            ListTile(
              title: Text('Perfil', style: TextStyle(fontSize: 18)),
              onTap: () {
                Navigator.of(context).pushNamed('/Perfil');
              },
              trailing: Icon(Icons.arrow_forward_ios, size: 17.0,) ,
            ),
            ListTile(
              title: Text('Cadastrar Chácara', style: TextStyle(fontSize: 18)),
              onTap: () {
                Navigator.of(context).pushNamed('/CadChacara');
              },
              trailing: Icon(Icons.arrow_forward_ios, size: 17.0,) ,
            ),

            ListTile(
              title: Text('Sair', style: TextStyle(fontSize: 18)),
              onTap: () {
                Navigator.of(context).pushNamed('/TelaLogin');
              },
              trailing: Icon(Icons.arrow_forward_ios, size: 17.0,) ,
            ),
          ],
        ),
    );
  }
}

