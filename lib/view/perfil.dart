import 'package:flutter/material.dart';
import 'package:pi/model/pessoa_model.dart';
import 'chacara_home.dart';

class Perfil extends StatefulWidget {
  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        bottomNavigationBar: Material(
          child: TabBar(
            indicator: BoxDecoration(
              color: Colors.green[200],
            ),
            tabs: <Widget>[
              Tab(
                child: Text(
                  "Perfil",
                  style: TextStyle(color: Colors.grey[850], fontSize: 18.0),
                ),
              ),
              Tab(
                child: Text(
                  "Salvos",
                  style: TextStyle(color: Colors.grey[850], fontSize: 18.0),
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text(
            "Perfil",
            style: TextStyle(color: Colors.deepOrange[400]),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.deepOrange[400]),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Container(
                  child: Icon(
                    Icons.person,
                    size: 100,
                  ),
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            Text(
                              "Nome: ",
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              PessoaModel.of(context).nome ?? "",
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            Text(
                              "Sobrenome: ",
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              PessoaModel.of(context).sobrenome ?? "",
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            Text(
                              "Email: ",
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              PessoaModel.of(context).email ?? "",
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            Text(
                              "Telefone: ",
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              PessoaModel.of(context).tel ?? "",
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            Text(
                              "Data de Nascimento: ",
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              PessoaModel.of(context).data ?? "",
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
//                      GridView.builder(
//                          gridDelegate:
//                              SliverGridDelegateWithFixedCrossAxisCount(
//                            crossAxisCount: 2,
//                            crossAxisSpacing: 10.0,
//                            mainAxisSpacing: 10.0,
//                          ),
//                          itemCount: snapshot.data["chacara"].length,
//                          itemBuilder: (context, index) {
//                            return GestureDetector(
//                              onTap: () {
//                                Navigator.push(
//                                    context,
//                                    MaterialPageRoute(
//                                        builder: (context) => ChacaraHome(
//                                            snapshot.data["chacara"][index])));
//                              },
//                              child: Container(
//                                child: Padding(
//                                  padding: const EdgeInsets.all(8.0),
//                                  child: Column(
//                                    crossAxisAlignment:
//                                        CrossAxisAlignment.start,
//                                    children: <Widget>[
//                                      Container(
//                                        child: Icon(
//                                          Icons.image,
//                                          size: 75,
//                                        ),
//                                        height: 110,
//                                        width: 175,
//                                        decoration: BoxDecoration(
//                                          color: Colors.grey[400],
//                                        ),
//                                      ),
//                                      Text(
//                                          snapshot.data["chacara"][index]
//                                                  ["nome"]
//                                              .toString(),
//                                          style: TextStyle(
//                                              fontSize: 15,
//                                              fontWeight: FontWeight.bold)),
//                                      Text(
//                                          snapshot.data["chacara"][index]
//                                                  ["cidade"]
//                                              .toString(),
//                                          style: TextStyle(fontSize: 13)),
//                                      Row(
//                                        children: <Widget>[
//                                          Text("300 R\$",
//                                              style: TextStyle(fontSize: 15)),
//                                          Padding(
//                                            padding:
//                                                const EdgeInsets.only(left: 75),
//                                            child: Icon(
//                                              Icons.star,
//                                              color: Colors.yellow[700],
//                                              size: 20,
//                                            ),
//                                          ),
//                                          Text("4.0"),
//                                        ],
//                                      ),
//                                    ],
//                                  ),
//                                ),
//                              ),
//                            );
//                          }),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
