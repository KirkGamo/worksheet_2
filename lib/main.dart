import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile App',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(fontSize: 14.0),
        ),
      ),
      home: const HomeShell(),
    );
  }
}

class HomeShell extends StatefulWidget {
  const HomeShell({super.key});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    ProfilePage(),
    AboutPage(),
    ContactPage(),
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
        title: const Text('Kirk Gamo'), // change to your name if desired
        centerTitle: true,
        elevation: 2,
        backgroundColor: Colors.indigo,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_mail),
            label: 'Contact',
          ),
        ],
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile section with card
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.indigo.shade100, width: 2),
                    ),
                    child: const CircleAvatar(
                      radius: 52,
                      backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=3'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Kirk Gamo',
                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 6),
                        Text('Student • Mobile Developer', style: TextStyle(color: Colors.black54)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 18),

          // Information section as ListTiles for better responsiveness
          Card(
            elevation: 1,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: Column(
              children: const [
                ListTile(
                  leading: Icon(Icons.email, color: Colors.indigo),
                  title: Text('EMAIL', style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text('kirk.gamo@example.com'),
                ),
                Divider(height: 1),
                ListTile(
                  leading: Icon(Icons.home, color: Colors.indigo),
                  title: Text('ADDRESS', style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text('123 Learning St, City, Country'),
                ),
                Divider(height: 1),
                ListTile(
                  leading: Icon(Icons.school, color: Colors.indigo),
                  title: Text('SCHOOL', style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text('Example University'),
                ),
                Divider(height: 1),
                ListTile(
                  leading: Icon(Icons.favorite, color: Colors.indigo),
                  title: Text('HOBBIES', style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text('Studying, Sleeping, Coding'),
                ),
                Divider(height: 1),
                ListTile(
                  leading: Icon(Icons.info, color: Colors.indigo),
                  title: Text('STATUS', style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text('Open to learning new technologies'),
                ),
              ],
            ),
          ),

          const SizedBox(height: 18),

          // Biography section
          const Text('My Biography', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Card(
            elevation: 0,
            color: Colors.indigoAccent,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: const Text(
                'I am a dedicated student and budding mobile developer who enjoys building small, practical applications. ' 
                'I spend my time studying computer science topics, experimenting with Flutter, and balancing life with restful sleep and hobbies. ' 
                'I am always eager to learn, collaborate, and grow my skills in software development.',
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Use GridView to show skills/interests
    final skills = ['Flutter', 'Dart', 'Git', 'UI Design', 'Testing', 'Node.js'];

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('About Me', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text('A bit more about my background and interests:'),
          const SizedBox(height: 12),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 3),
              itemCount: skills.length,
              itemBuilder: (context, idx) {
                return Card(
                  margin: const EdgeInsets.all(6),
                  child: Center(child: Text(skills[idx])),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Contact', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          ListTile(
            leading: Icon(Icons.email),
            title: Text('Email'),
            subtitle: Text('kirk.gamo@example.com'),
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('Phone'),
            subtitle: Text('+1 234 567 890'),
          ),
          ListTile(
            leading: Icon(Icons.link),
            title: Text('Website'),
            subtitle: Text('https://example.com'),
          ),
        ],
      ),
    );
  }
}

