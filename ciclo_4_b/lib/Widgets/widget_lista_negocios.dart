import 'package:ciclo_4_b/Widgets/widget_negocio.dart';
import 'package:ciclo_4_b/base_de_datos.dart';
import 'package:flutter/material.dart';

class WidgetListaNegocios extends StatefulWidget{
  const WidgetListaNegocios({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WidgetListaNegociosState();

}

class _WidgetListaNegociosState extends State<WidgetListaNegocios>{

  var db = MetodosSQLite();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: db.listaNegocios.length,
      itemBuilder: (BuildContext context, int index) {
        return WidgetNegocio(negocio:
        db.listaNegocios[index]
        );
      },
    );
  }

}