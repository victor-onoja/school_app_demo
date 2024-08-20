import 'package:flutter/material.dart';

import 'super_admin_activity_logs_screen.dart';
import 'super_admin_audit_logs_screen.dart';
import 'super_admin_database_management_screen.dart';
import 'super_admin_global_announcements_screen.dart';
import 'super_admin_home_screen.dart';
import 'super_admin_system_reports_screen.dart';
import 'super_admin_system_settings_screen.dart';
import 'super_admin_user_feedback_screen.dart';
import 'super_admin_user_management_screen.dart';

class SuperAdminDashboard extends StatelessWidget {
  const SuperAdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('SuperAdmin Dashboard'),
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
    const SuperAdminHomeScreen(),
    const SuperAdminUserManagementScreen(),
    const SuperAdminSystemSettingsScreen(),
    const SuperAdminGlobalAnnouncementsScreen(),
    const SuperAdminUserFeedbackScreen(),
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
            label: 'User',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.announcement),
            label: 'Announcements',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Feedback',
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
    const SuperAdminHomeScreen(),
    const SuperAdminUserManagementScreen(),
    const SuperAdminSystemSettingsScreen(),
    const SuperAdminGlobalAnnouncementsScreen(),
    const SuperAdminSystemReportsScreen(),
    const SuperAdminActivityLogsScreen(),
    const SuperAdminUserFeedbackScreen(),
    const SuperAdminAuditLogsScreen(),
    const SuperAdminDatabaseManagementScreen(),
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
              label: Text('User'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.settings),
              label: Text('Settings'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.announcement),
              label: Text('Announcements'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.report),
              label: Text('Report'),
            ),
            NavigationRailDestination(
                icon: Icon(Icons.history), label: Text('Logs')),
            NavigationRailDestination(
              icon: Icon(Icons.chat),
              label: Text('Feedback'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.lock),
              label: Text('Audit'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.storage),
              label: Text('Database'),
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
