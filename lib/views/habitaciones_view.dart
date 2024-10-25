import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservas_hotel/blocs/rooms_bloc/rooms_bloc.dart';
import 'package:reservas_hotel/blocs/rooms_bloc/rooms_state.dart';

class HabitacionesView extends StatelessWidget {
  const HabitacionesView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: BlocBuilder<RoomsBloc, RoomsState>(builder: (context, state) {
      if (state.status == RoomsStatus.loaded) {
        return SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: state.habitaciones
                  .map((item) => Text(item.descripcion))
                  .toList(),
            ),
          ),
        );
      }

      return const SafeArea(child: Center(child: CircularProgressIndicator()));
    }));
  }
}
