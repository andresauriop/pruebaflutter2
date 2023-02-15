import 'dart:async';

import 'package:flutter/material.dart';



class Portada extends StatelessWidget {
  const Portada({super.key});

  @override
  void llamardetalle(String codigo)
  {
    /*Navigator.push(
      context,
      MaterialPageRoute(
        //builder: (context) => DetailScreen(codigo: codigo),
        builder: (context) => Detalleful(codigo: codigo),
      ),
    );*/
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

