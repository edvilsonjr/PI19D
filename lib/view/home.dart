import 'package:flutter/material.dart';

class home extends StatefulWidget {
  home({Key key}) : super(key: key);
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  List _cidades =
  ["São João da Boa Vista", "Vargem Grande", "Águas da Prata", "Pinhal", "Campinas"];

  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _cidadeatual;
  @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
    _cidadeatual = _dropDownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String city in _cidades) {
      items.add(new DropdownMenuItem(
          value: city,
          child: new Text(city)
      ));
    }
    return items;
  }
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.deepOrange),
          title: Text("Home",style: TextStyle(color: Colors.deepOrange),),
          centerTitle: true,
          backgroundColor: Colors.white,
          bottom: TabBar(
            indicatorColor: Colors.deepOrange,
            tabs: <Widget>[
              Tab(
                child: Text("Chácara", style: TextStyle(color: Colors.deepOrange),),
              ),
              Tab(
                text: "2",
              ),
              Tab(
                text: "3",
              ),
            ],
          ),
        ),
        drawer: Drawer(

          child: Column(

            children: <Widget>[
              DrawerHeader(
                child: Image.asset(
                  'imagem/semfundo.png',
                  width: 250,
                  height: 250,
                ),
              ),
              Divider(
                color: Colors.deepOrange,
              ),
              Column(
                children: <Widget>[
                  Text("Perfil", style: TextStyle(color: Colors.deepOrange,fontSize: 20),),

                ],
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Container(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                        Text("Filtros", ),
                        new DropdownButton(
                          value: _cidadeatual,
                          items: _dropDownMenuItems,
                          onChanged: changedDropDownItem,
                        ),
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
  void changedDropDownItem(String selectedCity) {
    setState(() {
      _cidadeatual = selectedCity;
    });
  }

}
