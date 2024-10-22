import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
                return const CupertinoPageScaffold(
                  child: Center(
                    child: Text('Home'),
                  ),
                );
              },
            );
          case 1:
            return CupertinoTabView(
              builder: (context) {
                return const CupertinoPageScaffold(
                  child: Center(
                    child: Text('Profile'),
                  ),
                );
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