import 'package:ciclo_4_b/widget_ingreso.dart';
import 'package:ciclo_4_b/widget_negocio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'negocio.dart';
import 'base_de_datos.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //start();
  runApp(const App());
}
class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);
  // Create the initialization Future outside of `build`:
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  /// The future is part of the state of our widget. We should not call `initializeApp`
  /// directly inside [build].
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Center(child: const Text("Error", textDirection: TextDirection.ltr,));
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return const MyApp();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Center(child: Text("Loading...", textDirection: TextDirection.ltr,));
      },
    );
  }
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
      home: const WidgetIngreso(),
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
  int _indice = 0;

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

  List<Negocio> negocios = [Negocio(1,"ffsdfs","vfsfsdf","gsvdsvsd","cfsvsvs","fvsdvgvs","vsavf")];


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
          itemCount: negocios.length,
          itemBuilder: (BuildContext context, int index){
            return WidgetNegocio(negocio:
                negocios[index]
            );
          },
        )
      ),
      bottomNavigationBar: barraInferior(),


    );
  }
  BottomNavigationBar barraInferior ()
  {
    return BottomNavigationBar(items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Inicio"
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: "Busqueda"),
      BottomNavigationBarItem(
          icon: Icon(Icons.star),
          label: "Pedidos"
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: "Configuracion"
      )

    ],
      currentIndex: _indice,
      unselectedItemColor: Colors.green,
      selectedItemColor: Colors.lightGreen,
      onTap: _indiceDeBarraInferiorSeleccionado,
    );
  }
}







