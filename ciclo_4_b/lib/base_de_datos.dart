import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


Future<Database> connect() async {
  final database = openDatabase(
    join(await getDatabasesPath(), 'base_de_datos_aplicacion.db'),
    onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE negocios(id INTEGER PRIMARY KEY, nombre TEXT, direccion TEXT, localizacion TEXT, telefono TEXT, celular TEXT, pagina TEXT); "+
        "CREATE TABLE usuarios(id INTEGER PRIMARY KEY, nombre TEXT, direccion TEXT, telefono TEXT, celular TEXT); "

      );
    },
    version: 1,
  );

  return database;
}

