import 'package:flutter/material.dart';
import 'package:pi/model/chacara_model.dart';

class Comodidade extends StatefulWidget {
  PageController page = PageController();
  Comodidade(context, this.page);

  @override
  _ComodidadeState createState() => _ComodidadeState();
}

class _ComodidadeState extends State<Comodidade> {
  //CheckBox
  //bool qtdquartos = false;
  bool qtdbanheiro = false;
  bool piscina = false;
  bool churrasqueira = false;
  bool areacoberta = false;
  bool tomada110 = false;
  bool tomada220 = false;
  bool estacionamento = false;

  TextEditingController quarto = TextEditingController();
  TextEditingController cama = TextEditingController();
  TextEditingController banheiro= TextEditingController();
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
  void initState() {
    super.initState();
    if(ChacaraModel.of(context).qtdquarto != null){
      quarto.text = ChacaraModel.of(context).qtdquarto.toString();
    }
    if(ChacaraModel.of(context).camas != null){
      cama.text = ChacaraModel.of(context).camas.toString();
    }
    if(ChacaraModel.of(context).qtdbanheiro != null){
      banheiro.text = ChacaraModel.of(context).qtdbanheiro.toString();
    }
    if(ChacaraModel.of(context).carros != null){
      carro.text = ChacaraModel.of(context).carros.toString();
    }
    if(ChacaraModel.of(context).tomada110 != null){
      t110.text = ChacaraModel.of(context).tomada110.toString();
    }
    if(ChacaraModel.of(context).tomada220 != null){
      t220.text = ChacaraModel.of(context).tomada220.toString();
    }
    if(ChacaraModel.of(context).piscina ){
      pisc.text = ChacaraModel.of(context).piscina.toString();
    }
    if(ChacaraModel.of(context).areacoberta ){
      acoberta.text = ChacaraModel.of(context).areacoberta.toString();
    }
    if(ChacaraModel.of(context).churrasqueira ){
      churras.text = ChacaraModel.of(context).churrasqueira.toString();
    }
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
                          value: ChacaraModel.of(context).quarto,
                          onChanged: (bool value) {
                            setState(() {
                              ChacaraModel.of(context).quarto = value;
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
                          enabled: ChacaraModel.of(context).quarto,
                          controller: quarto,
                          keyboardType:
                              TextInputType.numberWithOptions(decimal: true),
                          decoration: InputDecoration(
                            hintText: "Quartos",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 265.0, right: 35.0),
                child: TextField(
                  enabled: ChacaraModel.of(context).quarto,
                  controller: cama,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    hintText: "Camas",
                  ),
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
                        //ChacaraModel.of(context).quarto = qtdquartos;
                        ChacaraModel.of(context).qtdquarto =
                          quarto.text != "" ? int.parse(quarto.text) : 0;
//                        ChacaraModel.of(context).camas =
//                            qtdquartos ? int.parse(cama.text) : 0;
//                        ChacaraModel.of(context).banheiro = qtdbanheiro;
//                        ChacaraModel.of(context).qtdbanheiro =
//                            qtdbanheiro ? int.parse(banheiro.text) : 0;
//                        ChacaraModel.of(context).estacionamento =
//                            estacionamento;
//                        ChacaraModel.of(context).carros =
//                            estacionamento ? int.parse(carro.text) : 0;
//                        ChacaraModel.of(context).tomada110 =
//                            tomada110 ? int.parse(t110.text) : 0;
//                        ChacaraModel.of(context).tomada220 =
//                            tomada220 ? int.parse(t220.text) : 0;
//                        ChacaraModel.of(context).piscina = piscina;
//                        ChacaraModel.of(context).obspiscina = pisc.text ?? "";
                        ChacaraModel.of(context).churrasqueira = churrasqueira;
//                        ChacaraModel.of(context).obschurras =
//                            churras.text ?? "";
//                        ChacaraModel.of(context).areacoberta = areacoberta;
//                        ChacaraModel.of(context).obsareacoberta =
//                            acoberta.text ?? "";

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
