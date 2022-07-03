import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:feriavirtual/constants/utils.dart';

String _baseUrl = '192.168.1.64:4000/v1';

class UniversitiesProvider extends ChangeNotifier {
  UniversitiesProvider() {
    print('UnivertiesProvider inicializado');

    getOnDisplayUniversities(BuildContext context) async {
      try {
        var url = Uri.http('192.168.1.64:4000', '/v1/universidad/');
        print(url);
        final response = await http.get(url);

        final List decodedData = json.decode(response.body);

        print(decodedData);
      } catch (e) {
        showSnackBar(context, 'No hay conexion de internet');
      }
    }
  }
}
