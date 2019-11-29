//import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Galeria extends StatefulWidget {
  PageController page = PageController();
  Galeria(context, this.page);

  @override
  _GaleriaState createState() => _GaleriaState();
}

class _GaleriaState extends State<Galeria> {

bool teste = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Cadastro da Chácara",
          style: TextStyle(
            fontSize: 23,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.deepOrangeAccent,
      ),
    body: GestureDetector(
      child: Container(
        color: Colors.grey[350],
        child: Icon(Icons.add, color: Colors.white70,),
      ),
      onTap: Adicionar,
      
    )
    );
  }

  /*----------------------------------GRID------------------------------------*/
//Criar a tela body dos gifs
/*Widget _criarGifMesa(BuildContext context, AsyncSnapshot snapshot) {
  return GridView.builder(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 10.0,
      mainAxisSpacing: 10.0,
    ),
    //itemCount: snapshot.data["data"].length,
    itemCount: _getQuantidadeGifs(snapshot.data["data"]),
    itemBuilder: (context, index) {
      if (busca == null || index < snapshot.data["data"].length) {
        return GestureDetector(
          onLongPress: (){
            Share.share(snapshot.data["data"][index]["images"]["fixed_height"]["url"]);
          },
          onTap: () {
            print("A $index");

            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      GifPage(snapshot.data["data"][index])),
            );
          },
          child: FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: snapshot.data["data"][index]["images"]["fixed_height"]
            ["url"],
            fit: BoxFit.cover,
            height: 300,
          ),
          //child: Image.network(
          //  snapshot.data["data"][index]["images"]["fixed_height"]["url"],
          //  fit: BoxFit.cover,
          //),
        );
      } else {
        return Container(
          child: GestureDetector(
            onTap: () {
              setState(() {
                offset += 19;
              });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 70,
                ),
                Text(
                  "Ver mais...",
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ],
            ),
          ),
        );
      }
    },
  );
}
  */

  Future<bool> Adicionar() {
     showDialog(
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

                          // _contatoEditado.img = file.path;
                          /*StorageUploadTask task = FirebaseStorage
                              .instance
                              .ref()
                              .child("foto"+DateTime.now().toString()) //nome do arquivo
                              .putFile(file);

                          StorageTaskSnapshot taskSnapshot = await task.onComplete;

                          String url = await taskSnapshot.ref.getDownloadURL();
                          print(url);*/

                      }
                    });
                  },
                  child: Text("Câmera")),
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                    //Navigator.pop(context);
                    ImagePicker.pickImage(source: ImageSource.gallery)
                        .then((file) {
                      if (file == null) {
                        return;
                      } else {
                        setState(() {
                          // _contatoEditado.img = file.path;
                        });
                      }
                    });
                  },
                  child: Text("Galeria")),
            ],
          );
        });
    return Future.value(true);
}
}
