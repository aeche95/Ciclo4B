class Usuario{
  final int id;
  final String nombre;
  final String direccion;
  final String telefono;
  final String celular;
  final String password;
  Usuario(this.id,this.nombre,this.direccion,this.telefono, this.celular, this.password);

  Usuario.fromJson(Map<String, dynamic> json)
    :id = json["id"],
     nombre = json['nombre'],
     direccion = json['direccion'],
     telefono = json['telefono'],
     celular = json['celular'],
     password = json['password'];

  Map<String, dynamic> toJson() => {
    'id' : id,
    'nombre' : nombre,
    'direccion' : direccion,
    'telefono' : telefono,
    'celular' : celular,
    'password' : password
  };

}