import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservas_hotel/blocs/bookings_bloc/bookings_bloc.dart';
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
      if (state.status == BookingsStatus.loaded) {
        return SafeArea(
          child: CustomScrollView(
            slivers: [
              const CupertinoSliverNavigationBar(
                backgroundColor: Colors.blue,
                largeTitle: Text(
                  "Reservas",
                  style: TextStyle(color: Colors.white),
                ),
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
                                              "assets/images/room${index + 1}.jpeg"),
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
                                            state.reservas[index].habitacion
                                                .descripcion,
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
                                              Text("Vie, 15 Oct - Dom, 27 Oct",
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
                                  3,
                                  (int index) => MenuItemButton(
                                    onPressed: () {},
                                    child: Text('Item ${index + 1}'),
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
            backgroundColor: Colors.blue,
            largeTitle: Text(
              "Habitaciones",
              style: TextStyle(color: Colors.white),
            ),
            trailing: Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
              child: CupertinoSearchTextField(
                backgroundColor: Colors.white,
                placeholder: "Search",
              ),
            ),
          ),
          Skeletonizer.sliver(
            child: SliverList.builder(
              itemCount: 6,
              itemBuilder: (context, index) {
                return const SizedBox(
                  width: double.maxFinite,
                  height: 120,
                  child: Card(
                    child: ListTile(
                      title: Text(
                          'Item number as titleI'),
                      subtitle: Text(
                          'Subtitle here'),
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
