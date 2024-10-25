import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:http/http.dart';
import 'package:reservas_hotel/blocs/habitaciones_bloc/habitaciones_event.dart';
import 'package:reservas_hotel/blocs/habitaciones_bloc/habitaciones_state.dart';
import 'package:reservas_hotel/repositories/habitaciones_repository.dart';

class HabitacionesBloc extends Bloc<HabitacionesEvent, HabitacionesState> {
  HabitacionesBloc(this._habitacionesRepository)
      : super(const HabitacionesState()) {
    on<HabitacionesFetch>(_onHabitacionesFetched);
  }

  final HabitacionesRepository _habitacionesRepository;

  Future<void> _onHabitacionesFetched(
      HabitacionesFetch event, Emitter<HabitacionesState> emit) async {
    if (state.status == HabitacionesStatus.unknown) {
      final habitaciones = await _habitacionesRepository.fetchHabitaciones();
      return emit(state.copyWith(
        status: HabitacionesStatus.loaded,
        habitaciones: habitaciones,
      ));
    }
  }
}
