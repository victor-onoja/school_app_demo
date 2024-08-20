import 'package:flutter/material.dart';
import 'package:school_app_demo/screens/admin/admin_attendance_screen.dart';

import 'admin_announcement_screen.dart';
import 'admin_communications_screen.dart';
import 'admin_courses_screen.dart';
import 'admin_home_screen.dart';
import 'admin_messages_screen.dart';
import 'admin_reports_screen.dart';
import 'admin_staff_management_screen.dart';
import 'admin_student_management_screen.dart';
import 'admin_timetables_screen.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Admin Dashboard'),
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
    const AdminHomeScreen(),
    const AdminStudentManagementScreen(),
    const AdminStaffManagementScreen(),
    const AdminAnnouncementsScreen(),
    const AdminMessagesScreen()
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
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Students',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Staff',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.announcement),
            label: 'Announcements',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Messages',
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
    const AdminHomeScreen(),
    const AdminStudentManagementScreen(),
    const AdminStaffManagementScreen(),
    const AdminTimetablesScreen(),
    const AdminCoursesScreen(),
    const AdminAttendanceScreen(),
    const AdminAnnouncementsScreen(),
    const AdminCommunicationsScreen(),
    const AdminReportsScreen(),
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
              label: Text('Home'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.person),
              label: Text('Students'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.person_outline),
              label: Text('Staff'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.calendar_today),
              label: Text('Timetables'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.book),
              label: Text('Courses'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.assignment),
              label: Text('Attendance'),
            ),
            NavigationRailDestination(
                icon: Icon(Icons.announcement), label: Text('Announcements')),
            NavigationRailDestination(
              icon: Icon(Icons.message),
              label: Text('Communication'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.report),
              label: Text('Reports'),
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
