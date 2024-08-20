import 'package:flutter/material.dart';

class SuperAdminDatabaseManagementScreen extends StatefulWidget {
  const SuperAdminDatabaseManagementScreen({super.key});

  @override
  _SuperAdminDatabaseManagementScreenState createState() =>
      _SuperAdminDatabaseManagementScreenState();
}

class _SuperAdminDatabaseManagementScreenState
    extends State<SuperAdminDatabaseManagementScreen> {
  final List<String> _databases = [
    'Students Database',
    'Staff Database',
    'Courses Database',
    'Timetables Database',
    'Attendance Records',
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
              'Manage Databases',
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 24.0),

            // Database List
            Expanded(
              child: ListView.builder(
                itemCount: _databases.length,
                itemBuilder: (context, index) {
                  return DatabaseCard(
                    databaseName: _databases[index],
                    onView: () {
                      // Handle view database action
                    },
                    onBackup: () {
                      // Handle backup database action
                    },
                    onRestore: () {
                      // Handle restore database action
                    },
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

// Database Card
class DatabaseCard extends StatelessWidget {
  final String databaseName;
  final VoidCallback onView;
  final VoidCallback onBackup;
  final VoidCallback onRestore;

  const DatabaseCard({
    super.key,
    required this.databaseName,
    required this.onView,
    required this.onBackup,
    required this.onRestore,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16.0),
        title: Text(
          databaseName,
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        trailing: PopupMenuButton<String>(
          onSelected: (String value) {
            if (value == 'View') {
              onView();
            } else if (value == 'Backup') {
              onBackup();
            } else if (value == 'Restore') {
              onRestore();
            }
          },
          itemBuilder: (BuildContext context) {
            return ['View', 'Backup', 'Restore'].map((String choice) {
              return PopupMenuItem<String>(
                value: choice,
                child: Text(choice),
              );
            }).toList();
          },
        ),
      ),
    );
  }
}
