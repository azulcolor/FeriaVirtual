import 'package:feriavirtual/constants/global_variables.dart';
import 'package:feriavirtual/models/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UniversitiesProvider extends ChangeNotifier {
  List<UniversitiesResponse> universities = [];
  List<UniversitiesResponse> _prueba = [];
  UniversitiesProvider() {
    print('UnivertiesProvider inicializado');
    _prueba = universities;
    getOnDisplayUniversities();
  }

  List<UniversitiesResponse> get prueba {
    return _prueba;
  }

  set prueba(List<UniversitiesResponse> hola) {
    this._prueba = hola;
    notifyListeners();
  }

  Future<String> _getJsonData(String endPoint) async {
    var url = Uri.https(urlHost, endPoint, {});
    final response = await http.get(url);

    return response.body;
  }

  getOnDisplayUniversities() async {
    final jsonData = await _getJsonData('/v1/universidad/');

    universities = List<UniversitiesResponse>.from(json
        .decode(jsonData)
        .map((data) => UniversitiesResponse.fromJson(data)));

    notifyListeners();
  }

  Future<UniversityInfo> getOnDisplayUniversityInfo(int id) async {
    final jsonData = await _getJsonData('/v1/universidad/$id');

    UniversityInfo universityInfo = UniversityInfo.fromJson(jsonData);

    return universityInfo;
  }

  filter(String? selectedKind, String? selectedArea,
      List<UniversitiesResponse> university) {
    List<UniversitiesResponse> filter;

    if (selectedKind == 'Mostrar ambas' && selectedArea == 'Mostrar todas') {
      filter = university;
      return filter;
    } else if (selectedKind != 'Mostrar ambas' &&
        selectedArea == 'Mostrar todas') {
      filter = university;
      filter = filter.where((filter) {
        return filter.tipo.toLowerCase().contains(selectedKind!.toLowerCase());
      }).toList();
      return filter;
    } else if (selectedKind == 'Mostrar ambas' &&
        selectedArea != 'Mostrar todas') {
      filter = university;
      filter = filter.where((filter) {
        return filter.area.toLowerCase().contains(selectedArea!.toLowerCase());
      }).toList();
      return filter;
    } else if (selectedKind != 'Mostrar ambas' &&
        selectedArea != 'Mostrar todas') {
      filter = university;
      filter = filter.where((filter) {
        return filter.area.toLowerCase().contains(selectedArea!.toLowerCase());
      }).toList();
      filter = filter.where((filter) {
        return filter.tipo.toLowerCase().contains(selectedKind!.toLowerCase());
      }).toList();
      return filter;
    }
  }
}
