import 'package:flutter/material.dart';
import '../models/user.dart';
import '../services/json_service.dart';
import 'dart:convert';
import 'package:path_provider/path_provider.dart'; // Import path_provider
import 'dart:io';

class AuthProvider with ChangeNotifier {
  User? _currentUser;
  final JsonService _jsonService = JsonService();

  User? get currentUser => _currentUser;

  Future<void> signIn(String email, String password) async {
    try {
      final dataUser = await _jsonService.loadJson('assets/data/datauser.json');
      List<dynamic> users = dataUser['users'] ?? [];

      final user = users.firstWhere(
          (user) => user['email'] == email && user['password'] == password,
          orElse: () => null);

      if (user != null) {
        _currentUser = User(
            fullName: user['fullName'],
            email: user['email'],
            password: user['password']);
        notifyListeners();
      } else {
        throw Exception('Email atau password salah');
      }
    } catch (e) {
      print('Error during sign in: $e');
      rethrow;
    }
  }

  Future<void> signUp(String fullName, String email, String password) async {
    try {
      final dataUser = await _jsonService.loadJson('assets/data/datauser.json');
      List<dynamic> users = dataUser['users'] ?? [];

      if (users.any((user) => user['email'] == email)) {
        throw Exception('Email sudah terdaftar');
      }

      users.add({
        'fullName': fullName,
        'email': email,
        'password': password,
      });

      final updatedJson = jsonEncode({'users': users});

      // Mendapatkan direktori aplikasi
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/datauser.json');

      // Menulis data ke file
      await file.writeAsString(updatedJson);

      _currentUser = User(fullName: fullName, email: email, password: password);
      notifyListeners();
    } catch (e) {
      print('Error during sign up: $e');
      rethrow;
    }
  }

  void signOut() {
    _currentUser = null;
    notifyListeners();
  }
}