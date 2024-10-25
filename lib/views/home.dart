import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservas_hotel/blocs/rooms_bloc/rooms_bloc.dart';
import 'package:reservas_hotel/blocs/rooms_bloc/rooms_event.dart';
import 'package:reservas_hotel/blocs/bookings_bloc/bookings_bloc.dart';
import 'package:reservas_hotel/blocs/bookings_bloc/bookings_event.dart';
import 'package:reservas_hotel/repositories/habitaciones_repository.dart';
import 'package:reservas_hotel/repositories/reservas_repository.dart';
import 'package:reservas_hotel/views/habitaciones_view.dart';
import 'package:reservas_hotel/views/reservas_view.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  final HabitacionesRepository _habitacionesRepository =
      const HabitacionesRepository();
  final ReservasRepository _reservasRepository = const ReservasRepository();

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Búsqueda",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: "Reservas",
          ),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        switch (index) {
          case 0:
            return CupertinoTabView(
              builder: (context) {
                return BlocProvider(
                    create: (context) {
                      return RoomsBloc(_habitacionesRepository)
                        ..add(RoomsFetch());
                    },
                    child: const HabitacionesView());
              },
            );
          case 1:
            return CupertinoTabView(
              builder: (context) {
                return BlocProvider(
                    create: (context) {
                      return BookingsBloc(_reservasRepository)
                        ..add(BookingsFetch());
                    },
                    child: const ReservasView());
              },
            );

          default:
            return const Center(
              child: Text("none"),
            );
        }
      },
    );
  }
}
