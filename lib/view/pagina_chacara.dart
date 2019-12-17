import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pi/model/pessoa_model.dart';
import 'package:pi/view/pagina_galeria_chacara.dart';
import 'calendario.dart';
import 'package:pi/model/chacara_model.dart';

import 'home.dart';

class PaginaChacara extends StatefulWidget {
  Map<int, dynamic> CapaPrincipal = Map();

  PaginaChacara(context, this.CapaPrincipal);

  @override
  _PaginaChacaraState createState() => _PaginaChacaraState();
}

class _PaginaChacaraState extends State<PaginaChacara> {
  bool estimativa = true;
  bool observacao = true;
  bool usuario = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Pré - Visualização da Página da Chácara",
          style: TextStyle(color: Colors.deepOrange[400], fontSize: 15),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.deepOrange[400]),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.help_outline,
                color: Colors.green[800],
              ),
              onPressed: () {}),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: _showDialogFim, 
          label: Text("Finalizar", style: TextStyle(
            fontSize: 17.0
          ),
          ),
        icon: Icon(
          Icons.check,
          color: Colors.white,
          size: 25.0,
        ),
        backgroundColor: Colors.green[800],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                height: 300,
                width: 500,
                decoration: BoxDecoration(color: Colors.grey[200]),
                child: widget.CapaPrincipal[0] == null
                    ? Icon(Icons.photo)
                    : Image.network(widget.CapaPrincipal[0])),
            Divider(
              color: Colors.black,
              height: 2.0,
            ),

            /*-----Nome da chácara------*/

            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 5.0, left: 8.0),
                  child: Text(
                    ChacaraModel.of(context).nomechacara,
                    style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                ),
//                Expanded(child: Padding(
//                  padding: const EdgeInsets.only(left: 250.0),
//                  child: Icon(
//                    Icons.star,
//                    color: Colors.yellow[700],
//                  ),
//                ),),
//
//                Padding(
//                  padding: const EdgeInsets.only(right: 8.0),
//                  child: Text("4.5", style: TextStyle(fontSize: 15.0)),
//                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 80.0),
                  child: Text(
                    "Editar datas:",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange[400]),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Calendario(usuario)));
                  },
                  icon: Icon(FontAwesomeIcons.calendarAlt),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("De segunda a quinta: R\$ 200,00"),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text("De sexta a domingo: R\$ 240,00"),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text("Feriado: R\$ 300,00"),
            ),

            /*-------------DATA----------------------*/
            Row(
              children: <Widget>[

               Padding(
                    padding: const EdgeInsets.only(left: 5.0, top: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Row(
                            children: <Widget>[
                              Text(ChacaraModel.of(context).endereco, style: TextStyle(fontSize: 15.0),),
                              Text(", ", style: TextStyle(fontSize: 15.0),),
                              Text(ChacaraModel.of(context).numero.toString(), style: TextStyle(fontSize: 15.0),),
                              Text(" - ", style: TextStyle(fontSize: 15.0),),
                              Text(ChacaraModel.of(context).bairro, style: TextStyle(fontSize: 15.0),),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Row(
                            children: <Widget>[
                              Text(ChacaraModel.of(context).cidade, style: TextStyle(fontSize: 15.0),),
                              Text(" - ", style: TextStyle(fontSize: 15.0),),
                              Text(ChacaraModel.of(context).estado, style: TextStyle(fontSize: 15.0),)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),


              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0, top: 4.0),
              child: Row(
                children: <Widget>[
                  Icon(
                    FontAwesomeIcons.envelopeOpen,
                    size: 16.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Text(
                      "email@email.com.br",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            /*---------contatos---------------*/
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Icon(
                      FontAwesomeIcons.whatsapp,
                      color: Colors.green,
                      size: 16.0,
                    ),
                  ),
                  Text(
                    " (19) 9 8765-4321",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 13.0),
                    child: Icon(
                      FontAwesomeIcons.phoneSquare,
                      size: 16.0,
                    ),
                  ),
                  Text(
                    " (19) 36123456",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.black,
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 3.0, bottom: 10.0, left: 138.0),
              child: Text(
                "Informações Gerais",
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 45.0),
                  child: Icon(
                    FontAwesomeIcons.bed,
                    size: 13.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    "Quartos: ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text("3"),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Text("-"),
                ),
                Text("Camas: "),
                Text("5"),
                Padding(
                  padding: const EdgeInsets.only(left: 45.0),
                  child: Icon(
                    FontAwesomeIcons.restroom,
                    size: 13.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    "Banheiros: ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text("4"),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 45.0),
                    child: Icon(
                      FontAwesomeIcons.car,
                      size: 15.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "Estacionamento",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Text("-"),
                  ),
                  Text("Capacidade: "),
                  Text("5"),
                  Text(" carros")
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 45.0),
                    child: Icon(
                      FontAwesomeIcons.plug,
                      size: 13.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "Tomada 110V: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text("3"),
                  Padding(
                    padding: const EdgeInsets.only(left: 45.0),
                    child: Icon(
                      FontAwesomeIcons.plug,
                      size: 13.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "Tomada 220V: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text("4"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 45.0),
                    child: Icon(
                      FontAwesomeIcons.swimmingPool,
                      size: 13.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "Piscina: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Flexible(child: Text("profundidade de 3 metros")),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 45.0),
                    child: Icon(
                      FontAwesomeIcons.fireAlt,
                      size: 13.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "Churrasqueira: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Flexible(child: Text("não há utensílios")),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 45.0),
                    child: Icon(
                      FontAwesomeIcons.home,
                      size: 13.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "Área Coberta: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Flexible(child: Text("espaço amplo")),
                ],
              ),
            ),

            /*----------------------Estimativas----------------------------------------*/
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Divider(
                color: Colors.black,
                height: 20.0,
              ),
            ),
            estimativa ? Estimativa() : Text(""),
            /*---------------------------------------------------------------------------*/

            /*-------------------------infos adicionais-----------------------------*/
            observacao ? Observacao() : Text(""),
            /*-----------------------------------------------------------------------*/
            Padding(
              padding: const EdgeInsets.only(left: 160.0, top: 8.0),
              child: RaisedButton(

                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PaginaGaleria(Fotos:widget.CapaPrincipal)));
                },
                color: Colors.deepOrange[400],
                child: Text(
                  "Galeria",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 17.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  _showDialogFim(){
    showDialog(
        context: context,
      builder: (context) => AlertDialog(
        title: Text("Finalizar o cadastro da chácara"),
        actions: <Widget>[
          FlatButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: Text("Cancelar",style: TextStyle(
                fontSize: 19.0, color: Colors.deepOrange[400]
              ),)
          ),
          FlatButton(
              onPressed: () async {

                await ChacaraModel.of(context).Salvar(PessoaModel.of(context).cdg);

                ChacaraModel.of(context).ConverteListaFotos(widget.CapaPrincipal??"");

                await ChacaraModel.of(context).SalvarFotosBanco();
                print("cdgChacara = ${ChacaraModel.of(context).cdgchacara}");

                Navigator.push(context, MaterialPageRoute(builder: (context) => home()));


//                Navigator.push(
//                    context,
//                    MaterialPageRoute(
//                        builder: (context) => PaginaChacara(context, Fotos)));
              },
              child: Text("Salvar",style: TextStyle(
                  fontSize: 19.0, color: Colors.green[800]
              ),)
          )
        ],
        content: Text("Deseja salvar a Página da Chácara e retornar à Página Principal?",
        style: TextStyle(fontSize: 18.0),),
      ),
    );
  }
  
}

Widget Estimativa() {
  return Column(
    children: <Widget>[
      Text(
        "Estimativas: ",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 45.0),
              child: Icon(
                FontAwesomeIcons.userFriends,
                size: 13.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "Capacidade Máxima de Pessoas: ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Text("200"),
            //Text("pessoas"),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 45.0),
              child: Icon(
                FontAwesomeIcons.chair,
                size: 13.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "Capacidade de Mesas com 4 lugares: ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Text("200"),
//
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Divider(
          color: Colors.black,
          height: 20.0,
        ),
      ),
    ],
  );
}

Widget Observacao() {
  return Column(
    children: <Widget>[
      Text(
        "Informações adicionais: ",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 8.0, top: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: Text(
                  "Local confortável, fácil acesso, permitido som até as 22 horas. Faça sua festa aqui!"),
            ),
          ],
        ),
      ),
    ],
  );
}
