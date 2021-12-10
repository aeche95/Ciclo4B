import 'package:ciclo_4_b/Utils/ImgUtils.dart';
import 'package:ciclo_4_b/Widgets/widget_bienvenida.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';


class WidgetSplashScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>_WidgetSplashScreenState();

}

class _WidgetSplashScreenState extends State<WidgetSplashScreen>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EasySplashScreen(
        durationInSeconds: 3,
        navigator: WidgetBienvenida(),
        logo: ImgUtils.ImageUtil("LogoTiendaMintic.jpg",500,500),
        showLoader: true,
      ),
    );
  }

}