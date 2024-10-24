import 'package:equatable/equatable.dart';

abstract class ReservasEvent extends Equatable {
  const ReservasEvent();

  @override
  List<Object> get props => [];
}

class ReservasFetch extends ReservasEvent {}