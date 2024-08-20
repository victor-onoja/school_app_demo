import 'package:flutter/material.dart';

import 'parent_announcement_screen.dart';
import 'parent_attendance_screen.dart';
import 'parent_child_progress_screen.dart';
import 'parent_communication_screen.dart';

class ParentDashboard extends StatelessWidget {
  const ParentDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Parent Dashboard'),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 600) {
              return const MobileDashboard();
            } else {
              return const DesktopDashboard();
            }
          },
        ));
  }
}

class MobileDashboard extends StatefulWidget {
  const MobileDashboard({super.key});

  @override
  _MobileDashboardState createState() => _MobileDashboardState();
}

class _MobileDashboardState extends State<MobileDashboard> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = <Widget>[
    const ParentChildProgressScreen(),
    const ParentAttendanceScreen(),
    const ParentAnnouncementsScreen(),
    const ParentCommunicationScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Progress',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle),
            label: 'Attendance',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.announcement),
            label: 'Announcements',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Communication',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        backgroundColor: Colors.white,
      ),
    );
  }
}

class DesktopDashboard extends StatefulWidget {
  const DesktopDashboard({super.key});

  @override
  State<DesktopDashboard> createState() => _DesktopDashboardState();
}

class _DesktopDashboardState extends State<DesktopDashboard> {
  int _selectedIndex = 0;
  static final List<Widget> _contentPages = <Widget>[
    const ParentChildProgressScreen(),
    const ParentAttendanceScreen(),
    const ParentAnnouncementsScreen(),
    const ParentCommunicationScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        NavigationRail(
          selectedIndex: _selectedIndex,
          onDestinationSelected: (int index) {
            // Handle navigation
            setState(() {
              _selectedIndex = index;
            });
          },
          labelType: NavigationRailLabelType.all,
          selectedLabelTextStyle:
              TextStyle(color: Theme.of(context).primaryColor),
          unselectedLabelTextStyle: const TextStyle(color: Colors.grey),
          destinations: const [
            NavigationRailDestination(
              icon: Icon(Icons.school),
              label: Text('Progress'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.check_circle),
              label: Text('Attendance'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.announcement),
              label: Text('Announcements'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.message),
              label: Text('Communication'),
            ),
          ],
        ),
        const VerticalDivider(thickness: 1, width: 1),
        // Expanded content area
        Expanded(
          child: _contentPages[_selectedIndex],
        ),
      ],
    );
  }
}
