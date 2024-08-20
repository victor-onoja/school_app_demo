import 'package:flutter/material.dart';

class SuperAdminSystemReportsScreen extends StatelessWidget {
  const SuperAdminSystemReportsScreen({super.key});

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
              'System Reports',
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 24.0),

            // Reports List
            Expanded(
              child: ListView(
                children: [
                  ReportCard(
                    title: 'User Activity Report',
                    description: 'Overview of user activity within the system.',
                    onTap: () {
                      // Handle report view action
                    },
                  ),
                  ReportCard(
                    title: 'System Performance Report',
                    description: 'Details on system performance and uptime.',
                    onTap: () {
                      // Handle report view action
                    },
                  ),
                  ReportCard(
                    title: 'Attendance Report',
                    description: 'Statistics and trends on student attendance.',
                    onTap: () {
                      // Handle report view action
                    },
                  ),
                  ReportCard(
                    title: 'Course Enrollment Report',
                    description:
                        'Insights into course enrollments and completions.',
                    onTap: () {
                      // Handle report view action
                    },
                  ),
                  // Add more report cards as needed
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Report Card
class ReportCard extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onTap;

  const ReportCard({
    super.key,
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16.0),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(description),
        trailing: Icon(Icons.arrow_forward_ios,
            color: Theme.of(context).primaryColor),
        onTap: onTap,
      ),
    );
  }
}
