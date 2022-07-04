import 'package:feriavirtual/screens/homePageLogged.dart';
import 'package:feriavirtual/screens/test.dart';
import 'package:feriavirtual/screens/universities.dart';
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: text.isEmpty ? Text(text = 'Error de conexion') : Text(text),
    ),
  );
}

class TabNavigator extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const TabNavigator({required this.navigatorKey, required this.tabItem});
  final GlobalKey<NavigatorState> navigatorKey;
  final String tabItem;

  @override
  Widget build(BuildContext context) {
    late Widget child;

    if (tabItem == "universities") {
      child = const Universities();
    } else if (tabItem == "homePageLogged") {
      child = const HomePageLogged();
    } else if (tabItem == "test") {
      child = Test();
    }

    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(builder: (context) => child);
      },
    );
  }
}
