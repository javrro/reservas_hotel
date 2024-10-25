import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:reservas_hotel/models/booking.dart';

class ReservasRepository {
  const ReservasRepository();

  Future<List<Booking>> fetchReservas() async {
    await Future.delayed(const Duration(seconds: 2));
    final String reservasRawData =
        await rootBundle.loadString('assets/dummy_data/reservas.json');
    final List<dynamic> tempList = jsonDecode(reservasRawData);
    return tempList.map((e) => Booking.fromJson(e)).toList();
  }
}
