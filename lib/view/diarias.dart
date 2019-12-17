import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:pi/model/chacara_model.dart';

class Diarias extends StatefulWidget {
  PageController page = PageController();
  Diarias(context, this.page);

  @override
  _DiariasState createState() => _DiariasState();
}

class _DiariasState extends State<Diarias> {
  //Mascara do R$
  MoneyMaskedTextController valorseg = MoneyMaskedTextController(
      leftSymbol: "R\$ ", thousandSeparator: ".", decimalSeparator: ",");
  MoneyMaskedTextController valorsex = MoneyMaskedTextController(
      leftSymbol: "R\$ ", thousandSeparator: ".", decimalSeparator: ",");
  MoneyMaskedTextController valorferiado = MoneyMaskedTextController(
      leftSymbol: "R\$ ", thousandSeparator: ".", decimalSeparator: ",");

  /*---------------------------voltar a pagina--------------------------------*/
  Future<bool> jumpPagina() async {
    widget.page.jumpToPage(0);
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: jumpPagina,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Valor da Diária",
            style: TextStyle(
              fontSize: 21,
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
                padding: const EdgeInsets.only(left: 10.0, top: 8.0),
                child: Text(
                  "Informe os valores das diárias de acordo com os dias da semana:",
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: valorseg,
                  decoration: InputDecoration(
                      labelText: "De segunda a quinta:",
                      labelStyle: TextStyle(
                          fontSize: 20.0, color: Colors.green[800])),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: valorsex,
                  decoration: InputDecoration(
                      labelText: "De sexta a domingo:",
                      labelStyle: TextStyle(
                          fontSize: 20.0, color: Colors.green[800])),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: valorferiado,
                  decoration: InputDecoration(
                      labelText: "Feriado:",
                      labelStyle: TextStyle(
                          fontSize: 20.0, color: Colors.green[800])),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, right: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () {
                        ChacaraModel.of(context).valorseg =
                        valorseg == ""||valorseg == null ? "" : valorseg.text;
                        ChacaraModel.of(context).valorseg =
                        valorsex == ""||valorsex == null ? "" : valorsex.text;
                        ChacaraModel.of(context).valorseg =
                        valorferiado == ""||valorferiado == null ? "" : valorferiado.text;
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
      ),
    );
  }
}
