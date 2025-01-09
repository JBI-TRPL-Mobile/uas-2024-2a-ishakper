import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: HomeScreen(),
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
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome $userName', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.transparent,
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
            icon: Icon(Icons.search),
            label: 'Search',
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
        selectedItemColor: Colors.yellow[700],
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
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: Colors.grey),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset("assets/images/banner.jpg", fit: BoxFit.cover),
            ),
          ),
          SizedBox(height: 16),
          Text("Keep Moving Up", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
              style: TextStyle(color: Colors.grey)),
          SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Categories", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text("See All", style: TextStyle(color: Colors.grey)),
            ],
          ),
          SizedBox(height: 16),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: [
              CategoryButton(label: "Development", imagePath: "assets/images/development.jpg"),
              CategoryButton(label: "IT & Software", imagePath: "assets/images/it.jpg"),
              CategoryButton(label: "UX/UI", imagePath: "assets/images/uxui.jpg"),
              CategoryButton(label: "Business", imagePath: "assets/images/business.jpg"),
              CategoryButton(label: "Finance & Banking", imagePath: "assets/images/finance.jpg"),
              CategoryButton(label: "Design", imagePath: "assets/images/design.jpg"),
            ],
          ),
          SizedBox(height: 24),
          Text("Top Courses", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                CoursePlaceholder(imagePath: "assets/images/page1.jpg"),
                CoursePlaceholder(imagePath: "assets/images/page2.jpg"),
                CoursePlaceholder(imagePath: "assets/images/page3.jpg"),
                CoursePlaceholder(imagePath: "assets/images/page4.jpg"),
                CoursePlaceholder(imagePath: "assets/images/page5.jpg"),
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
  final String imagePath;

  const CategoryButton({Key? key, required this.label, required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            imagePath,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 4),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}

class CoursePlaceholder extends StatelessWidget {
  final String imagePath;

  const CoursePlaceholder({Key? key, required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      height: 150,
      width: 100,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.asset(imagePath, fit: BoxFit.cover),
      ),
    );
  }
}