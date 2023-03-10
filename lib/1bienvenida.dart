import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '2categorias.dart';
import '4Productos.dart';
import 'dart:async';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(Aplicacion());
  //runApp(Splash2());
}

class Aplicacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /*title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),*/
      home: Splash2(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class Splash2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      //navigateAfterSeconds: new MyApp(),//new SecondScreen(),
      navigateAfterSeconds: new Categorias(),
      title: new Text("Bienvenido",style: TextStyle(fontSize: 30,fontFamily: "Verdana",
          color: Colors.blueAccent,fontWeight: FontWeight.bold)),
        image: new Image.asset("assets/images/logouda.jpg"),
      //image: new Image.network('https://www.geeksforgeeks.org/wp-content/uploads/gfg_200X200.png'),
      loadingText: Text("Cargando"),
      photoSize: 150.0,
      loaderColor: Colors.blueAccent,
    );
  }
}
/*class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("GeeksForGeeks")),
      body: Center(
          child:Text("Home page",textScaleFactor: 2,)
      ),
    );
  }
}*/


