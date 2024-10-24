import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:http/http.dart';
import 'package:reservas_hotel/blocs/habitaciones_bloc/habitaciones_event.dart';
import 'package:reservas_hotel/blocs/habitaciones_bloc/habitaciones_state.dart';
import 'package:reservas_hotel/repositories/habitaciones_repository.dart';

class HabitacionesBloc extends Bloc<HabitacionesEvent, HabitacionesState> {
  HabitacionesBloc(this._habitacionesRepository)
      : super(const HabitacionesState()) {
    /// TODO: register on<PostFetched> event
  }

  final HabitacionesRepository _habitacionesRepository;
}
