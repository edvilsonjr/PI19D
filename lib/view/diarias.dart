import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class Diarias extends StatefulWidget {
  PageController page = PageController();
  Diarias(context, this.page);

  @override
  _DiariasState createState() => _DiariasState();
}

class _DiariasState extends State<Diarias> {
  //CheckBox
  bool segunda = false;
  bool terca = false;
  bool quarta = false;
  bool quinta = false;
  bool sexta = false;
  bool sabado = false;
  bool domingo = false;

  //Mascara do R$
  MoneyMaskedTextController valorseg = MoneyMaskedTextController(
      leftSymbol: "R\$ ", thousandSeparator: ".", decimalSeparator: ",");
  MoneyMaskedTextController valorter = MoneyMaskedTextController(
      leftSymbol: "R\$ ", thousandSeparator: ".", decimalSeparator: ",");
  MoneyMaskedTextController valorqua = MoneyMaskedTextController(
      leftSymbol: "R\$ ", thousandSeparator: ".", decimalSeparator: ",");
  MoneyMaskedTextController valorqui = MoneyMaskedTextController(
      leftSymbol: "R\$ ", thousandSeparator: ".", decimalSeparator: ",");
  MoneyMaskedTextController valorsex = MoneyMaskedTextController(
      leftSymbol: "R\$ ", thousandSeparator: ".", decimalSeparator: ",");
  MoneyMaskedTextController valorsab = MoneyMaskedTextController(
      leftSymbol: "R\$ ", thousandSeparator: ".", decimalSeparator: ",");
  MoneyMaskedTextController valordom = MoneyMaskedTextController(
      leftSymbol: "R\$ ", thousandSeparator: ".", decimalSeparator: ",");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Cadastro da Chácara",
          style: TextStyle(
            fontSize: 23,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 8.0),
              child: Text(
                "Selecione os dias de funcionamento e indique os respectivos valores das diárias.",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Checkbox(
                        value: segunda,
                        onChanged: (bool value) {
                          setState(() {
                            segunda = value;
                          });
                        }),
                  ),
                  Expanded(
                      child: Text(
                    "Segunda",
                    style: TextStyle(fontSize: 19),
                  )),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: TextField(
                        enabled: segunda,
                        controller: valorseg,
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        decoration: InputDecoration(
                          hintText: "R\$",
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
                        value: terca,
                        onChanged: (bool value) {
                          setState(() {
                            terca = value;
                          });
                        }),
                  ),
                  Expanded(
                      child: Text(
                    "Terça",
                    style: TextStyle(fontSize: 19),
                  )),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: TextField(
                        enabled: terca,
                        controller: valorter,
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        decoration: InputDecoration(
                          hintText: "R\$",
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
                        value: quarta,
                        onChanged: (bool value) {
                          setState(() {
                            quarta = value;
                          });
                        }),
                  ),
                  Expanded(
                      child: Text(
                    "Quarta",
                    style: TextStyle(fontSize: 19),
                  )),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: TextField(
                        enabled: quarta,
                        controller: valorqua,
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        decoration: InputDecoration(
                          hintText: "R\$",
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
                        value: quinta,
                        onChanged: (bool value) {
                          setState(() {
                            quinta = value;
                          });
                        }),
                  ),
                  Expanded(
                      child: Text(
                    "Quinta",
                    style: TextStyle(fontSize: 19),
                  )),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: TextField(
                        enabled: quinta,
                        controller: valorqui,
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        decoration: InputDecoration(
                          hintText: "R\$",
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
                        value: sexta,
                        onChanged: (bool value) {
                          setState(() {
                            sexta = value;
                          });
                        }),
                  ),
                  Expanded(
                      child: Text(
                    "Sexta",
                    style: TextStyle(fontSize: 19),
                  )),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: TextField(
                        enabled: sexta,
                        controller: valorsex,
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        decoration: InputDecoration(
                          hintText: "R\$",
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
                        value: sabado,
                        onChanged: (bool value) {
                          setState(() {
                            sabado = value;
                          });
                        }),
                  ),
                  Expanded(
                      child: Text(
                    "Sábado",
                    style: TextStyle(fontSize: 19),
                  )),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: TextField(
                        enabled: sabado,
                        controller: valorsab,
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        decoration: InputDecoration(
                          hintText: "R\$",
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
                        value: domingo,
                        onChanged: (bool value) {
                          setState(() {
                            domingo = value;
                          });
                        }),
                  ),
                  Expanded(
                      child: Text(
                    "Domingo",
                    style: TextStyle(fontSize: 19),
                  )),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: TextField(
                        enabled: domingo,
                        controller: valordom,
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        decoration: InputDecoration(
                          hintText: "R\$",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, right: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      widget.page.jumpToPage(2);
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
