import 'package:ciclo_4_b/Utils/ImgUtils.dart';
import 'package:ciclo_4_b/Widgets/widget_container1.dart';
import 'package:ciclo_4_b/Widgets/widget_ingreso.dart';
import 'package:flutter/material.dart';

class WidgetBienvenida extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _WidgetBienvenidaState();

}

class _WidgetBienvenidaState extends State<WidgetBienvenida>{
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          WidgetContainer1(height: 0.6,),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ImgUtils.ImageUtil("LogoTiendaMintic.jpg", 200, 200),
                  Text(
                      "MinTic Delivery Store",
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.deepPurple,
                      padding: EdgeInsets.only(top: 15, left: 35, right: 35, bottom: 15)
                    ),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => WidgetIngreso()));
                      },

                      child: Text("Iniciar Sesion",
                      style: TextStyle(
                        fontSize: 18
                        ),
                      ),

                  ),
                  TextButton(
                      onPressed: (){

                      },
                      child: Text(
                          "Registrarse",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.deepPurple
                        ),
                      )
                  ),
                  TextButton(
                      onPressed: (){

                      },
                      child: Text("¿Olvidaste la contraseña?")
                  )

                ],
              ),
            ),
          )

        ],
      ),
    )
    );
  }

}