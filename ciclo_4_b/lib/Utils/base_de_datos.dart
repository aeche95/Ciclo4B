import 'dart:async';
import '../Modelo/usuario.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../Modelo/negocio.dart';

class MetodosSQLite {

  MetodosSQLite();
  late Future<Database> _database;
  static final List<Negocio> listaNegocios = [
    Negocio(0,"Farmacia Cruz Salud","Calle 125 # 45-78","Localizacion","1234567","1234567890","http://google.com",["acetaminofen","papas","gaseosa"],"Farmacia.jpg","Farmacia.jpg"),
    Negocio(1,"La tienda de Ceci","Diag. 34 # 56- 23","Localizacion","1234567","1234567890","http://google.com",["acetaminofen","papas","gaseosa"],"Tienda.jpg","Tienda.jpg"),
    Negocio(2,"Cigarreria Don Pachito","Calle 24 # 56 -67","Localizacion","1234567","1234567890","http://google.com",["acetaminofen","papas","gaseosa"],"Cigarreria.jpg","Cigarreria.jpg"),
    ];

  List<Usuario> listaUsuarios = [
    Usuario(0,"fsfsdf","vsvbsvfs","645635","63675","123"),
    Usuario(1,"fsfsdf","vsvbsvfs","645635","63675","123"),
    Usuario(2,"fsfsdf","vsvbsvfs","645635","63675","123"),
    Usuario(3,"fsfsdf","vsvbsvfs","645635","63675","123"),
    Usuario(4,"fsfsdf","vsvbsvfs","645635","63675","123"),
    Usuario(5,"fsfsdf","vsvbsvfs","645635","63675","123")
  ];

  Future<void> connect() async {
    _database = openDatabase(
      join(await getDatabasesPath(), 'base_de_datos_aplicacion.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE negocios(id INTEGER PRIMARY KEY, nombre TEXT, direccion TEXT, localizacion TEXT, telefono TEXT, celular TEXT, pagina TEXT); "+
          "CREATE TABLE usuarios(id INTEGER PRIMARY KEY, nombre TEXT, direccion TEXT, telefono TEXT, celular TEXT); "

        );
      },
      version: 1,
    );
  }

  Future<void> insertarNegocio(Negocio negocio) async {
    // Obtiene una referencia de la base de datos
    final Database db = await _database;

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
    final Database db = await _database;

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
    final db = await _database;

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
    final db = await _database;

    // Elimina el Dog de la base de datos
    await db.delete(
      'negocios',
      where: "id = ?",
      whereArgs: [id],
    );
  }


  Future<void> insertarUsuario(Usuario usuario) async {
    // Obtiene una referencia de la base de datos
    final Database db = await _database;

    // Inserta el Dog en la tabla correcta. También puede especificar el
    // `conflictAlgorithm` para usar en caso de que el mismo Dog se inserte dos veces.
    // En este caso, reemplaza cualquier dato anterior.
    await db.insert(
      'usuarios',
      usuario.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Usuario>> listarUsuarios() async {
    // Obtiene una referencia de la base de datos
    final Database db = await _database;

    // Consulta la tabla por todos los Dogs.
    final List<Map<String, dynamic>> maps = await db.query('negocios');

    return List.generate(maps.length, (i) {
      return Usuario.fromJson(
          maps[i]
      );
    });
  }

  Future<void> actualizarUsuario(Usuario usuario) async {
    final db = await _database;
    await db.update(
      'usuarios',
      usuario.toJson(),
      where: "id = ?",
      whereArgs: [usuario.id],
    );
  }

  Future<void> borrarUsuario(int id) async {
    final db = await _database;
    await db.delete(
      'usuarios',
      where: "id = ?",
      whereArgs: [id],
    );
  }
}

