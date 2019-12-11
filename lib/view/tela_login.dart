import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:pi/model/pessoa_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TelaLogin extends StatefulWidget {
  @override
  _TelaLoginState createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {

  String _email;
  String _senha;

  TextEditingController _recuemail = new TextEditingController();

  final _scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      backgroundColor: Colors.green[100],
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Image.asset(
                'imagem/semfundo.png',
                width: 250,
                height: 250,
              ),
            ),
            //Center(
            //      child:
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Card(
                borderOnForeground: true,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.green[900], width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Colors.white,
                //decoration: BoxDecoration(border: Border.all(width: 2, color: Colors.black)),
                //padding: EdgeInsets.all(20),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(hintText: "Email"),
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (texto){
                          setState(() {
                            _email = texto;
                          });
                        },
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintText: "Senha",
                        ),
                        onChanged: (texto){
                          setState(() {
                            _senha = texto;
                          });
                        },
                        obscureText: true,
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 3.0),
                          child: Row(
                            children: <Widget>[
                              Text("Esqueci minha senha, "),
                              GestureDetector(
                                child: Text(
                                  "clique aqui.",
                                  style: TextStyle(
                                      color: Colors.deepOrange[400],
                                      fontWeight: FontWeight.bold),
                                ),
                                onTap: () {
                                  return showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text("Esqueci minha senha"),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,

                                          children: <Widget>[
                                            Text(
                                                "Informe seu e-mail cadastrado para redefinir sua senha:"),
                                            TextField(
                                              decoration: InputDecoration(
                                                  hintText: "E-mail"),
                                                  controller: _recuemail,
                                            ),
                                          ],
                                        ),
                                        actions: <Widget>[
                                          FlatButton(
                                              onPressed: () {
                                                PessoaModel.of(context).nome.toString();
                                                FirebaseAuth.instance.sendPasswordResetEmail(email: _recuemail.text);
                                              },
                                              child: Text(
                                                "Enviar",
                                                style: TextStyle(
                                                    fontSize: 20.0,
                                                    color:
                                                        Colors.deepOrange[400]),
                                              )),
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                            //
                          )),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: RaisedButton(
                          onPressed: () {
                            FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _senha).then((user){
                              print("Deu Certo o login");
                              PessoaModel.of(context).uid = user.uid;
                              PessoaModel.of(context).LogarSistema();
                              Navigator.of(context).pushReplacementNamed("/Home");
                            }).catchError((e){
                              print("Erro Login");
                              _scaffoldkey.currentState.showSnackBar(
                                  SnackBar(
                                    content: Text("Login ou Senha Invalidos"),
                                    backgroundColor: Colors.red,
                                    duration: Duration(seconds: 3),
                                  )
                              );
                            });
                          },
                          padding: EdgeInsets.symmetric(horizontal: 98),
                          color: Colors.deepOrange[400],
                          child: Text(
                            "Login",
                            style:
                                TextStyle(color: Colors.white, fontSize: 16.0),
                          ),
                        ),
                      ),
                      RaisedButton(
                        padding: EdgeInsets.symmetric(horizontal: 75),
                        onPressed: () {
                          Navigator.of(context).pushNamed('/Cadastro');
                        },
                        color: Colors.deepOrange[400],
                        child: Text("Cadastrar-se",
                            style:
                                TextStyle(color: Colors.white, fontSize: 16.0)),
                      ),
                      Divider(
                        color: Colors.black,
                        indent: 15.0,
                        height: 15.0,
                      ),
                      Text("Ou"),

                      GoogleSignInButton(
                        text: "  Login com Google  ",
                        onPressed: () {
                          /* ... */
                        },
                        darkMode: true, // default: false
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: FacebookSignInButton(
                          onPressed: () {
                            // call authentication logic
                          },
                          text: "Login com Facebook",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //  ),
          ],
        ),
      ),
    );
  }
}
