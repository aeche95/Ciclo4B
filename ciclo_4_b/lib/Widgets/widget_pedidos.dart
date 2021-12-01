import 'package:flutter/material.dart';

class WidgetPedidos extends StatefulWidget{
  const WidgetPedidos({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WidgetPedidoState();

}

class _WidgetPedidoState extends State<WidgetPedidos>{
  @override
  Widget build(BuildContext context) {
    return Text("Pedidos");
  }

}