import 'dart:convert';
import 'package:flutter/services.dart';

class JsonService {
  Future<Map<String, dynamic>> loadJson(String path) async {
    final String response = await rootBundle.loadString(path);
    final data = await json.decode(response);
    return data;
  }
}