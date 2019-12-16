import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;

class PessoaModel extends Model{
  int cdg;
  String uid;
  String cpf;
  String nome;
  String email;
  String tel;
  String sobrenome;
  String senha;
  String data;
  bool logado;

  static PessoaModel of(BuildContext context) => ScopedModel.of<PessoaModel>(context);

  void Logar (bool a){
    this.logado = a;
    notifyListeners();
  }

  Future Cadastro () async {
    var url = "http://helpfestas.gearhostpreview.com/"
        "cadastra_pessoa.php?"
        "nome=$nome"
        "&sobrenome=$sobrenome"
        "&cpf=$cpf"
        "&datanasc=$data"
        "&telefone=$tel"
        "&email=$email"
        "&senha=$senha"
        "&uid=$uid";

        var resposta = await http.post(url);

        print("Resposta Status:${resposta.statusCode}");
        print("Resposta Body da Página:${resposta.body}");
        cdg =  int.parse(resposta.body);
  }

  void LogarSistema() async{
    var url = "http://helpfestas.gearhostpreview.com/listar.php?tabela=pessoa&colTabela=uid&codigo=$uid";

    var resposta = await http.get(url);

    var datas = json.decode(resposta.body);


    nome = datas["pessoa"][0]["nome"];
    email = datas["pessoa"][0]["email"];
    sobrenome = datas["pessoa"][0]["sobrenome"];
    data = datas["pessoa"][0]["datanasc"];
    tel = datas["pessoa"][0]["telefone"];
    senha = datas["pessoa"][0]["senha"];
    cpf = datas["pessoa"][0]["cpf"];
    uid = datas["pessoa"][0]["uid"];
    cdg = int.parse(datas["pessoa"][0]["cdg_pessoa"]);
  }


}