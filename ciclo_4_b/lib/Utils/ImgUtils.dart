import 'package:flutter/material.dart';

class ImgUtils{

  static Image ImageUtil(String ImageName){
    String path = "assets/imagenes/";
    return Image.asset(
      path+ImageName,
      width: 120,
      height: 120,);
  }
}