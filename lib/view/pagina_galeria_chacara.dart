import 'package:flutter/material.dart';

class PaginaGaleria extends StatefulWidget {
  @override
  _PaginaGaleriaState createState() => _PaginaGaleriaState();
}

class _PaginaGaleriaState extends State<PaginaGaleria> {
  Map<int, dynamic> Fotos = Map();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Galeria",
          style: TextStyle(
            fontSize: 23,
            color: Colors.deepOrange[400],
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: GaleriaFotos(context, Fotos),
          ),
        ],
      ),
    );
  }

  Widget GaleriaFotos(BuildContext context, Map Fotos) {
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
                        Icons.photo,
                        color: Colors.black,
                      )
                    : Image.network(Fotos[index])),
          );
        });
  }
}
