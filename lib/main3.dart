import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  List<String> images = [
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
    "assets/images/cuatro.jpg",
    "assets/images/uno.jpg",
    "assets/images/dos.png",
    "assets/images/tres.jpg",
    "assets/images/cuatro.jpg"

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter ListView"),

        ),
        /*body: ListView.builder(
            itemBuilder: (BuildContext, index){
              return Card(
                child: ListTile(
                  leading: CircleAvatar(backgroundImage: AssetImage(images[index]),),
                  title: Text("This is title"),
                  subtitle: Text("This is subtitle"),
                ),
              );
            },
            itemCount: images.length,
            shrinkWrap: true,
            padding: EdgeInsets.all(5),
            scrollDirection: Axis.vertical,*/

        /*body: GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          crossAxisCount: 3,
          // Generate 100 widgets that display their index in the List.
          children: List.generate(100, (index) {
            return Center(
              child: Text(
                'Item $index',
                style: Theme.of(context).textTheme.headline5,
              ),
            );
          }),
        ),

      );*/

        body: GridView.builder(

            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 2 / 3,
                crossAxisSpacing: 20,

                mainAxisSpacing: 20),
            itemCount: images.length,

            itemBuilder: (BuildContext ctx, index) {
              //return Container(
              /*
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(15)),
                //child: Text(myProducts[index]["name"]),
                child: Text(
                  'Item $index',
                  style: Theme.of(context).textTheme.headline5,
                ),*/

              return Card(

                  margin: EdgeInsets.all(10),
                  //child: SingleChildScrollView(
                  color: Colors.amber,
                  child: InkWell(

                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      /*  const ListTile(
                 leading: CircleAvatar(backgroundImage: AssetImage("assets/images/cuatro.jpg"),),
                //title: Text('The Enchanted Nightingale'),
                //subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
              ),*/
                      Row(
                          //mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            /*ConstrainedBox(
                                constraints: BoxConstraints(
                                  minWidth: 44,
                                  minHeight: 100,
                                  maxWidth: 64,
                                  maxHeight: 100,
                                ),
                                child: Image.asset(images[index]))*/
                            Expanded(
                              // your image goes here which will take as much height as possible.
                              //child: Image.asset(images[index], fit: BoxFit.contain),

                  //child: Image.asset(images[index],height: 200,width: 100, )
                            child: Padding(
                                  //padding: const EdgeInsets.all(16.0),
                                  padding: const EdgeInsets.only(left:2.0,right: 2.0,top:2.0), // .all(16.0),
                                  child: Image.asset(images[index],height: 190,width: 100,),
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
                      onTap: (){
                        var snackBar = SnackBar(content: Text(images[index]));
                        // Step 3
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                  )
                 );
              //);

              /*child: ListTile(

                //leading: CircleAvatar(backgroundImage: AssetImage(images[index]),),
                  // Coloca la imagen rectangular
                  leading: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: 44,
                      minHeight: 44,
                      maxWidth: 64,
                      maxHeight: 64,
                    ),
                    child: Image.asset(images[index])),

                  //title: Text("This is title"),
                  //subtitle: Text("This is subtitle"),*/


              //);
              //);
            }
        )
    );

    /*body: ListView(
          children: [
            Card(
                child: ListTile(
                  title:Text("List Item 1") ,
                )
            ),
            Card(
              child: ListTile(
                title: Text("List Item 2"),
              ),
            ),
            Card(
                child: ListTile(
                  title: Text("List Item 3"),
                )
            ),
          ],
          shrinkWrap: true,
        )*/
  }
}
