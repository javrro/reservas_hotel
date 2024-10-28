import 'package:reservas_hotel/models/room.dart';

class Booking {
  int? id;
  final int totalDeNoches;
  final String fechaDeEntrada;
  final String fechaDeSalida;
  final String estadoDeReserva;
  final double precioTotal;
  // final int clientId;
  Room? habitacion;

  int? habitacionId;
  int? numeroHabitacion;
  String? tipo;
  String? descripcion;
  String? estado;
  double? precioPorNoche;
  int? miniatura;

  Booking(this.totalDeNoches, this.fechaDeEntrada, this.fechaDeSalida,
      this.estadoDeReserva, this.precioTotal, this.habitacionId);

  Booking.fromJsonDummy(Map<String, dynamic> json)
      : id = json['id'],
        fechaDeEntrada = json['fechaDeEntrada'],
        fechaDeSalida = json['fechaDeSalida'],
        estadoDeReserva = json['estadoDeReserva'],
        totalDeNoches = json['totalDeNoches'],
        precioTotal = json['precioTotal'],
        // clientId = json['clientId'],
        habitacion = Room.fromJsonDummy(json['habitacion']);

  Booking.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        fechaDeEntrada = json['fecha_entrada'],
        fechaDeSalida = json['fecha_salida'],
        estadoDeReserva = json['estado'],
        totalDeNoches = json['total_noches'],
        precioTotal = json['precio_total'],
        habitacionId = json['id'],
        numeroHabitacion = json['numero_habitacion'],
        tipo = json['tipo'],
        descripcion = json['descripcion'],
        estado = json['estado'],
        precioPorNoche = json['precio_por_noche'],
        miniatura = json['miniatura'];

  Map<String, dynamic> toJson() => {
        'fecha_entrada': fechaDeEntrada,
        'fecha_salida': fechaDeSalida,
        'estado': estadoDeReserva,
        'total_noches': totalDeNoches,
        'precio_total': precioTotal,
        'habitacion_id': habitacionId
      };
}
