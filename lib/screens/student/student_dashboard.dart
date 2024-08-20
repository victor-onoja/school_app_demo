import 'package:flutter/material.dart';

import 'announcements_screen.dart';
import 'courses_screen.dart';
import 'forums_screen.dart';
import 'timetable_screen.dart';

class StudentDashboard extends StatelessWidget {
  const StudentDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Dashboard'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            // Mobile Layout: Bottom Navigation Bar
            return const MobileDashboard();
          } else {
            // Desktop Layout: Side Navigation Bar
            return const DesktopDashboard();
          }
        },
      ),
    );
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
    const TimetableScreen(),
    const CoursesScreen(),
    const ForumsScreen(),
    const AnnouncementsScreen(),
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
            icon: Icon(Icons.calendar_today),
            label: 'Timetable',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Courses',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.forum),
            label: 'Forums',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.announcement),
            label: 'Announcements',
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
  final List<Widget> _contentPages = [
    const TimetableScreen(),
    const CoursesScreen(),
    const ForumsScreen(),
    const AnnouncementsScreen(),
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
              icon: Icon(Icons.calendar_today),
              label: Text('Timetable'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.book),
              label: Text('Courses'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.forum),
              label: Text('Forums'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.announcement),
              label: Text('Announcements'),
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
