import 'dart:async';
import 'package:ciclo_4_b/usuario.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'negocio.dart';

class MetodosSQLite {

late Future<Database> database;

Future<Database> connect() async {
  Future<Database> db = openDatabase(
    join(await getDatabasesPath(), 'base_de_datos_aplicacion.db'),
    onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE negocios(id INTEGER PRIMARY KEY, nombre TEXT, direccion TEXT, localizacion TEXT, telefono TEXT, celular TEXT, pagina TEXT); "+
        "CREATE TABLE usuarios(id INTEGER PRIMARY KEY, nombre TEXT, direccion TEXT, telefono TEXT, celular TEXT); "

      );
    },
    version: 1,
  );
  return db;

}

Future<void> insertarNegocio(Negocio negocio) async {
  // Obtiene una referencia de la base de datos
  final Database db = await database;

  // Inserta el Dog en la tabla correcta. También puede especificar el
  // `conflictAlgorithm` para usar en caso de que el mismo Dog se inserte dos veces.
  // En este caso, reemplaza cualquier dato anterior.
  await db.insert(
    'negocios',
    negocio.toJson(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<List<Negocio>> listarNegocios() async {
  // Obtiene una referencia de la base de datos
  final Database db = await database;

  // Consulta la tabla por todos los Dogs.
  final List<Map<String, dynamic>> maps = await db.query('negocios');

  // Convierte List<Map<String, dynamic> en List<Dog>.
  return List.generate(maps.length, (i) {
    return Negocio.fromJson(
        maps[i]
    );
  });
}

Future<void> actualizarNegocio(Negocio negocio) async {
  // Obtiene una referencia de la base de datos
  final db = await database;

  // Actualiza el Dog dado
  await db.update(
    'negocios',
    negocio.toJson(),
    // Aseguúrate de que solo actualizarás el Dog con el id coincidente
    where: "id = ?",
    // Pasa el id Dog a través de whereArg para prevenir SQL injection
    whereArgs: [negocio.id],
  );
}

Future<void> borrarNegocio(int id) async {
  final db = await database;

  // Elimina el Dog de la base de datos
  await db.delete(
    'negocios',
    where: "id = ?",
    whereArgs: [id],
  );
}


Future<void> insertarUsuario(Usuario usuario) async {
  // Obtiene una referencia de la base de datos
  final Database db = await database;

  // Inserta el Dog en la tabla correcta. También puede especificar el
  // `conflictAlgorithm` para usar en caso de que el mismo Dog se inserte dos veces.
  // En este caso, reemplaza cualquier dato anterior.
  await db.insert(
    'usuarios',
    usuario.toJson(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<List<Usuario>> usuarios() async {
  // Obtiene una referencia de la base de datos
  final Database db = await database;

  // Consulta la tabla por todos los Dogs.
  final List<Map<String, dynamic>> maps = await db.query('negocios');

  return List.generate(maps.length, (i) {
    return Usuario.fromJson(
        maps[i]
    );
  });
}

Future<void> actualizarUsuario(Usuario usuario) async {
  final db = await database;
  await db.update(
    'usuarios',
    usuario.toJson(),
    where: "id = ?",
    whereArgs: [usuario.id],
  );
}

Future<void> borrarUsuario(int id) async {
  final db = await database;
  await db.delete(
    'usuarios',
    where: "id = ?",
    whereArgs: [id],
  );
}
}

