import 'package:feriavirtual/screens/mainPage.dart';
import 'package:flutter/material.dart';
import 'package:feriavirtual/constants/global_variables.dart';

import 'package:feriavirtual/screens/homePageLogged.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Feria Virtual',
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
      ),
      home: const MainPage(),
    );
  }
}
