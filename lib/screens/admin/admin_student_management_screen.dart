import 'package:flutter/material.dart';

class AdminStudentManagementScreen extends StatelessWidget {
  const AdminStudentManagementScreen({super.key});

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
              'Manage Students',
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 24.0),

            // Add New Student Button
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton.icon(
                onPressed: () {
                  // Handle add new student action
                },
                icon: const Icon(Icons.add),
                label: const Text('Add New Student'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),

            // List of Students
            Expanded(
              child: ListView(
                children: [
                  StudentCard(
                    name: 'John Doe',
                    id: 'ST001',
                    grade: 'Grade 10',
                    onTap: () {
                      // Handle student details action
                    },
                  ),
                  StudentCard(
                    name: 'Jane Smith',
                    id: 'ST002',
                    grade: 'Grade 11',
                    onTap: () {
                      // Handle student details action
                    },
                  ),
                  StudentCard(
                    name: 'Michael Brown',
                    id: 'ST003',
                    grade: 'Grade 9',
                    onTap: () {
                      // Handle student details action
                    },
                  ),
                  // Add more student cards as needed
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Student Card
class StudentCard extends StatelessWidget {
  final String name;
  final String id;
  final String grade;
  final VoidCallback onTap;

  const StudentCard({
    super.key,
    required this.name,
    required this.id,
    required this.grade,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: ListTile(
        title: Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text('ID: $id\nGrade: $grade'),
        trailing: Icon(Icons.edit, color: Theme.of(context).primaryColor),
        onTap: onTap,
      ),
    );
  }
}
