class Reserva {
  final String id;

  Reserva(this.id);

  Reserva.fromJson(Map<String, dynamic> json) : id = json['id'];

  // Map<String, dynamic> toJson() => {
  //       'name': name,
  //       'email': email,
  //     };
}