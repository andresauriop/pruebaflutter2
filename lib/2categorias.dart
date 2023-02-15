import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '3empresas.dart';

class Categorias extends StatelessWidget {
  //final String codigo;
  //const Categorias({required this.codigo});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        //title: 'Flutter App Learning',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: CategoriasHome());
  }
}

class CategoriasHome extends StatefulWidget {
  //CategoriasHome({Key? key}) : super(key: key);

  @override
  _CategoriasHomeState createState() => _CategoriasHomeState();
}

class _CategoriasHomeState extends State<CategoriasHome> {
  @override
  void initState() {
    super.initState();
  }

  List<String> images = [];

  List data = [];
  List imagesUrl = [];
  var http = HttpClient();

  void llamar(String codigo) {
    Navigator.push(
      context,
      MaterialPageRoute(
        //builder: (context) => DetailScreen(codigo: codigo),
        //builder: (context) => MyApp(), //Detalleful(codigo: codigo),
        builder: (context) => EmpresasPage(codigocategoria: codigo),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // Use the Todo to create the UI.
    return Scaffold(
        appBar: AppBar(
          title: Text("Categorias"),
        ),
        body: ListView(padding: const EdgeInsets.all(8), children: <Widget>[
          InkWell(onTap: () {
                  llamar("1");
              },child:Card(
              //elevation: 6,
              //margin: const EdgeInsets.all(12),
              child: Padding(
                  padding: const EdgeInsets.all(1),
                  child: Container(
                      width: screenWidth,
                      height: 150,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              //image: NetworkImage("https://picsum.photos/600"),
                              image:AssetImage("assets/images/comida.jpg"),
                              fit: BoxFit.cover)),
                      child: Container(
                          alignment: Alignment.bottomRight,
                          padding: const EdgeInsets.all(12),
                          child: const Text("Comida",
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white70)
                          )
                      )
                  )
              )
          )
          ),
          InkWell(onTap: () {
          llamar("2");
          },child:Card(
            //elevation: 6,
            //margin: const EdgeInsets.all(12),
              child: Padding(
                  padding: const EdgeInsets.all(1),
                  child: Container(
                      width: screenWidth,
                      height: 150,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                            //image: NetworkImage("https://picsum.photos/600"),
                              image:AssetImage("assets/images/manualidades.jpg"),
                              fit: BoxFit.cover)),
                      child: Container(
                          alignment: Alignment.bottomRight,
                          padding: const EdgeInsets.all(12),
                          child: const Text("Manualidades",
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white70)
                          )
                      )
                  )
              )
          )
          ),

          InkWell(onTap: () {
    llamar("3");
    },
              child:Card(
            //elevation: 6,
            //margin: const EdgeInsets.all(12),
              child: Padding(
                  padding: const EdgeInsets.all(1),
                  child: Container(
                      width: screenWidth,
                      height: 150,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                            //image: NetworkImage("https://picsum.photos/600"),
                              image:AssetImage("assets/images/uno.jpg"),
                              fit: BoxFit.cover)),
                      child: Container(
                          alignment: Alignment.bottomRight,
                          padding: const EdgeInsets.all(12),
                          child: const Text("Deportes",
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white70)
                          )
                      )
                  )
              )
          )
          ),

        ]));
  }
}
