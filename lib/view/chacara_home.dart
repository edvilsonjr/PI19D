import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pi/view/pagina_galeria_chacara.dart';
import 'package:http/http.dart' as http;
import 'calendario.dart';

class ChacaraHome extends StatefulWidget {
  dynamic dadoschacara;

  ChacaraHome(this.dadoschacara);

  @override
  _ChacaraHomeState createState() => _ChacaraHomeState();
}

class _ChacaraHomeState extends State<ChacaraHome> {
  bool estimativa = true;
  bool observacao = true;
  bool usuario = false;

  Map<int, dynamic> Fotos = Map();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Chácara",
          style: TextStyle(color: Colors.deepOrange[400]),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.deepOrange),
      ),
      //drawer: PageDrawer(),
      body: SingleChildScrollView(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                height: 300,
                width: 500,
                decoration: BoxDecoration(color: Colors.grey[200]),
                child: widget.dadoschacara["foto_destaque"] == null
                    ? Icon(Icons.photo)
                    : Image.network(widget.dadoschacara["foto_destaque"])),
                //child: Icon(Icons.photo)),
            Divider(
              color: Colors.black,
              height: 2.0,
            ),

            /*-----Nome da chácara------*/
            Row(
              children: <Widget>[
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5.0, left: 8.0),
                    child: Text(
                      "Chácara A",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 210.0),
                  child: Icon(
                    Icons.star,
                    color: Colors.yellow[700],
                  ),
                ),
                Text(
                  "4.5",
                  style: TextStyle(fontSize: 15.0),
                ),
                IconButton(
                    icon: Icon(
                      FontAwesomeIcons.solidHeart,
                      size: 18.0,
                      color: Colors.red[600],
                    ),
                    onPressed: () {
                      //enviar para a página de salvos
                    }),
              ],
            ),
            /*-------------DATA----------------------*/
            Row(
              children: <Widget>[
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5.0, top: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(
                              "Rua Teste, 02 - Jardim Teste",
                            )),
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Text("São João da Boa Vista - SP"),
                        ),
                      ],
                    ),
                  ),
                ),

                 Padding(
                    padding: const EdgeInsets.only(left: 155.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.green[200],
                        borderRadius: BorderRadius.circular(1000)
                      ),
                    child: IconButton(
                      color: Colors.deepOrange[800],
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Calendario(usuario)));
                      },
                      icon: Icon(FontAwesomeIcons.calendarAlt, size: 25.0,),
                    ),
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
                    padding: const EdgeInsets.only(top: 8.0, left: 4.0),
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
              padding: const EdgeInsets.only(top: 3.0, bottom: 10.0),
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
                  Text("observações"),
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
                  Text("observações"),
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
                  Text("observações"),
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
              padding: const EdgeInsets.only(top: 8.0),
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PaginaGaleria()));
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

  Widget Estimativa() {
    return Column(
      children: <Widget>[
        Text(
          "Estimativas: ",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
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
          padding: const EdgeInsets.only(top: 10.0),
          child: Divider(
            color: Colors.black,
            height: 20.0,
          ),
        ),
      ],
    );
  }
}

Widget Observacao() {
  return Column(
    children: <Widget>[
      Text(
        "Informações adicionais: ",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
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
