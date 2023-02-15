import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Todo {
  final String title;
  final String description;

  const Todo(this.title, this.description);


}

class DetailScreen extends StatelessWidget {
  // In the constructor, require a Todo.
  //const DetailScreen({super.key, required this.todo});
  //final List<Todo> todos = null;

  /*@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
        Container(
          height: 200,
          width: 100,
          color:  Colors.yellow,
        ),
      ),
    );
  }*/

  final String codigo;
  const DetailScreen({required this.codigo});

  /*void recuperar() async {
    var http = HttpClient();
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
  }*/

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // Use the Todo to create the UI.
    return Scaffold(
        appBar: AppBar(
          title: Text("Detalle"),
        ),
        body: Padding(
            padding: const EdgeInsets.all(40.0),
            child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                //child: Column(
                //children: [
                //  for (int i = 0; i < 9; i++)
                //Container(child: Text(i))
                child: Row(children: [
                  for (int i = 0; i < 9; i++)
                  Row(children: <Widget>[

                      Container(
                        height: 300,
                        width: screenWidth,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/tres.jpg"),
                              fit: BoxFit.cover),
                        ),
                      ) ,
                          SizedBox(
                            width: 20.0,
                          )
                  ])
                ])
                //]
                //)

                )));
    /*,
            Container(
              height: 300,
              width: 150,
              color: Colors.orange,
            ),
            SizedBox(
              width: 10.0,
            ),
            Container(
              height: 300,
              width: 150,
              color: Colors.blue,
            ),
            SizedBox(
              width: 10.0,
            ),
            Container(
              height: 300,
              width: 150,
              color: Colors.purple,
            ),],
    )
    ,
    )
    ,
    )
    );*/
  }
}
