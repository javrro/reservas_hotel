import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:reservas_hotel/models/habitacion.dart';

class HabitacionesRepository{
  const HabitacionesRepository();
  
  Future<List<Habitacion>> fetchHabitaciones() async{
    await Future.delayed(const Duration(seconds: 2));
    final String habitacionesRawData = await rootBundle.loadString('assets/dummy_data/habitaciones.json');
    final List<dynamic> tempList = jsonDecode(habitacionesRawData);
    return tempList.map((e) => Habitacion.fromJson(e)).toList();  
  }
}