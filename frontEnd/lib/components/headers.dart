import 'package:feriavirtual/models/universities_model.dart';
import 'package:feriavirtual/search/search_delegate.dart';
import 'package:flutter/material.dart';
import 'package:feriavirtual/constants/global_variables.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
          color: GlobalVariables.primaryColor,
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
          child: SafeArea(
            child: Row(children: [
              //Logo
              Image.asset(
                'assets/images/logo.png',
                width: 50,
              ),

              //App Name
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  'Feria virtual',
                  style: GlobalVariables.h2W,
                ),
              ),
            ]),
          )),
    );
  }
}

class HeaderSearch extends StatelessWidget implements PreferredSizeWidget {
  List<UniversitiesResponse> universities;
  HeaderSearch({Key? key, required this.universities}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
          color: GlobalVariables.primaryColor,
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
          child: SafeArea(
            child: Row(children: [
              //Logo
              Image.asset(
                'assets/images/logo.png',
                width: 50,
              ),

              //App Name
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  'Feria virtual',
                  style: GlobalVariables.h2W,
                ),
              ),

              IconButton(
                icon: const Icon(Icons.search_outlined),
                padding: EdgeInsets.only(left: width - 240),
                color: GlobalVariables.backgroundColor,
                iconSize: 28,
                onPressed: () => showSearch(
                    context: context,
                    delegate: UniversitySearchDelegate(universities)),
              )
            ]),
          )),
    );
  }
}

class HeaderInfo extends StatelessWidget implements PreferredSizeWidget {
  const HeaderInfo({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: GlobalVariables.primaryColor,
      centerTitle: true,
      title: Text(
        'Feria virtual',
        style: GlobalVariables.h2W,
      ),
    );
  }
}
