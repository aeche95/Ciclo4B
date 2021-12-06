import 'package:ciclo_4_b/Modelo/negocio.dart';
import 'package:ciclo_4_b/Widgets/widget_negocio.dart';
import 'package:flutter/material.dart';

class WidgetListaNegocios extends StatefulWidget{
  const WidgetListaNegocios({Key? key, required this.listaNegocios}) : super(key: key);
  final List<Negocio> listaNegocios;
  @override
  State<StatefulWidget> createState() => _WidgetListaNegociosState();

}

class _WidgetListaNegociosState extends State<WidgetListaNegocios>{

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.listaNegocios.length,
      itemBuilder: (BuildContext context, int index) {
        return WidgetNegocio(negocio:
        widget.listaNegocios[index]
        );
      },
    );
  }

}