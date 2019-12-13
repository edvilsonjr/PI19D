import 'package:flutter/material.dart';
import 'package:pi/model/pessoa_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';


class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {

  bool termo = false;

  final _scaffoldkey = GlobalKey<ScaffoldState>();

  TextEditingController nome = new TextEditingController();
  TextEditingController sobrenome = new TextEditingController();
  TextEditingController data = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController senha = new TextEditingController();

  MaskedTextController tel = new MaskedTextController(mask: "(00)00000-0000");
  MaskedTextController cpf = new MaskedTextController(mask: "000.000.000-00");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        title: Text(
          "Cadastro",
          style: TextStyle(color: Colors.deepOrange[400]),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.deepOrange[400]),
      ),
      body:
      SingleChildScrollView(child: Container(
        padding: EdgeInsets.all(15),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(child: Column(
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(
                            labelText: "*Nome",
                        ),
                        controller: nome,
                      ),

                      TextField(
                        decoration: InputDecoration(labelText: "Sobrenome"),
                        controller: sobrenome,
                      ),

                      TextField(
                        decoration: InputDecoration(labelText: "CPF"),
                        controller: cpf,
                      ),

                      TextField(
                        decoration: InputDecoration(labelText: "Data de Nascimento",),
                        controller: data,
                      ),

                      TextField(
                        decoration: InputDecoration(labelText: "Telefone"),
                        controller: tel,
                      ),

                      TextField(
                        decoration: InputDecoration(labelText: "*E-mail"),
                        controller: email,
                      ),

                      TextField(
                        decoration: InputDecoration(labelText: "*Senha"),
                        obscureText: true,
                        controller: senha,
                      ),

                      Row(
                        children: <Widget>[
                          Checkbox(
                              value: termo,
                              onChanged: (bool valor){
                                setState(() {
                                  termo = valor;
                                });
                              }
                          ),
                          Text("Aceita os Termos de Política e Privacidade", ),
                        ],
                      ),

                    ],
                  ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () {
                    PessoaModel.of(context).nome = nome.text;
                    PessoaModel.of(context).sobrenome = sobrenome.text;
                    PessoaModel.of(context).email = email.text;
                    PessoaModel.of(context).cpf = cpf.text;
                    PessoaModel.of(context).tel = tel.text;
                    PessoaModel.of(context).senha = senha.text;
                    PessoaModel.of(context).data = data.text;

                    if(email.text == null || email.text == "" || senha.text == null || senha.text == "" || nome.text == null || nome.text == ""){
                      _scaffoldkey.currentState.showSnackBar(
                          SnackBar(
                            content: Text("Dados Obrigatórios Não Prenchidos"),
                            backgroundColor: Colors.red,
                            duration: Duration(seconds: 3),
                          )
                      );
                    }
                    else if(termo == false){
                      _scaffoldkey.currentState.showSnackBar(
                          SnackBar(
                            content: Text("Os Termos Não Foram Aceitos"),
                            backgroundColor: Colors.red,
                            duration: Duration(seconds: 3),
                          )
                      );
                    }
                    else {
                      FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                          email: email.text,
                          password: senha.text
                      )
                          .then((user) async {
                        print("Deu Certo o Cadastro");

                        await user.sendEmailVerification();

                        PessoaModel
                            .of(context)
                            .uid = user.uid;



                        PessoaModel.of(context).Cadastro();

                        Navigator.of(context).pushReplacementNamed("/Home");
                      }).catchError((e) {
                        print("Deu Erro no Cadastro");
                        print(e);
                      });
                    }
                  },
                  color: Colors.deepOrange,
                  child: Text("Cadastrar-se",
                      style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),),

    );
  }
}

