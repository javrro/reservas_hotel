import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:reservas_hotel/models/reserva.dart';

class ReservasRepository {
  const ReservasRepository();

  Future<List<Reserva>> fetchReservas() async {
    await Future.delayed(const Duration(seconds: 2));
    final String reservasRawData =
        await rootBundle.loadString('assets/dummy_data/Reservas.json');
    final List<dynamic> tempList = jsonDecode(reservasRawData);
    return tempList.map((e) => Reserva.fromJson(e)).toList();
  }
}
