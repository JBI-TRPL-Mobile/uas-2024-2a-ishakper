import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/message_screen.dart';
import 'providers/auth_provider.dart';
import 'screens/sign_in_screen.dart';
import 'screens/sign_up_screen.dart';
import 'screens/home_screen.dart';
import 'screens/profile_screen.dart'; // Import ProfileScreen

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
      title: 'Project Ishak',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.amber,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SignInScreen(),
        '/signup': (context) => SignUpScreen(),
        '/home': (context) => HomeScreen(),
        '/messages': (context) => MessageScreen(),
        '/profile': (context) => ProfileScreen(), // Tambah rute Profile
      },
    );
  }
}
