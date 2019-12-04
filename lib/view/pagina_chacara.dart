import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PaginaChacara extends StatefulWidget {
  Map<int, dynamic> CapaPrincipal = Map();
  PaginaChacara(context, this.CapaPrincipal);

  @override
  _PaginaChacaraState createState() => _PaginaChacaraState();
}

class _PaginaChacaraState extends State<PaginaChacara> {
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
      drawer: Drawer(
          //colocar a pasta referente ao drawer geral
          ),
      body: Column(
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
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
                  "Chácara A",
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 220.0),
                child: Icon(
                  Icons.star,
                  color: Colors.yellow[700],
                ),
              ),
              Text("4.5"),
            ],
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
                      child: Text("Rua Teste, 02 - Jardim Teste"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Text("São João da Boa Vista - SP"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Text("13870-000"),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 63.0),
                child: Text(
                  "Editar datas:",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange[400]),
                ),
              ),
              Expanded(
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(FontAwesomeIcons.calendarAlt),
                ),
              ),
            ],
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
                  child: Icon(FontAwesomeIcons.phoneSquare,
                  size: 16.0,),
                ),
                Text(
                  " (19) 36123456",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5.0, top: 4.0),
            child: Row(
              children: <Widget>[
                Icon(FontAwesomeIcons.envelopeOpen,
                size: 16.0,),
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
                child: Text("Quartos: "),
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
                child: Text("Banheiros: "),
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
                  child: Text("Estacionamento"),
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
                  child: Text("Tomada 110V: "),
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
                  child: Text("Tomada 220V: "),
                ),
                Text("4"),
              ],
            ),
          ),
          Row(),
        ],
      ),
    );
  }
}
