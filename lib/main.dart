import 'package:flutter/material.dart';
import 'package:pi/view/cadastro_chacara.dart';
import 'package:pi/view/tela_login.dart';
import 'package:pi/view/cadastro.dart';
import 'package:pi/view/home.dart';

void main() async{
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CadChacara(),
      debugShowCheckedModeBanner: false,
        routes: <String, WidgetBuilder>{
          '/TelaLogin': (BuildContext context) => TelaLogin(),
          '/Cadastro': (BuildContext context) => Cadastro(),
          '/Home' : (BuildContext context) => home(),
        }
    );
  }
}
