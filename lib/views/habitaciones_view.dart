import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservas_hotel/blocs/rooms_bloc/rooms_bloc.dart';
import 'package:reservas_hotel/blocs/rooms_bloc/rooms_state.dart';
import 'package:reservas_hotel/views/habitacion_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
          child: CustomScrollView(
            slivers: [
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
              SliverList.builder(
                  itemCount: state.habitaciones.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(4),
                      child: SizedBox(
                        width: double.maxFinite,
                        child: Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0)),
                          child: Material(
                            borderRadius: BorderRadius.circular(16.0),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(16.0),
                              onTap: () {
                                debugPrint("===> CLICKING CARD $index");
                                Navigator.of(context).push(CupertinoPageRoute(
                                    builder: (BuildContext context) {
                                  return HabitacionView(
                                    room: state.habitaciones[index],
                                    index: index,
                                  );
                                }));
                              },
                              child: Column(children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(16),
                                    topRight: Radius.circular(16),
                                  ),
                                  child: Container(
                                    width: double.infinity,
                                    height:
                                        MediaQuery.of(context).size.height / 4,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: AssetImage(
                                            "assets/images/room${index + 1}.jpeg"),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(16, 4, 16, 4),
                                    child: SizedBox(
                                      height: 100,
                                      width: double.infinity,
                                      child: Flex(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        direction: Axis.vertical,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              const Text("Habitación  ",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w700,
                                                  )),
                                              Text(
                                                  state.habitaciones[index]
                                                      .numeroHabitacion
                                                      .toString(),
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w700,
                                                  )),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text("Tipo de habitación",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                  )),
                                              Text(
                                                  state.habitaciones[index]
                                                      .descripcion,
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                  )),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              const Text(
                                                "Precio por noche: ",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              Text(
                                                "\$${state.habitaciones[index].precioPorNoche.toStringAsFixed(2)}",
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w900,
                                                  color: Colors.red,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ))
                              ]),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
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
                  height: 200,
                  child: Card(
                    child: ListTile(
                      title: Text('Item number as titleItem number as titleItem number as titleItem number as titleItem number as title'),
                      subtitle: Text('Subtitle hereSubtitle herSubtitle herSubtitle herSubtitle herSubtitle herSubtitle herSubtitle her'),
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
