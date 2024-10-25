import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:http/http.dart';
import 'package:reservas_hotel/blocs/rooms_bloc/rooms_event.dart';
import 'package:reservas_hotel/blocs/rooms_bloc/rooms_state.dart';
import 'package:reservas_hotel/repositories/habitaciones_repository.dart';

class RoomsBloc extends Bloc<RoomsEvent, RoomsState> {
  RoomsBloc(this._habitacionesRepository)
      : super(const RoomsState()) {
    on<RoomsFetch>(_onHabitacionesFetched);
  }

  final HabitacionesRepository _habitacionesRepository;

  Future<void> _onHabitacionesFetched(
      RoomsFetch event, Emitter<RoomsState> emit) async {
    if (state.status == RoomsStatus.unknown) {
      debugPrint("===> HABITACIONES STATUS UNKNOWN... FETCHING...");
      final habitaciones = await _habitacionesRepository.fetchHabitaciones();
      debugPrint("===> HABITACIONES LOADED... EMMITING...");
      return emit(state.copyWith(
        status: RoomsStatus.loaded,
        habitaciones: habitaciones,
      ));
    }
  }
}
