import 'package:flutter/material.dart';
import 'package:pi/view/drawer.dart';

class home extends StatefulWidget {
  home({Key key}) : super(key: key);
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {

  String dropdownValue;
  String dropdownValue2;

  @override

  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(

        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.deepOrange),
          title: Text("Home",style: TextStyle(color: Colors.deepOrangeAccent),),
          centerTitle: true,
          backgroundColor: Colors.white,
          bottom: TabBar(
            indicatorColor: Colors.deepOrange,
            tabs: <Widget>[
              Tab(
                child: Text("Chácara", style: TextStyle(color: Colors.deepOrange),),
              ),
              Tab(
                child: Text("2", style: TextStyle(color: Colors.deepOrange),),
              ),
              Tab(
                child: Text("3", style: TextStyle(color: Colors.deepOrange),),
              ),
            ],
          ),
        ),
        drawer: PageDwawer(),
        body: TabBarView(
          children: <Widget>[
            SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                        Center(child: Text("Filtros")),
                           Row(
                            children: <Widget>[
                              Text("Cidade:  "),
                              DropdownButton<String>(
                                value: dropdownValue,
                                iconSize: 24,
                                elevation: 16,
                                underline: Container(
                                  height: 2,
                                  color: Colors.deepOrange,
                                ),
                                onChanged: (String newValue) {
                                  setState(() {
                                    dropdownValue = newValue;
                                  });
                                },
                                items: <String>['São João da Boa Vista', 'Águas da Prata', 'Campinas', 'São Paulo']
                                    .map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                })
                                    .toList(),
                              ),
                            ],
                          ),

                        Row(
                          children: <Widget>[
                            Text("Preço:  "),
                            DropdownButton<String>(
                              value: dropdownValue2,
                              iconSize: 24,
                              elevation: 16,
                              underline: Container(
                                height: 2,
                                color: Colors.deepOrange,
                              ),
                              onChanged: (String newValue) {
                                setState(() {
                                  dropdownValue2 = newValue;
                                });
                              },
                              items: <String>['Menos de 250 R\$', 'De 250 à 500 R\$', 'De 500 à 750 R\$', 'De 750 à 1000','Mais de 1000']
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              })
                                  .toList(),
                            ),
                          ],
                        ),
                      Center(
                        child: RaisedButton(

                          padding: EdgeInsets.symmetric(horizontal: 30),
                          onPressed: () {
                            Navigator.of(context).pushNamed('/Cadastro');
                          },
                          color: Colors.deepOrange,
                          child: Text("Procurar",
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                        Divider(
                          color: Colors.black,
                          height: 2,
                        ),
                        /*GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 10.0,
                          ),
                          itemCount: 4,
                          itemBuilder: (context, index){
                            return Container(
                                color: Colors.grey[200],
                                child: Icon(
                                  Icons.add_circle,
                                  color: Colors.black,
                                )
                            );
                          }),
                        */
                    ],

                  ),
                ),
            ),
            Container(

            ),
            Container(

            ),
          ],
        ),
      ),
    );
  }

}
