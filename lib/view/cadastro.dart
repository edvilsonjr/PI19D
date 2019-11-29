import 'package:flutter/material.dart';

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cadastro",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
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
                        decoration: InputDecoration(labelText: "Nome"),
                      ),

                      TextField(
                        decoration: InputDecoration(labelText: "Sobrenome"),
                      ),

                      TextField(
                        decoration: InputDecoration(labelText: "CPF"),
                      ),

                      TextField(
                        decoration: InputDecoration(labelText: "Data de Nascimento"),
                      ),

                      TextField(
                        decoration: InputDecoration(labelText: "Telefone"),
                      ),

                      TextField(
                        decoration: InputDecoration(labelText: "E-mail"),
                      ),

                      TextField(
                        decoration: InputDecoration(labelText: "Senha"),
                        obscureText: true,
                      ),
                      Row(
                        children: <Widget>[
                          Checkbox(value: false, onChanged: null),
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
                  onPressed: () {},
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
