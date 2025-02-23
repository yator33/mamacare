import 'package:flutter/material.dart';
// import 'dashboard.dart';
import '../chatbot.dart';
import '../community.dart';
import '../emergency.dart';
import '../maps.dart';
import '../settings.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: Colors.pink[100],
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.pinkAccent),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.pregnant_woman, size: 50, color: Colors.white),
                    SizedBox(height: 10),
                    Text(
                      'MamaCare',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              _drawerItem(
                context,
                Icons.dashboard,
                'Dashboard',
                DashboardScreen(),
              ),
              _drawerItem(context, Icons.chat, 'Chatbot', ChatBot()),
              _drawerItem(context, Icons.people, 'Community', Community()),
              _drawerItem(
                context,
                Icons.warning,
                'Emergency Page',
                DashboardScreen(),
              ),
              _drawerItem(context, Icons.map, 'Maps Page', Maps()),
              _drawerItem(context, Icons.settings, 'Settings', Settings()),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text('Dashboard'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: DashboardContent(),
    );
  }

  Widget _drawerItem(
    BuildContext context,
    IconData icon,
    String title,
    Widget screen,
  ) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(title, style: TextStyle(color: Colors.white)),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
    );
  }
}

class DashboardContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.pink[50],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Text(
                  'Welcome Back!',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.pinkAccent,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Each day is a new opportunity to nurture both yourself and your little one.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.pink[800]),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _quickActionButton(Icons.chat, 'AI Chatbot', Colors.blue),
              _quickActionButton(Icons.groups, 'Support Groups', Colors.green),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _quickActionButton(Icons.warning, 'Emergency', Colors.red),
              _quickActionButton(
                Icons.health_and_safety,
                'Health Assistance',
                Colors.orange,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _quickActionButton(IconData icon, String label, Color color) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(icon, color: Colors.white),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
    );
  }
}

///////////////////////////////////
