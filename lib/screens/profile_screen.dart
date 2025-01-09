import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import provider
import '../providers/auth_provider.dart'; // Import AuthProvider
import 'package:uas_2024_2a_ishakper/screens/sign_in_screen.dart'; // Import SignInScreen

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.yellow,
        elevation: 0, // Menghilangkan shadow di bawah AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.yellow[200],
                child: Icon(
                  Icons.person,
                  size: 50,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 20),
            _buildSectionTitle('Video Preferences'),
            _buildListTile(context, 'Download Option', () {
              // Implementasi navigasi atau aksi untuk Download Option
            }),
            _buildListTile(context, 'Video Playback Option', () {
              // Implementasi navigasi atau aksi untuk Video Playback Option
            }),
            SizedBox(height: 20),
            _buildSectionTitle('Account Settings'),
            _buildListTile(context, 'Account Security', () {
              // Implementasi navigasi atau aksi untuk Account Security
            }),
            _buildListTile(context, 'Email Notification Preferences', () {
              // Implementasi navigasi atau aksi untuk Email Notification Preferences
            }),
            _buildListTile(context, 'Learning Reminder', () {
              // Implementasi navigasi atau aksi untuk Learning Reminder
            }),
            SizedBox(height: 20),
            _buildSectionTitle('App Settings'),
            _buildListTile(context, 'About LearnOut', () {
              // Implementasi navigasi atau aksi untuk About LearnOut
            }),
            _buildListTile(context, 'Frequently Asked Questions', () {
              // Implementasi navigasi atau aksi untuk Frequently Asked Questions
            }),
            _buildListTile(context, 'Share the LearnOut App', () {
              // Implementasi navigasi atau aksi untuk Share the LearnOut App
            }),
            SizedBox(height: 20),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter, // Memindahkan tombol ke bawah
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      _showLogoutDialog(context); // Memanggil fungsi dialog logout
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white, // Warna teks putih
                      minimumSize: Size(double.infinity, 50), // Lebar tombol full
                    ),
                    child: Text('Log Out'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget untuk judul bagian
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

  // Widget untuk item list
  Widget _buildListTile(BuildContext context, String title, VoidCallback onTap) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(color: Colors.black),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: Colors.black,
      ),
      onTap: onTap,
    );
  }

  // Fungsi untuk menampilkan dialog logout
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Log Out'),
          content: const Text('Are you sure you want to log out?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Logout'),
              onPressed: () {
                // Logika logout menggunakan AuthProvider
                Provider.of<AuthProvider>(context, listen: false).signOut();
                Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
                Navigator.of(context).pop(); // Menutup dialog
              },
            ),
          ],
        );
      },
    );
  }
}
