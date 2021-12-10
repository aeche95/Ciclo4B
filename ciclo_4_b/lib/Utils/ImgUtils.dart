import 'package:flutter/material.dart';

class ImgUtils{

  static Image ImageUtil(String ImageName, double width, double height){
    String path = "assets/imagenes/";
    return Image.asset(
      path+ImageName,
      width: width,
      height: height,);
  }
}