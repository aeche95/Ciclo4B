import 'package:flutter/material.dart';

class WidgetCuenta extends StatefulWidget{
  const WidgetCuenta({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WidgetCuentaState();

}

class _WidgetCuentaState extends State<WidgetCuenta>{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text("Cuenta"),
        ],
      ),

    );
  }
}
