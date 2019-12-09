import 'package:flutter/material.dart';
import 'package:pi/view/pagina_chacara.dart';

import 'comodidades.dart';
import 'comodidades_p2.dart';
import 'diarias.dart';
import 'galeria.dart';

class CadChacara extends StatefulWidget {
  @override
  _CadChacaraState createState() => _CadChacaraState();
}

class _CadChacaraState extends State<CadChacara> {
  PageController page = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: page,
      //scrollDirection: A,
      children: <Widget>[
        Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Cadastro da Chácara",
              style: TextStyle(
                fontSize: 23,
                color: Colors.deepOrange[400],
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: Colors.white,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  //Nome da Chacara
                  TextField(
                    decoration: InputDecoration(
                      //labelText: "Nome da Chácara",
                      hintText: "Nome da Chácara",
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: /*Endereço*/ TextField(
                          decoration: InputDecoration(
                            labelText: "Endereço",
                            hintText: "Rua, Avenida",
                          ),
                        ),
                      ),
                      Expanded(
                        child: /*Número*/ TextField(
                          keyboardType:
                              TextInputType.numberWithOptions(decimal: true),
                          decoration: InputDecoration(
                            labelText: "Número",
                            //hintText: "Número",
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: "Estado - UF",
                            hintText: "SP, MG,PR..",
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                          decoration: InputDecoration(
                            labelText: "CEP",
                            hintText: "00000-000",
                          ),
                        ),
                      ),
                      //CEP
                    ],
                  ),
                  //Cidade
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Cidade",
                      hintText: "Cidade",
                    ),
                  ),
                  //Estado (UF)

                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        RaisedButton(
                          onPressed: () {
                            page.jumpToPage(1);
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                          ),
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 30.0,
                          ),
                          color: Colors.green[300],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Diarias(context, page),
        Comodidade(context, page),
        PessoaMesa(context, page),
        Galeria(context,page),
      ],
    );
  }
}
