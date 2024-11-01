import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservas_hotel/blocs/bookings_bloc/bookings_bloc.dart';
import 'package:reservas_hotel/blocs/bookings_bloc/bookings_event.dart';
import 'package:reservas_hotel/blocs/bookings_bloc/bookings_state.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ReservasView extends StatelessWidget {
  const ReservasView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(child:
        BlocBuilder<BookingsBloc, BookingsState>(builder: (context, state) {
      if (state.status == BookingsStatus.posted ||
          state.status == BookingsStatus.deleted) {
        BlocProvider.of<BookingsBloc>(context).add(BookingsFetch());
      }
      if (state.status == BookingsStatus.loaded) {
        return SafeArea(
          child: CustomScrollView(
            slivers: [
              const CupertinoSliverNavigationBar(
                backgroundColor:  Color.fromARGB(190, 49, 61, 71),
                largeTitle: Text(
                  "Reservas",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              CupertinoSliverRefreshControl(
                onRefresh: () async {
                  debugPrint("====> Refreshing...");
                  BlocProvider.of<BookingsBloc>(context).add(BookingsFetch());
                },
              ),
              SliverList.builder(
                  itemCount: state.reservas.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(4),
                      child: SizedBox(
                        width: double.maxFinite,
                        height: 150,
                        child: Card(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.zero),
                          ),
                          elevation: 2,
                          child: Flex(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            direction: Axis.horizontal,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(16.0, 0, 0, 0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                        image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage(
                                              "assets/images/room${state.reservas[index].miniatura}.jpeg"),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          16, 24, 0, 0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            state.reservas[index].descripcion!,
                                            textAlign: TextAlign.left,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          const Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Lun, 28 Oct - Mar, 29 Oct",
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                  )),
                                            ],
                                          ),
                                          Text(
                                              "\$${state.reservas[index].precioTotal.toStringAsFixed(2)}"),
                                          const Text(
                                            "Completado",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              MenuAnchor(
                                builder: (BuildContext context,
                                    MenuController controller, Widget? child) {
                                  return IconButton(
                                    color: Colors.black,
                                    onPressed: () {
                                      if (controller.isOpen) {
                                        controller.close();
                                      } else {
                                        controller.open();
                                      }
                                    },
                                    icon: const Icon(
                                      Icons.more_vert,
                                      color: Colors.black,
                                    ),
                                  );
                                },
                                menuChildren: List<MenuItemButton>.generate(
                                  1,
                                  (int index) => MenuItemButton(
                                    onPressed: () {
                                      BlocProvider.of<BookingsBloc>(context)
                                          .add(BookingsDelete(
                                              state.reservas[index].id!));
                                    },
                                    child: const Text('BORRAR',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.red,
                                          fontWeight: FontWeight.w900,
                                        )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  })
            ],
          ),
        );
      }
      return SafeArea(
        child: CustomScrollView(slivers: [
          const CupertinoSliverNavigationBar(
            backgroundColor:  Color.fromARGB(190, 49, 61, 71),
            largeTitle: Text(
              "Reservas",
              style: TextStyle(color: Colors.white),
            ),
          ),
          Skeletonizer.sliver(
            child: SliverList.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return const SizedBox(
                  width: double.maxFinite,
                  height: 120,
                  child: Card(
                    child: ListTile(
                      title: Text('Item number as titleI'),
                      subtitle: Text('Subtitle here'),
                      leading: Icon(
                        Icons.ac_unit,
                        size: 64,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ]),
      );
    }));
  }
}
