import 'package:flutter/material.dart';

class SuperAdminHomeScreen extends StatelessWidget {
  const SuperAdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Page Title
            Text(
              'Super Admin Dashboard',
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 24.0),

            // Overview Cards
            Expanded(
              child: GridView.count(
                crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 1,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                children: const [
                  OverviewCard(
                    title: 'Total Students',
                    value: '1,024',
                    icon: Icons.school,
                    color: Colors.blue,
                  ),
                  OverviewCard(
                    title: 'Total Staff',
                    value: '85',
                    icon: Icons.people,
                    color: Colors.orange,
                  ),
                  OverviewCard(
                    title: 'Total Admins',
                    value: '12',
                    icon: Icons.admin_panel_settings,
                    color: Colors.green,
                  ),
                  OverviewCard(
                    title: 'Active Users',
                    value: '987',
                    icon: Icons.online_prediction,
                    color: Colors.purple,
                  ),
                  OverviewCard(
                    title: 'Pending Approvals',
                    value: '5',
                    icon: Icons.pending,
                    color: Colors.red,
                  ),
                  OverviewCard(
                    title: 'System Health',
                    value: 'Good',
                    icon: Icons.health_and_safety,
                    color: Colors.teal,
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

// Overview Card
class OverviewCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const OverviewCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40.0, color: color),
            const SizedBox(height: 8.0),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              value,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
