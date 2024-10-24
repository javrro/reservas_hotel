class Habitacion {
  final String id;

  Habitacion(this.id);

  Habitacion.fromJson(Map<String, dynamic> json) : id = json['id'];

  // Map<String, dynamic> toJson() => {
  //       'name': name,
  //       'email': email,
  //     };
}
