import 'package:ciclo_4_b/negocio.dart';
import 'package:ciclo_4_b/widget_negocio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WidgetBusqueda extends StatefulWidget {
  const WidgetBusqueda({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WidgetBusquedaState();
}

class _WidgetBusquedaState extends State<WidgetBusqueda>{
  List<Negocio> listaNegocios= [Negocio(1,"ffsdfs","vfsfsdf","gsvdsvsd","cfsvsvs","fvsdvgvs","vsavf")];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child:ListView.builder(
        itemCount: listaNegocios.length,
        itemBuilder: (BuildContext context, int index){
          return WidgetNegocio(negocio:
          listaNegocios[index]
          );
        },
      ),
    )
    );
  }

}

