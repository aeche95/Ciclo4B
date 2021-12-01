import 'dart:convert';
import 'package:sqflite/sqflite.dart';

import '../base_de_datos.dart';

class Usuario{
  final int id;
  final String nombre;
  final String direccion;
  final String telefono;
  final String celular;
  Usuario(this.id,this.nombre,this.direccion,this.telefono, this.celular);

  Usuario.fromJson(Map<String, dynamic> json)
    :id = json["id"],
     nombre = json['nombre'],
     direccion = json['direccion'],
     telefono = json['telefono'],
     celular = json['celular'];

  Map<String, dynamic> toJson() => {
    'id' : id,
    'nombre' : nombre,
    'direccion' : direccion,
    'telefono' : telefono,
    'celular' : celular,
  };

}