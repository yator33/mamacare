import 'package:flutter/material.dart';

void main() {
  runApp(DashboardPage());
}

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool sidebarOpen = false;

  void toggleSidebar() {
    setState(() {
      sidebarOpen = !sidebarOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[100],
        body: Row(
          children: [
            if (sidebarOpen) Sidebar(toggleSidebar: toggleSidebar),
            Expanded(
              child: Column(
                children: [
                  Header(toggleSidebar: toggleSidebar),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Column(
                                  children: [
                                    AdvisorPage(),
                                    QuickActions(),
                                    MentalHealthCheck(),
                                    Recommendations(),
                                  ],
                                ),
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: [
                                    UpcomingAppointments(),
                                    SupportGroupActivity(),
                                    HealthResources(),
                                    EmergencyButton(),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Sidebar Widget
class Sidebar extends StatelessWidget {
  final VoidCallback toggleSidebar;
  Sidebar({required this.toggleSidebar});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      color: Colors.blueGrey[900],
      child: Column(
        children: [
          ListTile(
            title: Text("Dashboard", style: TextStyle(color: Colors.white)),
            onTap: toggleSidebar,
          ),
          // Add other sidebar items
        ],
      ),
    );
  }
}

// Header Widget
class Header extends StatelessWidget {
  final VoidCallback toggleSidebar;
  Header({required this.toggleSidebar});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("Dashboard"),
      leading: IconButton(icon: Icon(Icons.menu), onPressed: toggleSidebar),
    );
  }
}

// Dummy Components
class AdvisorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(padding: EdgeInsets.all(16), child: Text("Advisor Page")),
    );
  }
}

class QuickActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(padding: EdgeInsets.all(16), child: Text("Quick Actions")),
    );
  }
}

class MentalHealthCheck extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Text("Mental Health Check"),
      ),
    );
  }
}

class Recommendations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Text("Recommendations"),
      ),
    );
  }
}

class UpcomingAppointments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Text("Upcoming Appointments"),
      ),
    );
  }
}

class SupportGroupActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Text("Support Group Activity"),
      ),
    );
  }
}

class HealthResources extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Text("Health Resources"),
      ),
    );
  }
}

class EmergencyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: () {}, child: Text("Emergency"));
  }
}
