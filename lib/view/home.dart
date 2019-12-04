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
          iconTheme: IconThemeData(color: Colors.deepOrange[400]),
          title: Text("Home",style: TextStyle(color: Colors.deepOrangeAccent[400]),),
          centerTitle: true,
          backgroundColor: Colors.white,
          bottom: TabBar(
            indicatorColor: Colors.deepOrange[400],
            tabs: <Widget>[
              Tab(
                child: Text("Chácara", style: TextStyle(color: Colors.deepOrange[400]),),
              ),
              Tab(
                child: Text("2", style: TextStyle(color: Colors.deepOrange[400]),),
              ),
              Tab(
                child: Text("3", style: TextStyle(color: Colors.deepOrange[400]),),
              ),
            ],
          ),
        ),
        drawer: PageDrawer(),
        body: TabBarView(
          children: <Widget>[
            //SingleChildScrollView(
                //child:
        Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                           Row(
                            children: <Widget>[
                              Text("Cidade:  "),
                              DropdownButton<String>(
                                value: dropdownValue,
                                iconSize: 24,
                                elevation: 16,
                                underline: Container(
                                  height: 2,
                                  color: Colors.deepOrange[400],
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
                                color: Colors.deepOrange[400],
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
                      Container(
                        child: RaisedButton(

                          padding: EdgeInsets.symmetric(horizontal: 30),
                          onPressed: () {
                            Navigator.of(context).pushNamed('/Cadastro');
                          },
                          color: Colors.deepOrange[400],
                          child: Text("Procurar",
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                        Divider(
                          color: Colors.black,
                          height: 2,
                        ),
                        Expanded(child:
                        GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 10.0,
                          ),
                          itemCount: 8,
                          itemBuilder: (context, index){
                            return Container(

                                color: Colors.grey[400],
                                child: Icon(
                                  Icons.add_circle,
                                  color: Colors.black,
                                )
                            );

                          }),
                            ),

                    ],

                  ),
                ),
            //),
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
