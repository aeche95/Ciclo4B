import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'negocio.dart';

class WidgetNegocio extends StatefulWidget {
  const WidgetNegocio({Key? key, required this.negocio}) : super(key: key);
  final Negocio negocio;
  @override
  _WidgetNegocioState createState() => _WidgetNegocioState();
}
class _WidgetNegocioState extends State<WidgetNegocio> {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Icon(
                  Icons.fastfood,
                  size: 40,
                ),
                Text(
                    widget.negocio.nombre
                ),
              ]
          ),
          hacerFilaDatos("Direccion ", widget.negocio.direccion),
          hacerFilaDatos("Telefono ", widget.negocio.telefono),
          hacerFilaDatos("Celular ", widget.negocio.celular),
          hacerFilaDatos("Sitio Web ", widget.negocio.paginaWeb),
          Container(
            child: Column(
              children: <Widget>[
                Text("Productos"),
                Text("Lista de productos y servicios")
              ],
            ),
          ),
          Icon(Icons.photo,
          size: 100,)
        ]
    );
  }

  Row hacerFilaDatos(String label, String dato)
  {
    const double textSize = 18;
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(label,
              style: TextStyle(
                fontSize: textSize
              )
          ),
          Text(dato,
          style: TextStyle(
          fontSize: textSize)
          )
        ]
    );
  }
}