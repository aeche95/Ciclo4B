import 'package:ciclo_4_b/Widgets/widget_pagina_principal.dart';
import '../main.dart';
import 'package:flutter/material.dart';

class WidgetIngreso extends StatefulWidget{
  const WidgetIngreso({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WidgetIngresoState();

}

class _WidgetIngresoState extends State<WidgetIngreso>{

  String TextoUsuario = "";
  String TextoContrasena = "";
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: Center(
       child: Column(
         mainAxisSize: MainAxisSize.max,
         mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[
           TextField(
             decoration: InputDecoration(
                 border: OutlineInputBorder(),
                 labelText: "Usuario",
                 icon: Icon(Icons.person),
             ),

           ),
           TextField(
           decoration: InputDecoration(
           border: OutlineInputBorder(),
           labelText: "Contraseña",
           icon: Icon(Icons.password)
           )
           ),
           ButtonBar(
             children: [
               OutlinedButton(
                   onPressed: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
                   },
                   child: Text(
                     "Ingresar"
                   )
               ),
               OutlinedButton(
                   onPressed: (){
                     setState(() {

                     });
                   },
                   child: Text(
                     "Borrar"
                   ))
             ],
           )
         ],
       ),
     ),
   );
  }
}