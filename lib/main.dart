import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/auth_provider.dart'; // Import AuthProvider
import 'screens/sign_in_screen.dart'; // Import SignInScreen
import 'screens/sign_up_screen.dart'; // Import SignUpScreen
import 'screens/home_screen.dart'; // Import HomeScreen

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project Ishak', // Judul aplikasi
      theme: ThemeData(
        primarySwatch: Colors.yellow, // Warna primer diubah ke kuning
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.amber, // Warna sekunder
        ),
      ),
      initialRoute: '/', // Rute awal adalah halaman login
      routes: {
        '/': (context) => SignInScreen(), // Rute untuk halaman login
        '/signup': (context) => SignUpScreen(), // Rute untuk halaman signup
        '/home': (context) => HomeScreen(), // Rute untuk halaman home
      },
    );
  }
}