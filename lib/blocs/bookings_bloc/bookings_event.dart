import 'package:equatable/equatable.dart';
import 'package:reservas_hotel/models/booking.dart';

abstract class BookingsEvent extends Equatable {
  const BookingsEvent();

  @override
  List<Object> get props => [];
}

class BookingsFetch extends BookingsEvent {}

class BookingsPost extends BookingsEvent {
  const BookingsPost(this.booking);
  final Booking booking;

  @override
  List<Object> get props => [booking];
}

class BookingsDelete extends BookingsEvent {
  const BookingsDelete(this.bookingId);
  final int bookingId;

  @override
  List<Object> get props => [bookingId];
}
