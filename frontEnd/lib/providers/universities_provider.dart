import 'package:feriavirtual/constants/global_variables.dart';
import 'package:feriavirtual/models/universities_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UniversitiesProvider extends ChangeNotifier {
  List<UniversitiesResponse> universitiesResponse = [];
  List<UniversitiesResponse> universities = [];
  UniversitiesProvider() {
    print('UnivertiesProvider inicializado');

    getOnDisplayUniversities();
  }

  getOnDisplayUniversities() async {
    var url = Uri.http(urlHost, '/v1/universidad/', {});
    final response = await http.get(url);

    universitiesResponse = List<UniversitiesResponse>.from(json
        .decode(response.body)
        .map((data) => UniversitiesResponse.fromJson(data)));

    universities = universitiesResponse;

    notifyListeners();
  }
}
