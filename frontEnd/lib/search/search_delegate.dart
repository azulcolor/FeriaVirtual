import 'package:feriavirtual/constants/global_variables.dart';
import 'package:feriavirtual/models/universities_model.dart';
import 'package:feriavirtual/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UniversitySearchDelegate
    extends SearchDelegate<List<UniversitiesResponse>> {
  final List<UniversitiesResponse> universities;
  List<UniversitiesResponse> _filter = [];
  UniversitySearchDelegate(this.universities);
  @override
  // TODO: implement searchFieldLabel
  String get searchFieldLabel => 'Buscar Universidad';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () => query = '',
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, <UniversitiesResponse>[]),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Scaffold(
      body: ListView.builder(
        itemCount: _filter.length,
        itemBuilder: (_, int index) =>
            ShowUniversities(universities: _filter, index: index),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    _filter = universities.where((university) {
      return university.nombre
          .toLowerCase()
          .contains(query.trim().toLowerCase());
    }).toList();

    if (query.isEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: Icon(
              FontAwesomeIcons.schoolFlag,
              size: 150,
              color: GlobalVariables.primaryColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 20),
            child: Text('Universidades', style: GlobalVariables.h2B),
          ),
        ],
      );
    }

    return Scaffold(
      body: ListView.builder(
        itemCount: _filter.length,
        itemBuilder: (_, int index) =>
            ShowUniversities(universities: _filter, index: index),
      ),
    );
    ;
  }
}
