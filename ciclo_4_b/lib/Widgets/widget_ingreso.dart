import 'package:ciclo_4_b/Modelo/usuario.dart';
import 'package:ciclo_4_b/Widgets/widget_container1.dart';
import 'package:ciclo_4_b/Widgets/widget_pagina_principal.dart';
import '../Utils/base_de_datos.dart';
import 'package:flutter/material.dart';

class WidgetIngreso extends StatefulWidget{
  const WidgetIngreso({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WidgetIngresoState();

}

class _WidgetIngresoState extends State<WidgetIngreso>{

  var db = MetodosSQLite();
  String textoUsuario = "";
  String textoContrasena = "";
  @override
  Widget build(BuildContext context) {
   return SafeArea(
     child: Scaffold(
       body: Stack(
         children: [
           WidgetContainer1(height: 0.75,),
           Center(
             child: Column(
             mainAxisSize: MainAxisSize.min,
             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
               Padding(
                 padding: const EdgeInsets.all(10.0),
                 child: TextField(
                   decoration: InputDecoration(
                     fillColor: Colors.white,
                     focusColor: Colors.white,
                     border: OutlineInputBorder(),
                     labelText: "Usuario",
                     icon: Icon(Icons.person),
                   ),
                   onChanged: (String value){
                     textoUsuario = value;
                   },
                   enableSuggestions: true,


                 ),
               ),
               Padding(
                 padding: const EdgeInsets.all(10.0),
                 child: TextField(
                 decoration: InputDecoration(
                 border: OutlineInputBorder(),
                 labelText: "Contraseña",
                 icon: Icon(Icons.password)
                 ),
                 obscureText: true,
                 enableSuggestions: false,
                 autocorrect: false,
                 onChanged: (String value){
                   textoContrasena = value;
                   },
                 ),
               ),
               ButtonBar(
                 children: [
                   OutlinedButton(
                       onPressed: (){
                         db.connect();
                         bool correcto = false;
                         for (Usuario u in MetodosSQLite.listaUsuarios){
                           if (u.password == textoContrasena){
                             correcto = true;
                           }
                         }
                         if(correcto) {
                           Navigator.push(context, MaterialPageRoute(
                               builder: (context) => MyApp()));
                         }
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
       ]
       ),
     ),
   );
  }
}