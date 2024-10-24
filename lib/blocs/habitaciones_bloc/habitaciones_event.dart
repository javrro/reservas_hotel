import 'package:equatable/equatable.dart';

abstract class HabitacionesEvent extends Equatable {
  const HabitacionesEvent();

  @override
  List<Object> get props => [];
}

class HabitacionesFetch extends HabitacionesEvent {}