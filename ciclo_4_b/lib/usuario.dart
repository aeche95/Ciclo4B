import 'dart:convert';
import 'package:sqflite/sqflite.dart';

import 'base_de_datos.dart';

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

  get database => connect();

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

    // Convierte List<Map<String, dynamic> en List<Dog>.
    return List.generate(maps.length, (i) {
      return Usuario.fromJson(
          maps[i]
      );
    });
  }

  Future<void> actualizarUsuario(Usuario usuario) async {
    // Obtiene una referencia de la base de datos
    final db = await database;

    // Actualiza el Dog dado
    await db.update(
      'usuarios',
      usuario.toJson(),
      // Aseguúrate de que solo actualizarás el Dog con el id coincidente
      where: "id = ?",
      // Pasa el id Dog a través de whereArg para prevenir SQL injection
      whereArgs: [usuario.id],
    );
  }

  Future<void> borrarUsuario(int id) async {
    // Obtiene una referencia de la base de datos
    final db = await database;

    // Elimina el Dog de la base de datos
    await db.delete(
      'usuarios',
      // Utiliza la cláusula `where` para eliminar un dog específico
      where: "id = ?",
      // Pasa el id Dog a través de whereArg para prevenir SQL injection
      whereArgs: [id],
    );
  }
}