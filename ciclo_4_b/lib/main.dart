import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      title: 'Aplicacion Movil Ciclo 4B',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Aplicacion movil Ciclo 4B'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //int _counter = 0;

  /*void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      //_counter++;
    });
  }*/
  List<String> listaDirecciones = ["cacsdf","afead","svfdasfas","vafada","cafefs"];
  List<String> listaTelefonos = ["43431","852423","3534524","52352","542423"];
  List<String> listaCelulares = ["5234133","4234235","4234545","523323","524523"];
  List<String> listaSitios = ["gsgvdsds","fsfvds","fajaasca","frdvdss","ffacdas"];
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: ListView.builder(
          itemCount: listaDirecciones.length,
          itemBuilder: (BuildContext context, int index){
            return Negocio(
              Direccion: listaDirecciones[index],
              Telefono: listaTelefonos[index],
              Celular: listaCelulares[index],
              SitioWeb: listaSitios[index],
            );
          },
        )
      )

    );
  }
}

class Negocio extends StatefulWidget {
  const Negocio({Key? key, required this.Direccion,required this.Telefono, required this.Celular, required this.SitioWeb}) : super(key: key);
  final String Direccion;
  final String Telefono;
  final String Celular;
  final String SitioWeb;
  @override
  _NegocioState createState() => _NegocioState();
}
  class _NegocioState extends State<Negocio> {
    final String title = "Flutter Demo Home Page";
    @override
    Widget build(BuildContext context) {
      return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Icon(Icons.fastfood
                        ),
                        Text(
                            "Nombre"
                        ),
                      ]
                  ),
                  hacerFilaDatos("Direccion ", widget.Direccion),
                  hacerFilaDatos("Telefono ", widget.Telefono),
                  hacerFilaDatos("Celular ", widget.Celular),
                  hacerFilaDatos("Sitio Web ", widget.SitioWeb)
                ]
            );
    }

    Center hacerFilaDatos(String label, String dato)
    {
      final double TextSize = 1.5;
      return Center(
        child: Row(
        children: <Widget>[
          Text(label,
          textScaleFactor: TextSize
          ),
          Text(dato,
          textScaleFactor: TextSize,)
        ]
      )
      );
    }

  }



