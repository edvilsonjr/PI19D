import 'package:flutter/material.dart';
import 'package:pi/model/pessoa_model.dart';

class PageDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountEmail: Text(PessoaModel.of(context).email ?? "", style: TextStyle(color: Colors.black),),
              accountName: Text(PessoaModel.of(context).nome ?? "", style: TextStyle(color: Colors.black),),
              currentAccountPicture: Icon(Icons.person, size: 50,),
              decoration: BoxDecoration(
                color: Colors.green[100],
              ),
            ),
            ListTile(
              title: Text('Cadastro Chacara', style: TextStyle(fontSize: 20)),
              onTap: () {
                Navigator.of(context).pushNamed('/CadChacara');
              },
              trailing: Icon(Icons.arrow_forward_ios) ,
            ),
            ListTile(
              title: Text('Perfil', style: TextStyle(fontSize: 20)),
              onTap: () {
                Navigator.of(context).pushNamed('/CadChacara');
              },
              trailing: Icon(Icons.arrow_forward_ios) ,
            ),
            ListTile(
              title: Text('Desconectar', style: TextStyle(fontSize: 20)),
              onTap: () {
                Navigator.of(context).pushNamed('/TelaLogin');
              },
              trailing: Icon(Icons.arrow_forward_ios) ,
            ),
          ],
        ),
    );
  }
}

