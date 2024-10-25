import 'package:equatable/equatable.dart';
import 'package:reservas_hotel/models/room.dart';

enum RoomsStatus { unknown, loading, loaded }

class RoomsState extends Equatable {
  const RoomsState({
    this.status = RoomsStatus.unknown,
    this.habitaciones = const [],
  });

  final RoomsStatus status;
  final List<Room> habitaciones;

  RoomsState copyWith({
    RoomsStatus? status,
    List<Room>? habitaciones,
  }) {
    return RoomsState(
      status: status ?? this.status,
      habitaciones: habitaciones ?? this.habitaciones,
    );
  }

  @override
  List<Object> get props => [status];
}
