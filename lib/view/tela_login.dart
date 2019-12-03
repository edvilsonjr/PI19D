import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';

class TelaLogin extends StatefulWidget {
  @override
  _TelaLoginState createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                side: BorderSide(color: Colors.deepOrange, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              color: Colors.white,
              //decoration: BoxDecoration(border: Border.all(width: 2, color: Colors.black)),
              //padding: EdgeInsets.all(20),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(hintText: "Email"),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Senha",
                      ),
                      obscureText: true,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Esqueci minha senha"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/Home');
                        },
                        padding: EdgeInsets.symmetric(horizontal: 98),
                        color: Colors.deepOrange,
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    RaisedButton(
                      padding: EdgeInsets.symmetric(horizontal: 75),
                      onPressed: () {
                        Navigator.of(context).pushNamed('/Cadastro');
                      },
                      color: Colors.deepOrange,
                      child: Text("Cadastrar-se",
                          style: TextStyle(color: Colors.white)),
                    ),
                    Divider(
                      color: Colors.black,
                    ),
                    Text("Ou"),
                    GoogleSignInButton(
                      text: "   Login com Google  ",
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
