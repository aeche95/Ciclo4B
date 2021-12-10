import 'package:ciclo_4_b/Utils/base_de_datos.dart';
import 'package:ciclo_4_b/Widgets/widget_container1.dart';
import 'package:ciclo_4_b/Widgets/widget_cuenta.dart';
import 'package:ciclo_4_b/Widgets/widget_producto.dart';
import 'package:ciclo_4_b/main.dart';
import 'package:flutter/material.dart';

class WidgetListaProductos extends StatefulWidget{
  const WidgetListaProductos({Key? key, required this.nombreNegocio}) : super(key: key);

  final String nombreNegocio;
  @override
  State<StatefulWidget> createState() => _WidgetListaProductosState();

}

class _WidgetListaProductosState extends State<WidgetListaProductos> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.nombreNegocio),

        ),
        body: Stack(
            children: [
              WidgetContainer1(height: 0.8),
              ListView.builder(
                  itemCount: MetodosSQLite.mapaProductos[widget.nombreNegocio]!
                      .length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.white),
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      margin: EdgeInsets.all(20),
                      child: WidgetProducto(
                          producto: MetodosSQLite.mapaProductos[widget
                              .nombreNegocio]![index]),
                    );
                  }
              ),
            ]
        ),
      ),
    );
  }
}