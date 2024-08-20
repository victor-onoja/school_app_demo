import 'package:flutter/material.dart';

class SuperAdminAuditLogsScreen extends StatefulWidget {
  const SuperAdminAuditLogsScreen({super.key});

  @override
  _SuperAdminAuditLogsScreenState createState() =>
      _SuperAdminAuditLogsScreenState();
}

class _SuperAdminAuditLogsScreenState extends State<SuperAdminAuditLogsScreen> {
  final List<Map<String, String>> _auditLogs = [
    {
      'date': '2024-08-08 10:30:00',
      'user': 'SuperAdmin',
      'action': 'Deleted user account: Staff123',
      'details': 'Reason: Violation of terms',
    },
    {
      'date': '2024-08-07 14:45:00',
      'user': 'AdminUser',
      'action': 'Updated course details: Advanced Mathematics',
      'details': 'Changed course description and added new materials.',
    },
    {
      'date': '2024-08-07 09:20:00',
      'user': 'Student567',
      'action': 'Changed password',
      'details': 'Password updated successfully.',
    },
    {
      'date': '2024-08-06 16:10:00',
      'user': 'Parent456',
      'action': 'Viewed report card',
      'details': 'Viewed report card for Student123.',
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
              'System Audit Logs',
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
                itemCount: _auditLogs.length,
                itemBuilder: (context, index) {
                  return AuditLogCard(
                    date: _auditLogs[index]['date']!,
                    user: _auditLogs[index]['user']!,
                    action: _auditLogs[index]['action']!,
                    details: _auditLogs[index]['details']!,
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

// Audit Log Card
class AuditLogCard extends StatelessWidget {
  final String date;
  final String user;
  final String action;
  final String details;

  const AuditLogCard({
    super.key,
    required this.date,
    required this.user,
    required this.action,
    required this.details,
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
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4.0),
            Text(
              date,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 4.0),
            Text(
              details,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
        trailing:
            Icon(Icons.history_outlined, color: Theme.of(context).primaryColor),
        onTap: () {
          // Handle detailed log view or action
        },
      ),
    );
  }
}
