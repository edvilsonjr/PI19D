import 'package:flutter/material.dart';
import 'package:pi/view/pagina_chacara.dart';
import 'comodidades.dart';
import 'comodidades_p2.dart';
import 'diarias.dart';
import 'galeria.dart';
import 'package:pi/model/chacara_model.dart';

class CadChacara extends StatefulWidget {
  @override
  _CadChacaraState createState() => _CadChacaraState();
}

class _CadChacaraState extends State<CadChacara> {
  PageController page = PageController();
  String valueCidade;
  String valueEstado;

  /*--------------------------------------------------------------------*/
  TextEditingController controllernome = TextEditingController();
  TextEditingController controllerendereco = TextEditingController();
  TextEditingController controllerbairro = TextEditingController();
  TextEditingController controllernumero = TextEditingController();
  /*--------------------------------------------------------------------*/

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: page,
      children: <Widget>[
        Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Dados da Chácara",
              style: TextStyle(
                fontSize: 21,
                color: Colors.deepOrange[400],
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.deepOrange[400]),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  //Nome da Chacara
                  TextField(
                    controller: controllernome,
                    decoration: InputDecoration(
                        //labelText: "Nome da Chácara",
                        labelText: "Nome da Chácara",
                        labelStyle: TextStyle(color: Colors.black)),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          controller: controllerendereco,
                          decoration: InputDecoration(
                            labelText: "Endereço",
                            labelStyle: TextStyle(color: Colors.black),
                            hintText: "Rua, Avenida",
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: /*Bairro*/ TextField(
                          controller: controllerbairro,
                          decoration: InputDecoration(
                              labelText: "Bairro",
                              labelStyle: TextStyle(color: Colors.black)),
                        ),
                      ),
                      Expanded(
                        child: /*Número*/ TextField(
                          controller: controllernumero,
                          keyboardType:
                              TextInputType.numberWithOptions(decimal: true),
                          decoration: InputDecoration(
                              labelText: "Número",
                              labelStyle: TextStyle(color: Colors.black)),
                        ),
                      ),
                    ],
                  ),

                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          "Cidade: ",
                          style: TextStyle(fontSize: 17.0, color: Colors.black),
                        ),
                      ),
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
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 10.0),
                        child: Text(
                          "Estado: ",
                          style: TextStyle(fontSize: 17.0, color: Colors.black),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0, left: 5.0),
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
                          items: <String>['MG', 'SP']
                              .map<DropdownMenuItem<String>>((String value) {
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
                    padding: const EdgeInsets.only(top: 8.0, right: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        RaisedButton(
                          onPressed: () {
                            ChacaraModel.of(context).nomechacara =
                                controllernome.text;
                            ChacaraModel.of(context).endereco =
                                controllerendereco.text;
                            ChacaraModel.of(context).bairro =
                                controllerbairro.text;
                            ChacaraModel.of(context).numero =
                                int.parse(controllernumero.text);
                            ChacaraModel.of(context).cidade =
                                valueCidade;
                            ChacaraModel.of(context).estado =
                                valueEstado;

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
