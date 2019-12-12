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

  /*---------------------------voltar a pagina--------------------------------*/
  Future<bool> jumpPagina() async {
    widget.page.jumpToPage(1);
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
            "Informações Gerais da Chácara",
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
                  "Selecione as comodidades do local e informe os detalhes:",
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 35.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Checkbox(
                          activeColor: Colors.green[200],
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
                          activeColor: Colors.green[200],
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
              Padding(
                padding: const EdgeInsets.only(right: 35.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Checkbox(
                          activeColor: Colors.green[200],
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
                          activeColor: Colors.green[200],
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
                          activeColor: Colors.green[200],
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
                          activeColor: Colors.green[200],
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
                          activeColor: Colors.green[200],
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
                          activeColor: Colors.green[200],
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
      ),
    );
  }
}
