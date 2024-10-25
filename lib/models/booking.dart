class Booking {
  final int id;
  final int totalDeNoches;
  final String fechaDeEntrada;
  final String fechaDeSalida;
  final String estadoDeReserva;
  final double precioTotal;
  final int clientId;
  final int habitacionId;

  Booking(this.id, this.totalDeNoches, this.fechaDeEntrada, this.fechaDeSalida,
      this.estadoDeReserva, this.precioTotal, this.clientId, this.habitacionId);

  Booking.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        totalDeNoches = json['totalDeNoches'],
        fechaDeEntrada = json['fechaDeEntrada'],
        fechaDeSalida = json['fechaDeSalida'],
        estadoDeReserva = json['estadoDeReserva'],
        precioTotal = json['precioTotal'],
        clientId = json['clientId'],
        habitacionId = json['habitacionId'];

  // Map<String, dynamic> toJson() => {
  //       'name': name,
  //       'email': email,
  //     };
}
