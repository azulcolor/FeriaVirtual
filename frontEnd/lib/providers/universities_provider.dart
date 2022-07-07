import 'package:feriavirtual/constants/global_variables.dart';
import 'package:feriavirtual/models/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UniversitiesProvider extends ChangeNotifier {
  List<UniversitiesResponse> universities = [];
  UniversitiesProvider() {
    print('UnivertiesProvider inicializado');

    getOnDisplayUniversities();
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
}
