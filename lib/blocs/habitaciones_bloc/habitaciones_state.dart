import 'package:equatable/equatable.dart';
import 'package:reservas_hotel/models/room.dart';

enum HabitacionesStatus { unknown, loading, loaded }

class HabitacionesState extends Equatable {
  const HabitacionesState({
    this.status = HabitacionesStatus.unknown,
    this.habitaciones = const [],
  });

  final HabitacionesStatus status;
  final List<Room> habitaciones;

  HabitacionesState copyWith({
    HabitacionesStatus? status,
    List<Room>? habitaciones,
  }) {
    return HabitacionesState(
      status: status ?? this.status,
      habitaciones: habitaciones ?? this.habitaciones,
    );
  }

  @override
  List<Object> get props => [status];
}
