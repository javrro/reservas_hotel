// import 'dart:convert';

import 'package:flutter/foundation.dart';
// import 'package:flutter/services.dart';
import 'package:reservas_hotel/db/hotel_database.dart';
import 'package:reservas_hotel/models/booking.dart';

class ReservasRepository {
  const ReservasRepository(this.hotelDatabase);
  final HotelDatabase hotelDatabase;

  Future<List<Booking>> fetchReservas() async {
    await Future.delayed(const Duration(seconds: 2));

    List<Map<String, dynamic>> bookigns = await hotelDatabase.obtenerReservas();

    debugPrint("===> BOOKIGNS FROM DB ${bookigns.length} ");

    if (bookigns.isNotEmpty) {
      for (int i = 0; i < bookigns.length; i++) {
        debugPrint(bookigns[i].keys.toList().toString());
        debugPrint(bookigns[i]["id_reserva"].toString());
        debugPrint(bookigns[i]["habitacion_id"].toString());
        debugPrint(bookigns[i]["miniatura"].toString());
        debugPrint(bookigns[i]["estado"].toString());
      }
    }
    if (bookigns.isNotEmpty) {
      return bookigns.map((e) => Booking.fromJson(e)).toList();
    }

    return List.empty();
    // final String reservasRawData =
    //     await rootBundle.loadString('assets/dummy_data/reservas.json');
    // final List<dynamic> tempList = jsonDecode(reservasRawData);
    // return tempList.map((e) => Booking.fromJsonDummy(e)).toList();
  }

  Future<void> postReservas(Booking booking) async {
    await Future.delayed(const Duration(seconds: 2));

    await hotelDatabase.insertarReserva(booking.toJson());
  }

  Future<void> deleteReservas(int bookingId) async {
    await Future.delayed(const Duration(seconds: 1));

    await hotelDatabase.eliminarReserva(bookingId);
  }
}
