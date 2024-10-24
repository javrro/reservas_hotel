import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:reservas_hotel/models/room.dart';

class HabitacionesRepository{
  const HabitacionesRepository();
  
  Future<List<Room>> fetchHabitaciones() async{
    await Future.delayed(const Duration(seconds: 2));
    final String habitacionesRawData = await rootBundle.loadString('assets/dummy_data/habitaciones.json');
    final List<dynamic> tempList = jsonDecode(habitacionesRawData);
    return tempList.map((e) => Room.fromJson(e)).toList();  
  }
}