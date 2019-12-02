import 'package:flutter/material.dart';

class Comodidade extends StatefulWidget {
  PageController page = PageController();
  Comodidade(context, this.page);

  @override
  _ComodidadeState createState() => _ComodidadeState();
}

class _ComodidadeState extends State<Comodidade> {
  //CheckBox
  //bool qtdpessoas = false;
  bool qtdquartos = false;
  //bool qtdcamas = false;
  bool qtdbanheiro = false;
  bool piscina = false;
  bool churrasqueira = false;
  //bool qtdmesas = false;
  bool areacoberta = false;
  bool tomada110 = false;
  bool tomada220 = false;
  bool estacionamento = false;
  //bool qtdcarros = false;

  TextEditingController quarto = TextEditingController();
  TextEditingController cama = TextEditingController();
  TextEditingController banheiro = TextEditingController();
  //TextEditingController pessoa = TextEditingController();
  //TextEditingController mesa = TextEditingController();
  TextEditingController carro = TextEditingController();
  TextEditingController t110 = TextEditingController();
  TextEditingController t220 = TextEditingController();
  TextEditingController pisc = TextEditingController();
  TextEditingController churras = TextEditingController();
  TextEditingController acoberta = TextEditingController();

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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 8.0),
              child: Text(
                "Selecione as comodidades do local e informe os detalhes.",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 35.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Checkbox(
                        value: qtdquartos,
                        onChanged: (bool value) {
                          setState(() {
                            qtdquartos = value;
                          });
                        }),
                  ),
                  Expanded(
                      child: Text(
                    "Quartos",
                    style: TextStyle(fontSize: 17),
                  )),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: TextField(
                        enabled: qtdquartos,
                        controller: quarto,
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        decoration: InputDecoration(
                          hintText: "Camas",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(right: 35.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Checkbox(
                        value: qtdbanheiro,
                        onChanged: (bool value) {
                          setState(() {
                            qtdbanheiro = value;
                          });
                        }),
                  ),
                  Expanded(
                      child: Text(
                    "Banheiros",
                    style: TextStyle(fontSize: 17),
                  )),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: TextField(
                        enabled: qtdbanheiro,
                        controller: banheiro,
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        decoration: InputDecoration(
                          hintText: "Quantidade",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            /*Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Checkbox(
                        value: qtdpessoas,
                        onChanged: (bool value) {
                          setState(() {
                            qtdpessoas = value;
                          });
                        }),
                  ),
                  Expanded(
                      child: Text(
                    "Lotação Máxima",
                    style: TextStyle(fontSize: 17),
                  )),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: TextField(
                        enabled: qtdpessoas,
                        controller: pessoa,
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        decoration: InputDecoration(
                          hintText: "Pessoas",
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
                        value: qtdmesas,
                        onChanged: (bool value) {
                          setState(() {
                            qtdmesas = value;
                          });
                        }),
                  ),
                  Expanded(
                      child: Text(
                    "Mesas",
                    style: TextStyle(fontSize: 17),
                  )),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: TextField(
                        enabled: qtdmesas,
                        controller: mesa,
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        decoration: InputDecoration(
                          hintText: "Para 4 lugares",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),*/
            Padding(
              padding: const EdgeInsets.only(right: 35.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Checkbox(
                        value: estacionamento,
                        onChanged: (bool value) {
                          setState(() {
                            estacionamento = value;
                          });
                        }),
                  ),
                  Expanded(
                      child: Text(
                    "Estacionamento",
                    style: TextStyle(fontSize: 17),
                  )),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: TextField(
                        enabled: estacionamento,
                        controller: carro,
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        decoration: InputDecoration(
                          hintText: "Carros",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 35.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Checkbox(
                        value: tomada110,
                        onChanged: (bool value) {
                          setState(() {
                            tomada110 = value;
                          });
                        }),
                  ),
                  Expanded(
                      child: Text(
                    "Tomada 110V",
                    style: TextStyle(fontSize: 17),
                  )),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: TextField(
                        enabled: tomada110,
                        controller: t110,
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        decoration: InputDecoration(
                          hintText: "Quantidade",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 35.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Checkbox(
                        value: tomada220,
                        onChanged: (bool value) {
                          setState(() {
                            tomada220 = value;
                          });
                        }),
                  ),
                  Expanded(
                      child: Text(
                        "Tomada 220V",
                        style: TextStyle(fontSize: 17),
                      )),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: TextField(
                        enabled: tomada220,
                        controller: t220,
                        keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                        decoration: InputDecoration(
                        hintText: "Quantidade",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 35.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Checkbox(
                        value: piscina,
                        onChanged: (bool value) {
                          setState(() {
                            piscina = value;
                          });
                        }),
                  ),
                  Expanded(
                      child: Text(
                        "Piscina",
                        style: TextStyle(fontSize: 17),
                      )),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: TextField(
                        enabled: piscina,
                        controller: pisc,
                        //keyboardType:
                        //TextInputType.numberWithOptions(decimal: true),
                        decoration: InputDecoration(
                        hintText: "Observação",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 35.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Checkbox(
                        value: churrasqueira,
                        onChanged: (bool value) {
                          setState(() {
                            churrasqueira = value;
                          });
                        }),
                  ),
                  Expanded(
                      child: Text(
                        "Churrasqueira",
                        style: TextStyle(fontSize: 17),
                      )),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: TextField(
                        enabled: churrasqueira,
                        controller: churras,
                        //keyboardType:
                        //TextInputType.numberWithOptions(decimal: true),
                        decoration: InputDecoration(
                        hintText: "Observação",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 35.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Checkbox(
                        value: areacoberta,
                        onChanged: (bool value) {
                          setState(() {
                            areacoberta = value;
                          });
                        }),
                  ),
                  Expanded(
                      child: Text(
                        "Área Coberta",
                        style: TextStyle(fontSize: 17),
                      )),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: TextField(
                        enabled: areacoberta,
                        controller: acoberta,
                        //keyboardType:
                        //TextInputType.numberWithOptions(decimal: true),
                        decoration: InputDecoration(
                          hintText: "Observação",
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
                      widget.page.jumpToPage(3);
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
