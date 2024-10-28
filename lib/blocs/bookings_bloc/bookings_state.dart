// ignore_for_file: file_names

import 'package:equatable/equatable.dart';
import 'package:reservas_hotel/models/booking.dart';

enum BookingsStatus { unknown, loading, loaded, posting, posted, deleting, deleted }

class BookingsState extends Equatable {
  const BookingsState({
    this.status = BookingsStatus.unknown,
    this.reservas = const [],
  });

  final BookingsStatus status;
  final List<Booking> reservas;

  BookingsState copyWith({
    BookingsStatus? status,
    List<Booking>? reservas,
  }) {
    return BookingsState(
      status: status ?? this.status,
      reservas: reservas ?? this.reservas,
    );
  }

  @override
  List<Object> get props => [status];
}
