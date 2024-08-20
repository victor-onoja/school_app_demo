import 'package:flutter/material.dart';

class SuperAdminActivityLogsScreen extends StatefulWidget {
  const SuperAdminActivityLogsScreen({super.key});

  @override
  _SuperAdminActivityLogsScreenState createState() =>
      _SuperAdminActivityLogsScreenState();
}

class _SuperAdminActivityLogsScreenState
    extends State<SuperAdminActivityLogsScreen> {
  final List<Map<String, String>> _logs = [
    {
      'timestamp': '2024-08-08 10:30:00',
      'user': 'AdminUser',
      'action': 'Created a new course: Introduction to AI',
    },
    {
      'timestamp': '2024-08-08 09:15:00',
      'user': 'Student123',
      'action': 'Logged in',
    },
    {
      'timestamp': '2024-08-08 08:45:00',
      'user': 'Parent456',
      'action': 'Viewed student report card',
    },
    {
      'timestamp': '2024-08-07 16:00:00',
      'user': 'Staff789',
      'action': 'Updated timetable for Class 10A',
    },
    // Add more logs as needed
  ];

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
              'System Activity Logs',
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 24.0),

            // Logs List
            Expanded(
              child: ListView.builder(
                itemCount: _logs.length,
                itemBuilder: (context, index) {
                  return ActivityLogCard(
                    timestamp: _logs[index]['timestamp']!,
                    user: _logs[index]['user']!,
                    action: _logs[index]['action']!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Activity Log Card
class ActivityLogCard extends StatelessWidget {
  final String timestamp;
  final String user;
  final String action;

  const ActivityLogCard({
    super.key,
    required this.timestamp,
    required this.user,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16.0),
        title: Text(
          '$user - $action',
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          timestamp,
          style: TextStyle(
            fontSize: 14.0,
            color: Colors.grey[600],
          ),
        ),
        trailing:
            Icon(Icons.info_outline, color: Theme.of(context).primaryColor),
        onTap: () {
          // Handle detailed log view action
        },
      ),
    );
  }
}
