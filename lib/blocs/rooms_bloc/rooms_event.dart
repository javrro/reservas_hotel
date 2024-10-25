import 'package:equatable/equatable.dart';

abstract class RoomsEvent extends Equatable {
  const RoomsEvent();

  @override
  List<Object> get props => [];
}

class RoomsFetch extends RoomsEvent {}