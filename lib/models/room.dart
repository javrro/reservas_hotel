class Room {
  final int id;
  final int numeroHabitacion;
  final String tipo;
  final String descripcion;
  final String estado;
  final double precioPorNoche;
  final int miniatura;

  Room(this.id, this.numeroHabitacion, this.tipo, this.descripcion, this.estado,
      this.precioPorNoche, this.miniatura);

  Room.fromJsonDummy(Map<String, dynamic> json)
      : id = json['id'],
        numeroHabitacion = json['numeroHabitacion'],
        tipo = json['tipo'],
        descripcion = json['descripcion'],
        estado = json['estado'],
        precioPorNoche = json['precioPorNoche'],
        miniatura = json['thumbnail'];

  Room.fromJson(Map<String, dynamic> json)
      : id = json['id_habitacion'],
        numeroHabitacion = json['numero_habitacion'],
        tipo = json['tipo'],
        descripcion = json['descripcion'],
        estado = json['estado'],
        precioPorNoche = json['precio_por_noche'],
        miniatura = json['miniatura'];

  // Map<String, dynamic> toJson() => {
  //       'name': name,
  //       'email': email,
  //     };
}
