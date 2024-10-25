class Room {
  final int id;
  final int numeroHabitacion;
  final String tipo;
  final String descripcion;
  final String estado;
  final double precioPorNoche;

  Room(this.id, this.numeroHabitacion, this.tipo, this.descripcion, this.estado,
      this.precioPorNoche);

  Room.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        numeroHabitacion = json['numeroHabitacion'],
        tipo = json['tipo'],
        descripcion = json['descripcion'],
        estado = json['estado'],
        precioPorNoche = json['precioPorNoche'];

  // Map<String, dynamic> toJson() => {
  //       'name': name,
  //       'email': email,
  //     };
}
