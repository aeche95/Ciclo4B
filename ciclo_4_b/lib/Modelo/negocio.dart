class Negocio {
  final int id;
  final String nombre;
  final String direccion;
  final String localizacion;
  final String telefono;
  final String celular;
  final String paginaWeb;
  final List<String> productos;
  final String logoName;
  final String fotoName;
  Negocio(this.id,this.nombre,this.direccion,this.localizacion,this.telefono,this.celular,this.paginaWeb,this.productos,this.logoName,this.fotoName);

  Negocio.fromJson(Map<String, dynamic> json)
  : id = json['id'],
    nombre = json['nombre'],
    direccion = json['direccion'],
    localizacion = json['localizacion'],
    telefono = json['telefono'],
    celular = json['celular'],
    paginaWeb = json['pagina'],
    productos = json['productos'],
    logoName = json['logoName'],
    fotoName = json['fotoName'];

  Map<String, dynamic> toJson() => {
    'id' : id,
    'nombre' : nombre,
    'direccion' : direccion,
    'localizacion' : localizacion,
    'telefono' : telefono,
    'celular' : celular,
    'pagina' : paginaWeb,
    'productos' : productos,
    'logoName' : logoName,
    'fotoName' : fotoName
      };


  }
