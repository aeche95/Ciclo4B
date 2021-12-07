import 'package:ciclo_4_b/Utils/ImgUtils.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../Modelo/negocio.dart';
import 'package:url_launcher/url_launcher.dart';

class WidgetNegocio extends StatefulWidget {
  const WidgetNegocio({Key? key, required this.negocio}) : super(key: key);
  final Negocio negocio;

  @override
  _WidgetNegocioState createState() => _WidgetNegocioState();
}

class _WidgetNegocioState extends State<WidgetNegocio> {
  final double textSize = 14;
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
  _abrirURL(String url) async {
    if(await canLaunch(url)){
      await launch(url);
    }
    else{
      throw 'No se pudo abrir $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                ImgUtils.ImageUtil(widget.negocio.logoName),
                Column(
                  children: [
                    Text(
                        widget.negocio.nombre,
                      style: TextStyle(
                        fontSize: 18
                      ),
                    ),
                    hacerFilaDatos("", widget.negocio.direccion),
                    hacerFilaDatos("Telefono ", widget.negocio.telefono),
                    hacerFilaDatos("Celular ", widget.negocio.celular),

                    TextButton(
                            onPressed: () => _abrirURL(widget.negocio.paginaWeb),
                            child: Text(widget.negocio.paginaWeb),
                    ),
                        ]
                    ),
                  ],
          ),
          /*SizedBox(
            width: 300,
            height: 200,
            child: GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 11.0,
                ),
            ),
          ),*/

          Container(
            child: Column(
              children: <Widget>[
                Text("Productos",
                style: TextStyle(
                  fontSize: textSize
                ),),
                Text(widget.negocio.productos.toString())
              ],
            ),
          ),
          ImgUtils.ImageUtil(widget.negocio.fotoName)
        ]
    );
  }

  Row hacerFilaDatos(String label, String dato)
  {

    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(label,
              style: TextStyle(
                fontSize: textSize
              )
          ),
          Text(dato,
          style: TextStyle(
          fontSize: textSize)
          )
        ]
    );
  }
}


