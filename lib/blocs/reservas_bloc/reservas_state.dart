import 'package:equatable/equatable.dart';
import 'package:reservas_hotel/models/reserva.dart';

enum ReservasStatus { unknown, loading, loaded }

class ReservasState extends Equatable {
  const ReservasState({
    this.status = ReservasStatus.unknown,
    this.reservas = const [],
  });

  final ReservasStatus status;
  final List<Reserva> reservas;

  ReservasState copyWith({
    ReservasStatus? status,
    List<Reserva>? reservas,
  }) {
    return ReservasState(
      status: status ?? this.status,
      reservas: reservas ?? this.reservas,
    );
  }

  @override
  List<Object> get props => [status];
}
