import 'package:ciclo_4_b/Widgets/widget_ingreso.dart';
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Cuenta"),
          IconButton(icon: Icon(Icons.door_back_door),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => WidgetIngreso()));
            },

          )
        ],
      ),

    );
  }
}
