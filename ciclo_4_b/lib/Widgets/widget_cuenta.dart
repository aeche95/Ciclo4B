import 'package:ciclo_4_b/Modelo/usuario.dart';
import 'package:ciclo_4_b/Utils/base_de_datos.dart';
import 'package:ciclo_4_b/Widgets/widget_bienvenida.dart';
import 'package:ciclo_4_b/Widgets/widget_ingreso.dart';
import 'package:flutter/material.dart';

class WidgetCuenta extends StatefulWidget{
  const WidgetCuenta({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WidgetCuentaState();

}

class _WidgetCuentaState extends State<WidgetCuenta>{
  Usuario usuario = MetodosSQLite.listaUsuarios[2];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(
              child: Row(
                children: [
                  Icon(Icons.person,size: 60,),
                  Text("Hola "+ usuario.nombre,
                  style: TextStyle(
                    fontSize: 18
                  ),)
                ],
              ),
            ),
            Row(
              children: [

              ],
            ),
            Row(children: [
              ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => WidgetBienvenida()));
                  },
                  child: Text("Cerrar Sesion")
              ),
              IconButton(icon: Icon(Icons.door_back_door,
                semanticLabel: "Salir",),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => WidgetBienvenida()));
                },
              ),
            ],),
            Row(
              children: [
                ElevatedButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => WidgetBienvenida()));
                    },
                    child: Text("Editar Datos")
                ),
                IconButton(icon: Icon(Icons.settings,
                  semanticLabel: "Editar",),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => WidgetBienvenida()));
                  },
                )
              ],
            ),

          ],
        ),

      ),
    );
  }
}
