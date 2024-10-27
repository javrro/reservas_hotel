import 'package:reservas_hotel/models/room.dart';

class Booking {
  final int id;
  final int totalDeNoches;
  final String fechaDeEntrada;
  final String fechaDeSalida;
  final String estadoDeReserva;
  final double precioTotal;
  final int clientId;
  final Room habitacion;

  Booking(this.id, this.totalDeNoches, this.fechaDeEntrada, this.fechaDeSalida,
      this.estadoDeReserva, this.precioTotal, this.clientId, this.habitacion);

  Booking.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        totalDeNoches = json['totalDeNoches'],
        fechaDeEntrada = json['fechaDeEntrada'],
        fechaDeSalida = json['fechaDeSalida'],
        estadoDeReserva = json['estadoDeReserva'],
        precioTotal = json['precioTotal'],
        clientId = json['clientId'],
        habitacion = Room.fromJson(json['habitacion']);

  // Map<String, dynamic> toJson() => {
  //       'name': name,
  //       'email': email,
  //     };
}
