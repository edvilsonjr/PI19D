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
  String valueCidade;
  String valueEstado;

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
            iconTheme: IconThemeData(color: Colors.deepOrange[400]),
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
                      labelText: "Nome da Chácara",
                      labelStyle: TextStyle(color: Colors.green[800])
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: /*Endereço*/ TextField(
                          decoration: InputDecoration(
                            labelText: "Endereço",
                            labelStyle: TextStyle(color: Colors.green[800]),
                            hintText: "Rua, Avenida",
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: /*Número*/ TextField(
                          keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                          decoration: InputDecoration(
                            labelText: "Número",
                              labelStyle: TextStyle(color: Colors.green[800])
                          ),
                        ),
                      ),
                      Text("Estado: ", style: TextStyle(fontSize: 17.0, color: Colors.green[800]),),

                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: DropdownButton<String>(
                          value: valueEstado,
                          iconSize: 24,
                          elevation: 16,
                          underline: Container(
                            height: 1.4,
                            color: Colors.deepOrange[400],
                          ),
                          onChanged: (String newValue) {
                            setState(() {
                              valueEstado = newValue;
                            });
                          },
                          items: <String>[
                            'MG',
                            'SP'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[

                      Text("Cidade: ", style: TextStyle(fontSize: 17.0, color: Colors.green[800]),),

                        Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: DropdownButton<String>(
                            value: valueCidade,
                            iconSize: 24,
                            elevation: 16,
                            underline: Container(
                              height: 1.4,
                              color: Colors.deepOrange[400],
                            ),
                            onChanged: (String newValue) {
                              setState(() {
                                valueCidade = newValue;
                              });
                            },
                            items: <String>[
                              'São João da Boa Vista',
                              'Aguaí',
                              'Poços de Caldas',
                              'Águas da Prata',
                              'Espírito Santo do Pinhal',
                              'Vargem Grande do Sul'
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),


                    ],
                  ),
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
        Galeria(context, page),
      ],
    );
  }
}
