import 'package:flutter/material.dart';
import 'package:pi/view/drawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'chacara_home.dart';

class home extends StatefulWidget {
  home({Key key}) : super(key: key);
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  String dropdownValueCidade; //controller do filtro cidade
  String dropdownValuePreco; //controller do filtro preço

  int qtdchacara = 0;

  //caminho para selecionar as chácaras e montar o grid
  Future<Map> _getFotos() async {
    http.Response response;
    if ((dropdownValueCidade == null || dropdownValueCidade == " ") &&
        (dropdownValuePreco == null || dropdownValuePreco == " ")) {
      print("deu certo");
      response = await http.get(
          //quando não há seleção de filtro
          "http://helpfestas.gearhostpreview.com/listar.php?tabela=chacara");
    } else {
      if (dropdownValueCidade != null &&
          (dropdownValuePreco == null || dropdownValuePreco == " ")) {
        //quando selecionado apenas o filtro cidade
        print("filtro cidade");
        response = await http.get(
            "http://helpfestas.gearhostpreview.com/listar_filtro.php?tabela=chacara&colTabela=cidade&cidade=$dropdownValueCidade");
      } else if (dropdownValuePreco != null &&
          (dropdownValueCidade == null || dropdownValueCidade == " ")) {
        //quando selecionado apenas o filtro preço
        print("filtro preço");
//        response = await http.get(
//            "http://helpfestas.gearhostpreview.com/listar.php?tabela=chacara&colTabela=preco");
      } else {
        //quando selecionado o filtro cidade e preço
        print("ambos os filtros");
      }
    }
    print(response.body);
    return json
        .decode(response.body); //json é um Map e como é async utiliza o Future
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black38),
          title: Text(
            "Bem-vindo ao HelpFestas!",
            style: TextStyle(color: Colors.deepOrange[400]),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          bottom: TabBar(
            indicatorColor: Colors.green[200],
            tabs: <Widget>[
              Tab(
                child: Text(
                  "Chácara",
                  style: TextStyle(color: Colors.grey[850], fontSize: 18.0),
                ),
              ),
              Tab(
                child: Text(
                  "Decoração",
                  style: TextStyle(color: Colors.grey[850], fontSize: 18.0),
                ),
              ),
              Tab(
                child: Text(
                  "Alimentação",
                  style: TextStyle(color: Colors.grey[850], fontSize: 18.0),
                ),
              ),
            ],
          ),
        ),
        drawer: PageDrawer(),
        body: TabBarView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 70.0),
                        child: Text(
                          "Cidade:  ",
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                      DropdownButton<String>(
                        value: dropdownValueCidade,
                        iconSize: 24,
                        elevation: 16,
                        underline: Container(
                          height: 1.4,
                          color: Colors.deepOrange[400],
                        ),
                        onChanged: (String newValue) {
                          setState(() {
                            dropdownValueCidade = newValue;
                          });
                        },
                        items: <String>[
                          ' ',
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
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 95.0),
                        child: Text(
                          "Preço:  ",
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                      DropdownButton<String>(
                        value: dropdownValuePreco,
                        iconSize: 24,
                        elevation: 16,
                        underline: Container(
                          height: 1.4,
                          color: Colors.deepOrange[400],
                        ),
                        onChanged: (String newValue) {
                          setState(() {
                            dropdownValuePreco = newValue;
                          });
                        },
                        items: <String>[
                          ' ',
                          'Menos de R\$250',
                          'De R\$250 à 500 ',
                          'De R\$500 à 750 ',
                          'De R\$750 à 1000',
                          'Mais de R\$1000'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                  //Possibilidade de colocar filtro por data
                  Divider(
                    color: Colors.black,
                    height: 2,
                  ),
                  Expanded(
                      child: FutureBuilder(
                    future: _getFotos(),
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                        case ConnectionState.none:
                          return Container(
                            width: 200,
                            height: 200,
                            alignment: Alignment.center,
                            child: CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                              strokeWidth: 5,
                            ),
                          );
                        default:
                          if (snapshot.hasError) {
                            return Container();
                          } else {
                            return _GridChacaraHome(context, snapshot);
                          }
                      }
                    },
                  )),
                ],
              ),
            ),
            //),
            Container(),
            Container(),
          ],
        ),
      ),
    );
  }

  Widget _GridChacaraHome(BuildContext context, AsyncSnapshot snapshot) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemCount: snapshot.data["chacara"].length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ChacaraHome(snapshot.data["chacara"][index])));
            },
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: snapshot.data["chacara"][index]["foto_destaque"] == null ? Icon(
                        Icons.image,
                        size: 75,
                      ):
                          Image.network(snapshot.data["chacara"][index]["foto_destaque"]),
                      height: 110,
                      width: 175,
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                      ),
                    ),
                    Text(snapshot.data["chacara"][index]["nome"].toString(),
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                    Text(snapshot.data["chacara"][index]["cidade"].toString(),
                        style: TextStyle(fontSize: 13)),
                    Row(
                      children: <Widget>[
                        Text("300 R\$", style: TextStyle(fontSize: 15)),
                        Padding(
                          padding: const EdgeInsets.only(left: 75),
                          child: Icon(
                            Icons.star,
                            color: Colors.yellow[700],
                            size: 20,
                          ),
                        ),
                        Text("4.0"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
