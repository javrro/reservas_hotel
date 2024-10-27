import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservas_hotel/blocs/bookings_bloc/bookings_bloc.dart';
import 'package:reservas_hotel/blocs/bookings_bloc/bookings_state.dart';

class ReservasView extends StatelessWidget {
  const ReservasView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child:
        BlocBuilder<BookingsBloc, BookingsState>(builder: (context, state) {
      return const SafeArea(
          child: CustomScrollView(
            slivers: [
              CupertinoSliverNavigationBar(
                backgroundColor: Colors.blue,
                largeTitle: Text("Reservas", style: TextStyle(color: Colors.white),),
                
              )
            ],
          ),
        );
    }));
  }
}
