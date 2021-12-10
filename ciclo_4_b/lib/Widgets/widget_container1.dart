import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class WidgetContainer1 extends StatelessWidget{
  WidgetContainer1({Key? key, required this.height}) : super (key: key);
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipPath(
        clipper: WaveClipperTwo(),
        child: Container(
          height: MediaQuery.of(context).size.height*height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.tealAccent
          ),
        ),
      ),
    );

  }
  
}