import 'package:flutter/material.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Dashboard Title
            Text(
              'Welcome, Admin',
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 24.0),

            // Key Metrics Overview
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MetricCard(
                  title: 'Total\nStudents',
                  count: 1200,
                  icon: Icons.person,
                  color: Colors.blue,
                ),
                MetricCard(
                  title: 'Total\nStaff',
                  count: 150,
                  icon: Icons.person_outline,
                  color: Colors.green,
                ),
                MetricCard(
                  title: 'Pending\nRequests',
                  count: 5,
                  icon: Icons.pending,
                  color: Colors.orange,
                ),
              ],
            ),
            const SizedBox(height: 24.0),

            // Recent Activities
            const Text(
              'Recent Activities',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12.0),
            Expanded(
              child: ListView(
                children: const [
                  ActivityCard(
                    description: 'New student registration: John Doe',
                    timestamp: 'August 8, 2024, 10:00 AM',
                  ),
                  ActivityCard(
                    description: 'Staff member added: Ms. Alice Smith',
                    timestamp: 'August 7, 2024, 2:15 PM',
                  ),
                  ActivityCard(
                    description: 'Course updated: Math 101',
                    timestamp: 'August 6, 2024, 1:00 PM',
                  ),
                  // Add more activities as needed
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Metric Card
class MetricCard extends StatelessWidget {
  final String title;
  final int count;
  final IconData icon;
  final Color color;

  const MetricCard({
    super.key,
    required this.title,
    required this.count,
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
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 40.0, color: color),
            const SizedBox(height: 8.0),
            Text(
              title,
              style:
                  const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8.0),
            Text(
              count.toString(),
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

// Activity Card
class ActivityCard extends StatelessWidget {
  final String description;
  final String timestamp;

  const ActivityCard({
    super.key,
    required this.description,
    required this.timestamp,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: ListTile(
        title: Text(
          description,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          timestamp,
          style: TextStyle(fontSize: 12.0, color: Colors.grey[600]),
        ),
      ),
    );
  }
}
