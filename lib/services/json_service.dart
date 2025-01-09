import 'dart:convert';
import 'package:flutter/services.dart';

class JsonService {
  Future<Map<String, dynamic>> loadJson(String path) async {
    try {
      String jsonString = await rootBundle.loadString(path);
      return jsonDecode(jsonString);
    } catch (e) {
      print('Error loading JSON: $e');
      return {}; // Return empty map in case of error
    }
  }
}