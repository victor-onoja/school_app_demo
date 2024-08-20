import 'package:flutter/material.dart';
import 'package:school_app_demo/screens/staff/overview_screen.dart';

import 'staff_announcement_screen.dart';
import 'staff_classes_screen.dart';
import 'staff_forum_screen.dart';
import 'staff_timetable_screen.dart';

class StaffDashboard extends StatelessWidget {
  const StaffDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Staff Dashboard'),
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
    const OverviewScreen(),
    const StaffClassesScreen(),
    const StaffTimetableScreen(),
    const StaffAnnouncementsScreen(),
    const StaffForumsScreen()
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
            icon: Icon(Icons.home),
            label: 'Overview',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Classes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Timetable',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Announcements',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Forums',
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
    const OverviewScreen(),
    const StaffClassesScreen(),
    const StaffTimetableScreen(),
    const StaffAnnouncementsScreen(),
    const StaffForumsScreen()
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
              icon: Icon(Icons.home),
              label: Text('Overview'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.book),
              label: Text('Classes'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.calendar_month),
              label: Text('Timetable'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.notifications),
              label: Text('Announcements'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.chat),
              label: Text('Forums'),
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
