import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WidgetBusqueda extends StatefulWidget {
  const WidgetBusqueda({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WidgetBusquedaState();
}

class _WidgetBusquedaState extends State<WidgetBusqueda>{
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: negocios.length,
      itemBuilder: (BuildContext context, int index){
        return WidgetNegocio(negocio:
        negocios[index]
        );
      },
    );
  }

}

