import 'package:flutter/material.dart';

class MessagesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Messages',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.yellow[700],
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {
              // Fungsi pencarian (implementasi opsional)
            },
          ),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        itemCount: 10,
        separatorBuilder: (context, index) => Divider(color: Colors.grey[300]),
        itemBuilder: (context, index) {
          return Row(
            children: [
              // Profile picture
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey),
                ),
                child: const Icon(Icons.person, size: 40, color: Colors.grey),
              ),
              const SizedBox(width: 16),
              // Message details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'User ${index + 1}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'This is a preview of message ${index + 1}...',
                      style: const TextStyle(color: Colors.grey, fontSize: 14),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
              // Timestamp
              const Text(
                '12:30 PM',
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: 1,
        selectedItemColor: Colors.yellow[700],
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, '/home');
          }
        },
      ),
    );
  }
}
