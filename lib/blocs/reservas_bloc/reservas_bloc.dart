import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:http/http.dart';
import 'package:reservas_hotel/blocs/Reservas_bloc/Reservas_event.dart';
import 'package:reservas_hotel/blocs/Reservas_bloc/Reservas_state.dart';
import 'package:reservas_hotel/repositories/reservas_repository.dart';

class ReservasBloc extends Bloc<ReservasEvent, ReservasState> {
  ReservasBloc(this._reservasRepository) : super(const ReservasState()) {
    on<ReservasFetch>(_onReservasFetched);
  }

  final ReservasRepository _reservasRepository;

  Future<void> _onReservasFetched(
      ReservasFetch event, Emitter<ReservasState> emit) async {
    if (state.status == ReservasStatus.unknown) {
      final reservas = await _reservasRepository.fetchReservas();
      return emit(state.copyWith(
        status: ReservasStatus.loaded,
        reservas: reservas,
      ));
    }
  }
}
