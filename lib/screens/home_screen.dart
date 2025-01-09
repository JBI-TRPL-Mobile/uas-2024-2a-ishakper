import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.amber,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/messages': (context) => MessageScreen(),
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final String userName = "Ishak";

  static List<Widget> _widgetOptions = <Widget>[
    HomeContent(),
    const Center(child: Text('Search Content')),
    const Center(child: Text('Activities Content')),
    const Center(child: Text('Notifications Content')),
    const Center(child: Text('Profile Content')),
  ];

  void _onItemTapped(int index) {
    if (index == 1) {
      // Navigasi ke MessageScreen
      Navigator.pushNamed(context, '/messages');
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome $userName', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.yellow,
        elevation: 0,
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_activity),
            label: 'Activities',
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
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 180,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.yellow[100],
            ),
            child: Center(
              child: Text("Banner Image Placeholder",
                  style: TextStyle(fontSize: 16, color: Colors.grey)),
            ),
          ),
          SizedBox(height: 16),
          Text("Keep Moving Up",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text("Semangat semangat yang semangat dwonggg.",
              style: TextStyle(color: Colors.grey)),
          SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Categories",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/messages');
                },
                child: Text("See All",
                    style: TextStyle(color: Colors.grey, fontSize: 16)),
              ),
            ],
          ),
          SizedBox(height: 16),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: [
              CategoryButton(label: "Development"),
              CategoryButton(label: "IT & Software"),
              CategoryButton(label: "UX/UI"),
              CategoryButton(label: "Business"),
              CategoryButton(label: "Finance & Banking"),
              CategoryButton(label: "Design"),
            ],
          ),
          SizedBox(height: 24),
          Text("Top Courses",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                CoursePlaceholder(),
                CoursePlaceholder(),
                CoursePlaceholder(),
                CoursePlaceholder(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String label;

  const CategoryButton({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.yellow[200],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(Icons.category, size: 30, color: Colors.black),
        ),
        SizedBox(height: 4),
        Text(label, textAlign: TextAlign.center, style: TextStyle(fontSize: 12)),
      ],
    );
  }
}

class CoursePlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      height: 120,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.yellow[100],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Center(
        child: Text("Course Image",
            style: TextStyle(fontSize: 12, color: Colors.grey)),
      ),
    );
  }
}

class MessageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.yellow,
        elevation: 0,
      ),
      body: Center(
        child: Text("Message Screen Content"),
      ),
    );
  }
}
