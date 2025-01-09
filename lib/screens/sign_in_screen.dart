import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import '../providers/auth_provider.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.yellow[50],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Judul
                  Text(
                    'Sign In',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: Colors.yellow[900],
                    ),
                  ),
                  SizedBox(height: 8),

                  // Deskripsi
                  Text(
                    "Selamat datang Dan silahkan Login.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  ),
                  SizedBox(height: 32),

                  // Input Email
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: 'Enter Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),

                  // Input Password
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      suffixIcon: Icon(Icons.visibility),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 8),

                  // Lupa Password
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () { /* Implementasi Lupa Password */ },
                      child: Text("Forgot Password", style: TextStyle(color: Colors.grey)),
                    ),
                  ),

                  SizedBox(height: 24),

                  // Tombol Sign In
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        String email = _emailController.text;
                        String password = _passwordController.text;

                        try {
                          await Provider.of<AuthProvider>(context, listen: false).signIn(email, password);
                          Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
                        } catch (e) {
                          String errorMessage = "Sign In failed";
                          if (e.toString().contains('invalid-email')) {
                            errorMessage = "The email address is badly formatted.";
                          } else if (e.toString().contains('user-not-found')) {
                            errorMessage = "No user found for that email.";
                          } else if (e.toString().contains('wrong-password')) {
                            errorMessage = "Wrong password provided for that user.";
                          } else {
                            errorMessage = e.toString();
                          }
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(errorMessage, style: TextStyle(color: Colors.white)),
                              backgroundColor: Colors.redAccent,
                            ),
                          );
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow[700],
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: Text('Sign In', style: TextStyle(fontSize: 16)),
                  ),
                  SizedBox(height: 24),

                  // "or sign in with" dengan garis pembatas
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Divider(
                          color: Colors.grey,
                          thickness: 1, // Ketebalan garis
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0), // Spasi di sekitar teks
                        child: Text("or sign in with", style: TextStyle(color: Colors.grey)),
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.grey,
                          thickness: 1, // Ketebalan garis
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 24),

                  // Ikon Google dan Facebook
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Google
                      InkWell( // Menggunakan InkWell untuk efek sentuhan
                        onTap: () { print("Sign in with Google pressed"); },
                        child: Container(
                          padding: EdgeInsets.all(12), // Padding di sekitar ikon
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Icon(Icons.g_mobiledata, color: Colors.red, size: 30),
                        ),
                      ),
                      // Facebook
                      InkWell( // Menggunakan InkWell untuk efek sentuhan
                        onTap: () { print("Sign in with Facebook pressed"); },
                        child: Container(
                           padding: EdgeInsets.all(12), // Padding di sekitar ikon
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Icon(Icons.facebook, color: Colors.blue, size: 30),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),

                  // "Don't have an account?"
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?", style: TextStyle(color: Colors.grey)),
                      TextButton(
                        onPressed: () { Navigator.pushNamed(context, '/signup'); },
                        child: Text("Sign Up Now", style: TextStyle(color: Colors.yellow[700])),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}