import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

String _baseUrl = '192.168.1.64:4000/v1';

class UniversitiesProvider extends ChangeNotifier {
  UniversitiesProvider() {
    print('UnivertiesProvider inicializado');

    getOnDisplayUniversities();
  }

  getOnDisplayUniversities() async {
    var url = Uri.http('192.168.1.64:4000', '/v1/universidad/');
    print(url);
    final response = await http.get(url);

    final List decodedData = json.decode(response.body);

    print(decodedData);
  }
}
