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
          // Profile section
          Row(
            children: [
              const CircleAvatar(
                radius: 48,
                backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=3'),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Kirk Gamo',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text('Student • Mobile Developer'),
                ],
              ),
            ],
          ),

          const SizedBox(height: 24),

          // Information section (using Table)
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Table(
              columnWidths: const {
                0: FixedColumnWidth(36),
                1: FixedColumnWidth(120),
                2: FlexColumnWidth(),
              },
              children: const [
                TableRow(children: [
                  Padding(padding: EdgeInsets.all(6), child: Icon(Icons.email)),
                  Padding(padding: EdgeInsets.all(6), child: Text('EMAIL', style: TextStyle(fontWeight: FontWeight.bold))),
                  Padding(padding: EdgeInsets.all(6), child: Text('kirk.gamo@example.com')),
                ]),
                TableRow(children: [
                  Padding(padding: EdgeInsets.all(6), child: Icon(Icons.home)),
                  Padding(padding: EdgeInsets.all(6), child: Text('ADDRESS', style: TextStyle(fontWeight: FontWeight.bold))),
                  Padding(padding: EdgeInsets.all(6), child: Text('123 Learning St, City, Country')),
                ]),
                TableRow(children: [
                  Padding(padding: EdgeInsets.all(6), child: Icon(Icons.school)),
                  Padding(padding: EdgeInsets.all(6), child: Text('SCHOOL', style: TextStyle(fontWeight: FontWeight.bold))),
                  Padding(padding: EdgeInsets.all(6), child: Text('Example University')),
                ]),
                TableRow(children: [
                  Padding(padding: EdgeInsets.all(6), child: Icon(Icons.favorite)),
                  Padding(padding: EdgeInsets.all(6), child: Text('HOBBIES', style: TextStyle(fontWeight: FontWeight.bold))),
                  Padding(padding: EdgeInsets.all(6), child: Text('Studying, Sleeping, Coding')),
                ]),
                TableRow(children: [
                  Padding(padding: EdgeInsets.all(6), child: Icon(Icons.info)),
                  Padding(padding: EdgeInsets.all(6), child: Text('STATUS', style: TextStyle(fontWeight: FontWeight.bold))),
                  Padding(padding: EdgeInsets.all(6), child: Text('Open to learning new technologies')),
                ]),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Biography section
          const Text('My Biography', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text(
            'I am a dedicated student and budding mobile developer who enjoys building small, practical applications. ' 
            'I spend my time studying computer science topics, experimenting with Flutter, and balancing life with restful sleep and hobbies. ' 
            'I am always eager to learn, collaborate, and grow my skills in software development.',
            style: TextStyle(fontSize: 14),
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

