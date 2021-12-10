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
  Usuario usuario = MetodosSQLite.listaUsuarios[0];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(Icons.person,size: 60,),
              Text("Hola "+ usuario.nombre)
            ],
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            overflowDirection: VerticalDirection.down,
            children: [],
          ),
          Text("Cuenta"),
          IconButton(icon: Icon(Icons.door_back_door),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => WidgetBienvenida()));
            },


          )
        ],
      ),

    );
  }
}
