import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:http/http.dart';
import 'package:reservas_hotel/blocs/Reservas_bloc/Reservas_event.dart';
import 'package:reservas_hotel/blocs/Reservas_bloc/Reservas_state.dart';

class ReservasBloc extends Bloc<ReservasEvent, ReservasState> {
  ReservasBloc(/*{required this.httpClient}*/) : super(const ReservasState()) {
   /// TODO: register on<PostFetched> event
  }

  //final Client httpClient;
}