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
        appBar: TabBar(
          labelColor: Colors.lightGreen,
              tabs: [
                Tab(text: "Insertar Negocio",
                icon: Icon(Icons.fastfood),),
                Tab(text: "Insertar Usuario",
                icon: Icon(Icons.person),)
              ]
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
  return Center(
    child: Column(
      children: <Widget>[
        campo(Icons.person, "Nombre"),
        campo(Icons.directions, "Direccion"),
        campo(Icons.pin_drop, "Localizacion"),
        campo(Icons.phone, "Telefono"),
        campo(Icons.phone_android, "Celular"),
        campo(Icons.computer, "Pagina Web"),
        Row(
          children: [
            ElevatedButton(
                onPressed: ()=>{},
                child: Text("Agregar")
            ),
            ElevatedButton(
                onPressed: ()=>{},
                child: Text("Borrar"))

          ],)
      ],
    ),
  );
}

Widget insertarUsuario(){
  return Center(
    child: Column(
      children: <Widget>[
        campo(Icons.person, "Nombre"),
        campo(Icons.directions, "Direccion"),
        campo(Icons.phone, "Telefono"),
        campo(Icons.phone_android, "Celular"),
        Row(
          children: [
          ElevatedButton(
              onPressed: ()=>{},
              child: Text("Agregar")
          ),
            ElevatedButton(
                onPressed: ()=>{},
                child: Text("Borrar"))

        ],)

      ],
    ),
  );
}

Widget campo(IconData icono, String label){
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: label,
        icon: Icon(icono),

      ),
    ),
  );

}