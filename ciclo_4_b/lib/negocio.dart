import 'dart:convert';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'base_de_datos.dart';

class Negocio {
  final int id;
  final String nombre;
  final String direccion;
  final String localizacion;
  final String telefono;
  final String celular;
  final String paginaWeb;
  /*final List<String> productos;
  final Image logo;
  final Image foto;*/
  Negocio(this.id,this.nombre,this.direccion,this.localizacion,this.telefono,this.celular,this.paginaWeb,/*this.productos,this.logo,this.foto*/);

  Negocio.fromJson(Map<String, dynamic> json)
  : id = json['id'],
    nombre = json['nombre'],
    direccion = json['direccion'],
    localizacion = json['localizacion'],
    telefono = json['telefono'],
    celular = json['celular'],
    paginaWeb = json['pagina'];

  get database => connect();

  Map<String, dynamic> toJson() => {
    'id' : id,
    'nombre' : nombre,
    'direccion' : direccion,
    'localizacion' : localizacion,
    'telefono' : telefono,
    'celular' : celular,
    'pagina' : paginaWeb
      };

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

    Future<List<Negocio>> negocios() async {
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

  }
