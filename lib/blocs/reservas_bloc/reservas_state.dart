import 'package:equatable/equatable.dart';

enum ReservasStatus { unknown, loading, loaded }

class ReservasState extends Equatable {
  const ReservasState({
    this.status = ReservasStatus.unknown,
    this.reservas = const [],
  });

  final ReservasStatus status;
  final List<String> reservas;

  ReservasState copyWith({
    ReservasStatus? status,
    List<String>? reservas,
  }) {
    return ReservasState(
      status: status ?? this.status,
      reservas: reservas ?? this.reservas,
    );
  }

  @override
  List<Object> get props => [status];
}
