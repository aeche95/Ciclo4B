import 'package:ciclo_4_b/Widgets/widget_busqueda.dart';
import 'package:ciclo_4_b/Widgets/widget_configuracion.dart';
import 'package:ciclo_4_b/Widgets/widget_cuenta.dart';
import 'package:ciclo_4_b/Widgets/widget_insertar.dart';
import 'package:ciclo_4_b/Widgets/widget_lista_negocios.dart';
import 'package:ciclo_4_b/Widgets/widget_pedidos.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import '../Utils/base_de_datos.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  FirebaseMessaging messaging = FirebaseMessaging.instance;
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
      home: MyHomePage(),
    );
  }

}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title = "Aplicacion Movil Ciclo 4B";

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool busquedaActiva = false;
  int _indice = 0;
  static List<Widget> WidgetsPaginaPrincipal = <Widget>[
    WidgetListaNegocios(listaNegocios: MetodosSQLite.listaNegocios,),
    WidgetInsertar(),
    WidgetPedidos(),
    WidgetConfiguracion()
  ];
  void _indiceDeBarraInferiorSeleccionado(int indice) {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _indice = indice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.tealAccent,
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () { setState(() {
              busquedaActiva = !busquedaActiva;
            }); },)
        ],
      ),
      drawer: const Drawer(
        child: WidgetCuenta(),
      ),

      body: Center(
          child: busquedaActiva? WidgetBusqueda() : WidgetsPaginaPrincipal[_indice]
      ),
      bottomNavigationBar: barraInferior(),


    );
  }

  BottomNavigationBar barraInferior() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Inicio"
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: "Crear"),
        BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Pedidos"
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Configuracion"
        ),
      ],
      currentIndex: _indice,
      unselectedItemColor: Colors.green,
      selectedItemColor: Colors.lightGreen,
      onTap: _indiceDeBarraInferiorSeleccionado,
    );
  }
}
