import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChacaraModel extends Model {
/*------------------------Variaveis da chácara--------------------------------*/
//Dados Gerais
  String nomechacara;
  String endereco;
  String cidade;
  String estado;
  String bairro;
  int numero;
//Diaria
  int valordiaria;
//Comodidades
  bool quarto = false,
      banheiro = false,
      estacionamento = false,
      piscina = false,
      churrasqueira = false,
      areacoberta = false;
  int camas,
      qtdbanheiro,
      carros,
      qtd110,
      qtd220,
      tomada110,
      tomada220,
      qtdquarto;
  String obspiscina, obschurras, obsareacoberta;
  //Informações adicionais
  int qtdpessoa, qtdmesa;
  bool mesa, mesanao;
  String observacao;
  //Galeria

/*----------------------------------------------------------------------------*/

  static ChacaraModel of(BuildContext context) =>
      ScopedModel.of<ChacaraModel>(context);
}
