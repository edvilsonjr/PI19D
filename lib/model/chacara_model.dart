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
  int valordiaria, cdgchacara;
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
String foto1,foto2,foto3,foto4,foto5,foto6;
/*----------------------------------------------------------------------------*/

  static ChacaraModel of(BuildContext context) =>
      ScopedModel.of<ChacaraModel>(context);

  void CarregarDadosChacara(int cdgPessoa){

  }

  Future Salvar(int cdgPessoa) async {
    var url = "http://helpfestas.gearhostpreview.com/"
        "cadastra_chacara.php"
        "?nome=$nomechacara"
        "&cdg_chacara_pessoa=$cdgPessoa"
        "&cidade=$cidade"
        "&estado=$estado"
        "&endereco=$endereco"
        "&numero=$numero"
        "&qtd_quartos=$qtdquarto"
        "&qtd_pessoas=$qtdpessoa"
        "&qtd_camas=$camas"
        "&qtd_banheiros=$qtdbanheiro"
        "&qtd_mesas=$qtdmesa"
        "&piscina=${piscina ? '1' : '0'}"
        "&estacionamento=${estacionamento ? '1' : '0'}"
        "&area_coberta=${areacoberta ? '1' : '0'}"
        "&churrasqueira=${churrasqueira ? '1' : '0'}"
        "&tomada_110=$tomada110"
        "&tomada_220=$tomada220"
        "&obs=$observacao"
        "&qtd_carros=$carros"
        "&bairro=$bairro"
        "&obs_piscina=$obspiscina"
        "&obs_area=$obsareacoberta"
        "&obs_churras=$obschurras";

      var resposta = await http.post(url);
      print("Resposta chacara Status:${resposta.statusCode}");
      print("Resposta Body  cahcara da Página:${resposta.body}");
      cdgchacara = int.parse(resposta.body);

  }

  void ConverteListaFotos(Map<int, dynamic> Fotos){
    foto1 = Fotos[0] ?? "";
    foto2 = Fotos[1] ?? "";
    foto3 = Fotos[2] ?? "";
    foto4 = Fotos[3] ?? "";
    foto5 = Fotos[4] ?? "";
    foto6 = Fotos[5] ?? "";
  }

  Future SalvarFotosBanco() async {
    print("Salvando Fotos no Banco no cdg $cdgchacara");
    var url = "http://helpfestas.gearhostpreview.com/"
        "cadastra_fotos.php?"
        "cdg_fotos_chacara=$cdgchacara"
        "&foto1=$foto1"
        "&foto2=$foto2"
        "&foto3=$foto3"
        "&foto4=$foto4"
        "&foto5=$foto5"
        "&foto6=$foto6";

    var resposta = await http.post(url);
    print("Resposta Status:${resposta.statusCode}");
    print("Resposta Body da Página:${resposta.body}");

    print("Update na Foto Destaque no Banco no cdg $cdgchacara");
    var url2 = "http://helpfestas.gearhostpreview.com/"
        "atualiza.php?"
        "tabela=chacara"
        "&colTabela=cdg_chacara"
        "&codigo=$cdgchacara";

    var resposta2 = await http.post(url2, body: {
      "foto_destaque":foto1
    });

    print("Resposta2 Status:${resposta2.statusCode}");
    print("Resposta2 Body da Página:${resposta2.body}");


  }

}
