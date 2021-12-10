import 'dart:async';
import 'package:ciclo_4_b/Modelo/producto.dart';

import '../Modelo/usuario.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../Modelo/negocio.dart';

class MetodosSQLite {

  MetodosSQLite();
  late Future<Database> _database;
  static final List<Negocio> listaNegocios = [
    Negocio(0,"Farmacia Cruz Salud","Calle 125 # 45-78","Localizacion","1234567","1234567890","http://google.com",["acetaminofen","algodon","curitas"],"Farmacia.jpg","Farmacia.jpg"),
    Negocio(1,"La tienda de Ceci","Diag. 34 # 56- 23","Localizacion","1234567","1234567890","http://google.com",["acetaminofen","papas","gaseosa"],"Tienda.jpg","Tienda.jpg"),
    Negocio(2,"Cigarreria Don Pachito","Calle 24 # 56 -67","Localizacion","1234567","1234567890","http://google.com",["smirnoff","helado","acetaminofen"],"Cigarreria.jpg","Cigarreria.jpg"),
    ];

  static final List<Usuario> listaUsuarios = [
    Usuario(0,"Andres","Calle 2 # 56-36","2348945","3183693570","123"),
    Usuario(1,"Juan","Carrera 34 # 25-89","7247935","3142954794","123"),
    Usuario(2,"Pedro","Calle 64 # 83-46","7643274","3153957248","123"),
    Usuario(3,"Camila","Calle 27 # 67-33","6744328","3124825783","123"),
    Usuario(4,"Sergio","Carrera 129 # 46- 23","9763846","3215836736","123"),
    Usuario(5,"Sara","Calle 178 # 33-26","6438456","3174892485","123")
  ];

  static final Map<String, List<Producto>> mapaProductos = {
    "Farmacia Cruz Salud" : [
      Producto("Acetaminofen", "Analgesico para aliviar el dolor", "12", "Disponible", "Acetaminofen3.jpg","5500"),
      Producto("Algodon", "Algodon MK", "4", "Disponible", "algodon.jpg","5000"),
      Producto("Curitas", "Proteger cortes y raspaduras", "4", "No disponible", "cureband.jpg","5500")
    ],
    "La tienda de Ceci" : [
      Producto("Gaseosa", "Coca Cola", "12", "Disponible", "cocacola.png", "4000"),
      Producto("Papas Pringles", "Papas fritas varios sabores", "4", "Disponible", "pringles.jpg", "7000"),
      Producto("Acetaminofen", "Analgesico para aliviar el dolor", "12", "Disponible", "Acetaminofen3.jpg","5500"),
    ],
    "Cigarreria Don Pachito" : [
      Producto("Smirnoff", "Coctel aperitivo", "18", "Disponible", "smirnoff.jpg", "4000"),
      Producto("Helado", "Helado de vainilla y frutos secos", "4", "Disponible", "polet.jpg", "7000"),
      Producto("Acetaminofen", "Analgesico para aliviar el dolor", "12", "Disponible", "Acetaminofen3.jpg","5500"),
    ]
  };

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

