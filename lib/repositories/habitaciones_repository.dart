// import 'dart:convert';

import 'package:flutter/foundation.dart';
// import 'package:flutter/services.dart';
import 'package:reservas_hotel/db/hotel_database.dart';
import 'package:reservas_hotel/models/room.dart';

class HabitacionesRepository {
  HabitacionesRepository(this.hotelDatabase);
  final HotelDatabase hotelDatabase;

  Future<List<Room>> fetchHabitaciones() async {
    await Future.delayed(const Duration(seconds: 2));

    List<Map<String, dynamic>> rooms =
        await hotelDatabase.obtenerHabitaciones();

    debugPrint("===> ROOMS FROM DB ${rooms.length} ");

    // final String habitacionesRawData =
    //     await rootBundle.loadString('assets/dummy_data/habitaciones.json');
    // final List<dynamic> tempList = jsonDecode(habitacionesRawData);
    return rooms.map((e) => Room.fromJson(e)).toList();
  }
}
