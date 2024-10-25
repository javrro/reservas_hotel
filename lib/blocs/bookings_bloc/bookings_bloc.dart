import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservas_hotel/blocs/bookings_bloc/bookings_event.dart';
import 'package:reservas_hotel/blocs/bookings_bloc/bookings_state.dart';
//import 'package:http/http.dart';
import 'package:reservas_hotel/repositories/reservas_repository.dart';

class BookingsBloc extends Bloc<BookingsEvent, BookingsState> {
  BookingsBloc(this._reservasRepository) : super(const BookingsState()) {
    on<BookingsFetch>(_onReservasFetched);
  }

  final ReservasRepository _reservasRepository;

  Future<void> _onReservasFetched(
      BookingsFetch event, Emitter<BookingsState> emit) async {
    if (state.status == BookingsStatus.unknown) {
      debugPrint("===> RESERVAS STATUS UNKNOWN... FETCHING...");
      final reservas = await _reservasRepository.fetchReservas();
      debugPrint("===> RESERVAS LOADED... EMMITING...");
      return emit(state.copyWith(
        status: BookingsStatus.loaded,
        reservas: reservas,
      ));
    }
  }
}