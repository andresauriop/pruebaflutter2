import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'detalle.dart';
import 'detallefull.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter App Learning',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    print("hito");
    print(fetchDataFromApi());

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
    // Step 3
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    print(await llamarservicio());
  }

  void llamardetalle(String codigo)
  {
    Navigator.push(
      context,
      MaterialPageRoute(
        //builder: (context) => DetailScreen(codigo: codigo),
        builder: (context) => Detalleful(codigoitem: codigo),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter ListView"),
        ),
        body: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 2 / 3,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemCount: images.length,
            itemBuilder: (BuildContext ctx, index) {
              return Card(
                  margin: EdgeInsets.all(10),
                  color: Colors.amber,
                  child: InkWell(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Row(
                            //mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 2.0, right: 2.0, top: 2.0),
                                  // .all(16.0),
                                  /*child: Image.asset(
                                    images[index],
                                    height: 190,
                                    width: 100,
                                  ),*/

                                    child: Image.network(
                                        //'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif'
                                      images[index]
                                      ,height: 190,
                                      width: 100,),


                                ),
                              )
                            ]),
                        Row(
                          children: <Widget>[
                            TextButton(
                              child: const Text('BUY TICKETS'),
                              onPressed: () {
                                /* ... */
                              },
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text("hola a todos"),
                          ],
                        )
                      ],
                    ),
                    onTap: () {
                        //mensaje(images[index]);

                        llamardetalle(index.toString());
                    },
                  ));
            }));
  }
}
