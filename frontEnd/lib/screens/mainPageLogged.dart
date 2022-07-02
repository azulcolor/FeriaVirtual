import 'package:feriavirtual/screens/test.dart';
import 'package:feriavirtual/screens/universities.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants/global_variables.dart';
import 'homePageLogged.dart';

class MainPageLogged extends StatefulWidget {
  const MainPageLogged({Key? key}) : super(key: key);

  @override
  State<MainPageLogged> createState() => _MainPageLoggedState();
}

class _MainPageLoggedState extends State<MainPageLogged> {
  int currentIndex = 1;

  List<Widget> screens = [
    const Universities(),
    const HomePageLogged(),
    Test(),
  ];

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.all(5.0),
              child: Icon(FontAwesomeIcons.schoolFlag, size: 23),
            ),
            label: 'Escuelas',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.all(5.0),
              child: Icon(FontAwesomeIcons.houseUser, size: 23),
            ),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.all(5.0),
              child: Icon(FontAwesomeIcons.rectangleList, size: 23),
            ),
            label: 'Test',
          )
        ],
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        currentIndex: currentIndex,
        onTap: onTap,
        backgroundColor: GlobalVariables.primaryColor,
        unselectedItemColor: GlobalVariables.backgroundColor,
        selectedItemColor: GlobalVariables.yellowColor,
      ),
    );
  }
}
