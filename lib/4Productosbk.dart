import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'detalle.dart';
import 'detallefull.dart';

/*void main() {
  runApp(MyApp());
}*/

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
    "assets/images/dos.png",*/
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
            title: Text("Productos")
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
