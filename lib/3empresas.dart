import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'detalle.dart';
import 'detallefull.dart';
import '4Productos.dart';

/*void main() {
  runApp(MyApp());
}*/
/*
class Empresas extends StatelessWidget {
  final String codigocategoria;
  const Empresas({required this.codigocategoria});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter App Learning',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: EmpresasPage());
  }
}*/

class EmpresasPage extends StatefulWidget {

  //EmpresasPage({Key? key,required codigocategoria}) : super(key: key);
  final String codigocategoria;
  const EmpresasPage ({ Key? key, required this.codigocategoria }): super(key: key);

  @override
  _EmpresasPageState createState() => _EmpresasPageState();

}

class _EmpresasPageState extends State<EmpresasPage> {
  @override
  void initState() {
    super.initState();
    //print("Categoria " + categoria);
    print(fetchDataFromApi());
    print("Categoria " + widget.codigocategoria);

  }

  List<String> images = [
    /*"assets/images/uno.jpg",
    "assets/images/dos.png",
    "assets/images/tres.jpg",
    "assets/images/cuatro.jpg",
    "assets/images/uno.jpg",
    "assets/images/dos.png",
    "assets/images/tres.jpg",
    "assets/images/cuatro.jpg",
    "assets/images/uno.jpg",
    "assets/images/dos.png",
    "assets/images/tres.jpg",
    "assets/images/cuatro.jpg",
    "assets/images/uno.jpg",
    "assets/images/dos.png",
    "assets/images/tres.jpg",
    "assets/images/cuatro.jpg",
    "assets/images/uno.jpg",
    "assets/images/dos.png",
    "assets/images/tres.jpg",
    "assets/images/cuatro.jpg"*/
  ];

  List data = [];
  List imagesUrl = [];
  var http = HttpClient();
  Future<String> fetchDataFromApi() async {

    //var jsonData

    HttpClientRequest request = await http.getUrl(Uri.parse("https://s3-us-west-2.amazonaws.com/appsdeveloperblog.com/tutorials/files/cats.json"));
    //var fetchData = jsonDecode(jsonData.body);
    HttpClientResponse response = await request.close();
    var jsonData = await response.transform(utf8.decoder).join();
    print("hito3 "+ jsonData.toString());
    var fetchData = jsonDecode(jsonData);

    setState(() {
      print("hito4 "+ fetchData.toString());
      data = fetchData;
      data.forEach((element) {
        imagesUrl.add(element['url']);
        images.add(element['url']);
      });
    });

    return jsonData;
  }


  void llamardetalle(String codigo)
  {
    Navigator.push(
      context,
      MaterialPageRoute(
        //builder: (context) => Productos(codigoempresa: codigo),
          builder: (context) => ProductosHomePage(codigoempresa: codigo),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Emprendimientos"),
            ),
        body:
        Center(
          child: GridView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 30),
            itemCount: images.length,
            itemBuilder: (ctx, indice) {
              return Card( child: InkWell(
                child: Container(
                  height: 290,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20)),
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(5),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: Image.network(
                              //'https://tech.pelmorex.com/wp-content/uploads/2020/10/flutter.png',
                              images[indice],
                              fit: BoxFit.fill,
                            ),
                          ),
                          Text(
                            'Title',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'Subtitle',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                    onTap: () {
                        llamardetalle(indice.toString());
                      },

              )
              );},
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.0,
              crossAxisSpacing: 0.0,
              mainAxisSpacing: 5,
              mainAxisExtent: 264,
            ),
          ),
        )
  );
  }
}
