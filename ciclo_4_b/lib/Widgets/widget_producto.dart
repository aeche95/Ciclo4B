import 'package:ciclo_4_b/Modelo/producto.dart';
import 'package:ciclo_4_b/Utils/ImgUtils.dart';
import 'package:flutter/material.dart';

class WidgetProducto extends StatefulWidget{
  const WidgetProducto({Key? key, required this.producto}) : super(key: key);

  final Producto producto;
  @override
  State<StatefulWidget> createState() => _WidgetProductoState();

}

class _WidgetProductoState extends State<WidgetProducto>{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          ImgUtils.ImageUtil(widget.producto.nombreFoto, 150, 150),
          Column(
            children: [
              Text(
                  widget.producto.nombre,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.deepPurple
                ),
              ),
              Text(
                  widget.producto.descripcion,
                style: estilo(),
              ),
              Text(
                  "Edad: +"+widget.producto.limiteEdad,
                style: estilo(),
              ),
              Text(
                widget.producto.disponibilidad,
                style: estilo(),
              ),
              Text(
                "Precio: \$" + widget.producto.precio,
                style: estilo(),
              ),
              Text(
                "Agregar al carrito",
              style: TextStyle(
                fontSize: 18,
                color: Colors.deepPurple
              ),
              )

            ],
          )
        ],
      ) ,
    );
  }

  TextStyle estilo(){
    return TextStyle(
      fontSize: 12,
      color: Colors.deepPurple
    );
  }

}