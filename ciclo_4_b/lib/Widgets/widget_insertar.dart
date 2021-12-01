import 'package:ciclo_4_b/Widgets/widget_cuenta.dart';
import 'package:flutter/material.dart';

class WidgetInsertar extends StatefulWidget{
  const WidgetInsertar({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WidgetInsertarState();

}

class _WidgetInsertarState extends State<WidgetInsertar> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom:  TabBar(
              tabs: [
                Tab(text: "Insertar Negocio",),
                Tab(text: "Insertar Usuario",)
              ]
          ),
        ),
          body: TabBarView(children: [
                insertarNegocio(),
                insertarUsuario()
              ])
          ),
        );
  }
}
Widget insertarNegocio(){
  return Column(
    children: <Widget>[
      TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Nombre",
            icon: Icon(Icons.person),)
      ),
      TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Direccion",
            icon: Icon(Icons.person),)
      ),
      TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Localizacion",
            icon: Icon(Icons.person),)
      ),
      TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Telefono",
            icon: Icon(Icons.person),)
      ),
      TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Celular",
            icon: Icon(Icons.person),)
      ),
      TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Pagina Web",
            icon: Icon(Icons.person),)
      ),

    ],
  );
}

Widget insertarUsuario(){
  return Column(
    children: <Widget>[
      TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Nombre",
            icon: Icon(Icons.person),)
      ),
      TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Direccion",
            icon: Icon(Icons.person),)
      ),
      TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Telefono",
            icon: Icon(Icons.person),)
      ),
      TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Celular",
            icon: Icon(Icons.person),)
      ),

    ],
  );
}