import 'package:flutter/material.dart';
import 'package:pi/view/cadastro_chacara.dart';
import 'package:pi/view/tela_login.dart';
import 'package:pi/view/cadastro.dart';
import 'package:pi/view/home.dart';
import 'package:pi/view/perfil.dart';
import 'package:scoped_model/scoped_model.dart';
import 'model/pessoa_model.dart';
import 'model/chacara_model.dart';

void main() async{
  runApp(ScopedModel(
      model: PessoaModel(),
      child: ScopedModelDescendant<PessoaModel>(builder: (context, child, model){
        return ScopedModel<ChacaraModel>(model: ChacaraModel(), child: App());
      }),
  ));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: home(),
      debugShowCheckedModeBanner: false,
        routes: <String, WidgetBuilder>{
          '/TelaLogin': (BuildContext context) => TelaLogin(),
          '/Cadastro': (BuildContext context) => Cadastro(),
          '/Home' : (BuildContext context) => home(),
          '/CadChacara' : (BuildContext context) => CadChacara(),
          '/Perfil' : (BuildContext context) => Perfil(),
        }
    );
  }
}
