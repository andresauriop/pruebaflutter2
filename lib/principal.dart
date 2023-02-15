import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '4Productos.dart';


/*void main() {
  runApp(Principal());
}*/


/*void main() async {
  runApp(
    MaterialApp(debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/lista': (context) => MyApp(),

        }),
  );
}
*/
class PrincipalHome extends StatefulWidget {
  PrincipalHome({Key? key}) : super(key: key);
  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<PrincipalHome> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      // 5 seconds over, navigate to Page2.
      //Navigator.pushReplacement<void, void>(context, MaterialPageRoute(builder: (context) => MyApp()));//MyApp(arguments: { send your data here ..... })));
      //Navigator.push(context,MaterialPageRoute(builder: (context) => MyApp());
    });
    //print("hito");
    //print(fetchDataFromApi());
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        title: 'Welcome to Flutter',
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Welcome to Flutter'),
            ),
            body:
            ListView(
                padding: const EdgeInsets.only(top:100),
                //shrinkWrap: true,
                children: <Widget>[
                  Row(crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(height: 250,
                          width: 250,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/logouda.jpg"),
                              //image: NetworkImage(images[i]),
                              fit: BoxFit.fill,
                            ),
                          ),
                        )
                      ]
                  ),
                  Row(crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[Padding(
                          padding: const EdgeInsets.all(40.0),
                          child: Text("Bienvenido",style: TextStyle(fontSize: 30,fontFamily: "Verdana",
                              color: Colors.indigoAccent,fontWeight: FontWeight.bold))
                      ),
                      ]),
                ]
            )
        )
      //)
    );
  }
}

class Principal extends StatelessWidget {
  //final String codigo;
  //const Principal({required this.codigo});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter App Learning',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: PrincipalHome());
  }
}


