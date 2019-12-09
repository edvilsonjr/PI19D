import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;

class PessoaModel extends Model{
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
    var url = "http;//helpfestas.gearhostpreview.com/"
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
  }
}