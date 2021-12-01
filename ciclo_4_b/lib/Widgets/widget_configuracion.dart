import 'package:flutter/material.dart';

class WidgetConfiguracion extends StatefulWidget{
  const WidgetConfiguracion({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WidgetConfiguracionState();
}

class _WidgetConfiguracionState extends State<WidgetConfiguracion>{
  @override
  Widget build(BuildContext context) {
    return Text("Configuracion");
  }

}