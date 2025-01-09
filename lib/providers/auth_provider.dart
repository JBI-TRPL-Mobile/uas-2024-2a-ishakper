import 'package:flutter/material.dart';
import '../models/user.dart';
import '../services/json_service.dart';
import 'dart:convert';

class AuthProvider with ChangeNotifier {
  User? _currentUser;
  final JsonService _jsonService = JsonService();

  User? get currentUser => _currentUser;

  Future<void> signIn(String email, String password) async {
    // ... (Kode sign in sebelumnya)
  }

  Future<void> signUp(String fullName, String email, String password) async {
    try {
      final dataUser = await _jsonService.loadJson('assets/data/datauser.json');
      List<dynamic> users = dataUser['users'] ?? [];

      //Check if email is already registered
      if (users.any((user) => user['email'] == email)) {
        throw Exception('Email sudah terdaftar');
      }

      users.add({
        'fullName': fullName,
        'email': email,
        'password': password,
      });

      // Encode kembali ke JSON
      final updatedJson = jsonEncode({'users': users});
      // Menulis ke file (perlu package path_provider)
      // Ini bagian yang perlu penyesuaian untuk menulis ke file statis,
      // Karena flutter web tidak bisa menulis ke file di browser.
      // Solusinya bisa menggunakan package shared_preferences atau
      // menyimpan data di server jika aplikasinya web base.

      // Contoh print ke console
      print(updatedJson);

      _currentUser = User(fullName: fullName, email: email, password: password);
      notifyListeners();
    } catch (e) {
      print('Error during sign up: $e');
      rethrow; // Re-throw exception agar dapat ditangani di UI
    }
  }

}