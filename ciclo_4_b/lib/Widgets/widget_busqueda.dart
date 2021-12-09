import 'package:ciclo_4_b/Modelo/negocio.dart';
import 'package:ciclo_4_b/Widgets/widget_lista_negocios.dart';
import 'package:flutter/material.dart';
import '../Utils/base_de_datos.dart';

class WidgetBusqueda extends StatefulWidget {
  const WidgetBusqueda({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WidgetBusquedaState();
}

class _WidgetBusquedaState extends State<WidgetBusqueda>{
  List<Negocio> listaTemp = MetodosSQLite.listaNegocios;
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Flex(
        direction: Axis.vertical,
        children: [
          TextField(
            onSubmitted: (String value) => _actualizarBusqueda(value),
          ),
          SizedBox(
            width: double.infinity,
              height: MediaQuery.of(context).size.height*0.75,
              child: WidgetListaNegocios(listaNegocios: listaTemp))
        ],
      ),
    );

  }

  void _actualizarBusqueda(String value){
    setState(() {
      for(Negocio n in MetodosSQLite.listaNegocios){
        if (n.nombre.contains(value) || n.productos.toString().contains(value)){
          if(!listaTemp.contains(n)){
            listaTemp.add(n);
          };
        }
        else{
          listaTemp.remove(n);
        }
      }
    });
  }
}

