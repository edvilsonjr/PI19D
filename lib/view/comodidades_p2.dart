import 'package:flutter/material.dart';

class PessoaMesa extends StatefulWidget {
  PageController page = PageController();
  PessoaMesa(context, this.page);

  @override
  _PessoaMesaState createState() => _PessoaMesaState();
}

class _PessoaMesaState extends State<PessoaMesa> {
  //CheckBox
  //bool qtdpessoas = false;
  bool qtdmesas = false;
  bool qtdmesasnao = false;

  TextEditingController pessoa = TextEditingController();
  TextEditingController mesa = TextEditingController();
  TextEditingController comentario = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
              child: Text(
                "Estime a quantidade máxima de pessoas no local:",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: TextField(
                //enabled: qtdpessoas,
                controller: pessoa,
                keyboardType:
                TextInputType.numberWithOptions(decimal: true),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 20.0, right: 8.0),
              child: Text(
                "Há espaço para colocar mesas? Se sim, informe a quantidade "
                    "estimada, considerando uma mesa com 4 cadeiras.",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Checkbox(
                        value: qtdmesas,
                        onChanged: (bool value) {
                          setState(() {
                            qtdmesas = value;
                          });
                        }),
                  ),
                  Expanded(
                      child: Text(
                    "Sim",
                    style: TextStyle(fontSize: 17),
                  )),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: TextField(
                        enabled: qtdmesas,
                        controller: mesa,
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        decoration: InputDecoration(
                          hintText: " ",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Checkbox(
                        value: qtdmesasnao,
                        onChanged: (bool value) {
                          setState(() {
                            qtdmesasnao = value;
                          });
                        }),
                  ),
                  Expanded(
                      child: Text(
                        "Não",
                        style: TextStyle(fontSize: 17),
                      )),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text(""),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Divider(
                color: Colors.black,
                height: 2.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0, top: 8.0),
              child: Row(
                children: <Widget>[
                  Text("Outras informações sobre a chácara: ", style: TextStyle(fontSize: 19.0, fontWeight: FontWeight.bold),),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: TextField(
                controller: comentario,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, right: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      widget.page.jumpToPage(4);
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
            ),
          ],
        ),
      ),
    );
  }
}
