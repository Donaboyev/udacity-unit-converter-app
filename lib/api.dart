import 'dart:async';
import 'dart:convert' show json, utf8;
import 'dart:io';
import 'package:flutter/material.dart';

const apiCategory = {'name': 'Currency', 'route': 'currency'};

class Api {
  final HttpClient _httpClient = HttpClient();
  final String _url = 'flutter.udacity.com';

  Future<List?> getUnits(String? category) async {
    final uri = Uri.https(_url, '/$category');
    final jsonResponse = await _getJson(uri);
    if (jsonResponse == null || jsonResponse['units'] == null) {
      debugPrint('Error retrieving units.');
      return null;
    }
    return jsonResponse['units'];
  }

  Future<double?> convert(
    String? category,
    String amount,
    String? fromUnit,
    String? toUnit,
  ) async {
    final uri = Uri.https(
      _url,
      '/$category/convert',
      {'amount': amount, 'from': fromUnit, 'to': toUnit},
    );
    final jsonResponse = await _getJson(uri);
    if (jsonResponse == null || jsonResponse['status'] == null) {
      debugPrint('Error retrieving conversion.');
      return null;
    } else if (jsonResponse['status'] == 'error') {
      debugPrint(jsonResponse['message']);
      return null;
    }
    return jsonResponse['conversion'].toDouble();
  }

  Future<Map<String, dynamic>?> _getJson(Uri uri) async {
    try {
      final httpRequest = await _httpClient.getUrl(uri);
      final httpResponse = await httpRequest.close();
      if (httpResponse.statusCode != HttpStatus.ok) {
        return null;
      }
      final responseBody = await httpResponse.transform(utf8.decoder).join();
      return json.decode(responseBody);
    } on Exception catch (e) {
      debugPrint('$e');
      return null;
    }
  }
}
