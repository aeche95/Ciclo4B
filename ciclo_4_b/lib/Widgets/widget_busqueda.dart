import 'package:ciclo_4_b/Modelo/negocio.dart';
import 'package:ciclo_4_b/Widgets/widget_lista_negocios.dart';
import 'package:flutter/material.dart';
import '../base_de_datos.dart';

class WidgetBusqueda extends StatefulWidget {
  const WidgetBusqueda({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WidgetBusquedaState();
}

class _WidgetBusquedaState extends State<WidgetBusqueda>{
  List<Negocio> listaTemp = List.empty();
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              onChanged: (String value) => _actualizarBusqueda,
            ),
            WidgetListaNegocios(listaNegocios: listaTemp)
          ],
        ),
      ),
    );

  }

  void _actualizarBusqueda(String value){
    setState(() {
      for(Negocio n in MetodosSQLite.listaNegocios){
        if (n.nombre.contains(value) || n.productos.toString().contains(value)){
          listaTemp.add(n);
        }
        else{
          listaTemp.remove(n);
        }
      }
    });
  }
}

