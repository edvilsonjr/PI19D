import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pi/view/pagina_chacara.dart';

class Galeria extends StatefulWidget {
  PageController page = PageController();
  Galeria(context, this.page);

  @override
  _GaleriaState createState() => _GaleriaState();
}

class _GaleriaState extends State<Galeria> {
  bool teste = false;
  Map<int, dynamic> Fotos = Map();

  /*---------------------------voltar a pagina--------------------------------*/
  Future<bool> jumpPagina() async {
    widget.page.jumpToPage(3);
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: jumpPagina,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.deepOrange[400]),
          title: Text(
            "Fotos da Chácara",
            style: TextStyle(
              fontSize: 21,
              color: Colors.deepOrange[400],
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Text(
                "Adicione até 6 fotos da chácara:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
            ),
            Expanded(
              child: GaleriaImagem(context),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PaginaChacara(context, Fotos)));
              },
              color: Colors.green[300],
              child: Text(
                "Finalizar",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 18.0),
              ),
            )
          ],
        ),
      ),
    );
  }

  /*----------------------------------GRID------------------------------------*/
  Widget GaleriaImagem(BuildContext context, {AsyncSnapshot snapshot}) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemCount: 6,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: Container(
                color: Colors.grey[200],
                child: Fotos[index] == null
                    ? Icon(
                        Icons.add_circle,
                        color: Colors.black,
                      )
                    : Image.network(Fotos[index])),
            onTap: () {
              return showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("Escolha uma das opções abaixo:"),
                    //content: Text("Se sair as alterações serão perdidas"),
                    actions: <Widget>[
                      FlatButton(
                          onPressed: () {
                            Navigator.pop(context);
                            ImagePicker.pickImage(source: ImageSource.camera)
                                .then((file) async {
                              if (file == null) {
                                return;
                              } else {
                                StorageUploadTask task = FirebaseStorage
                                    .instance
                                    .ref()
                                    .child("foto" +
                                        DateTime.now()
                                            .toString()) //nome do arquivo
                                    .putFile(file);

                                StorageTaskSnapshot taskSnapshot =
                                    await task.onComplete;

                                String url =
                                    await taskSnapshot.ref.getDownloadURL();
                                print(url);
                                setState(() {
                                  Fotos[index] = url;
                                });
                              }
                            });
                          },
                          child: Text("Câmera")),
                      FlatButton(
                          onPressed: () {
                            Navigator.pop(context);

                            ImagePicker.pickImage(source: ImageSource.gallery)
                                .then((file) async {
                              if (file == null) {
                                return;
                              } else {
                                StorageUploadTask task = FirebaseStorage
                                    .instance
                                    .ref()
                                    .child("foto_galeria" +
                                        DateTime.now()
                                            .toString()) //nome do arquivo
                                    .putFile(file);

                                StorageTaskSnapshot taskSnapshot =
                                    await task.onComplete;

                                String url =
                                    await taskSnapshot.ref.getDownloadURL();
                                print(url);
                                setState(() {
                                  Fotos[index] = url;
                                });
                              }
                            });
                          },
                          child: Text("Galeria")),
                    ],
                  );
                },
              );
            },
          );
        });
  }
}
