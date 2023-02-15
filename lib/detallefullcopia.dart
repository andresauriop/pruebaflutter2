import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'detalle.dart';

class Detalleful extends StatelessWidget {
  final String codigo;
  const Detalleful({required this.codigo});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter App Learning',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: DetallefulHome());
  }
}

class DetallefulHome extends StatefulWidget {
  DetallefulHome({Key? key}) : super(key: key);

  @override
  _DetallefulState createState() => _DetallefulState();

}

class _DetallefulState extends State<DetallefulHome> {
  @override
  void initState() {
    super.initState();
    //print("hito");
    print(fetchDataFromApi());

  }

  List<String> images = [];

  List data = [];
  List imagesUrl = [];
  var http = HttpClient();
  Future<String> fetchDataFromApi() async {

    //var jsonData

    HttpClientRequest request = await http.getUrl(Uri.parse("https://s3-us-west-2.amazonaws.com/appsdeveloperblog.com/tutorials/files/cats.json"));
    //var fetchData = jsonDecode(jsonData.body);
    HttpClientResponse response = await request.close();
    var jsonData = await response.transform(utf8.decoder).join();
    print("hito2");
    print("hito3 "+ jsonData.toString());
    var fetchData = jsonDecode(jsonData);

    setState(() {
      print("hito4 "+ fetchData.toString());
      data = fetchData;
      data.forEach((element) {
        imagesUrl.add(element['url']);
        images.add(element['url']);
        print("hito5 " + element['url']);
      });
    });

    return jsonData;
  }

  Future<String> llamarservicio() async{
    var client = HttpClient();
    try {
      HttpClientRequest request = await client.get('www.google.com', 80, '/file.txt');
      HttpClientResponse response = await request.close();
      final stringData = await response.transform(utf8.decoder).join();
      return (stringData.toString());
    } finally {
      client.close();
    }
    //return Future.delayed(const Duration(seconds: 2), () => print('Large Latte'));
  }
  Future<void> mensaje(String ruta) async{
    var snackBar = SnackBar(content: Text(ruta));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    print(await llamarservicio());
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // Use the Todo to create the UI.
    return Scaffold(
        appBar: AppBar(
          title: Text("Detalle"),
        ),
        body:
          //ListView(children: <Widget> [
                    new Row(
                            children: <Widget>[ Padding(
                                  padding: const EdgeInsets.all(40.0),
                                  child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(children: [
                                        for (int i = 0; i < images.length; i++)
                                          Row(children: <Widget>[
                                            Container(
                                              height: 300,
                                              width: screenWidth,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage("assets/images/tres.jpg"),
                                                  //image: NetworkImage(images[i]),
                                                  fit: BoxFit.cover,
                                                  onError: (Object exception, StackTrace? stackTrace) {
                                                    print('onError');
                                                    print('Exception: $exception');
                                                    print('Stack Trace:\n$stackTrace');
                                                  },
                                                ),
                                              ),
                                            )],
                                          ),
                                        SizedBox(
                                          width: 20.0,
                                        )
                                      ])
                                  )
                              )
                    ])
                            //),
                    /*,Row(
                      children: <Widget>[
                        Text("hola a todos"),
                      ],
                    )*/
                //])
    );




  }
}
