import 'widget_negocio.dart';
import 'package:flutter/material.dart';
import '../base_de_datos.dart';

class WidgetBusqueda extends StatefulWidget {
  const WidgetBusqueda({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WidgetBusquedaState();
}

class _WidgetBusquedaState extends State<WidgetBusqueda>{
  MetodosSQLite db = MetodosSQLite();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child:ListView.builder(
        itemCount: db.listaNegocios.length,
        itemBuilder: (BuildContext context, int index){
          return WidgetNegocio(negocio:
          db.listaNegocios[index]
          );
        },
      ),
    )
    );
  }

}

