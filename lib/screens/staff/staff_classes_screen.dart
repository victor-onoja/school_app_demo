import 'package:flutter/material.dart';

class StaffClassesScreen extends StatelessWidget {
  const StaffClassesScreen({super.key});

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
              'Your Classes',
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 16.0),

            // Add Class Button
            ElevatedButton.icon(
              onPressed: () {
                // Functionality to add a new class
              },
              icon: const Icon(Icons.add),
              label: const Text('Add New Class'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 16.0),
                textStyle: const TextStyle(fontSize: 16.0),
              ),
            ),
            const SizedBox(height: 24.0),

            // Classes List
            Expanded(
              child: ListView(
                children: [
                  ClassCard(
                    className: 'Advanced Mathematics',
                    schedule: 'Mon, Wed, Fri - 10:00 AM to 11:30 AM',
                    studentCount: 30,
                  ),
                  const SizedBox(height: 16.0),

                  ClassCard(
                    className: 'Physics 101',
                    schedule: 'Tue, Thu - 1:00 PM to 2:30 PM',
                    studentCount: 25,
                  ),
                  const SizedBox(height: 16.0),

                  ClassCard(
                    className: 'Computer Science',
                    schedule: 'Mon, Wed - 3:00 PM to 4:30 PM',
                    studentCount: 28,
                  ),
                  const SizedBox(height: 16.0),

                  // Add more classes as needed
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ClassCard extends StatelessWidget {
  final String className;
  final String schedule;
  final int studentCount;

  ClassCard({
    super.key,
    required this.className,
    required this.schedule,
    required this.studentCount,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Class Name
            Text(
              className,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 8.0),

            // Schedule
            Text(
              schedule,
              style: TextStyle(fontSize: 16.0, color: Colors.grey[600]),
            ),
            const SizedBox(height: 8.0),

            // Student Count
            Row(
              children: [
                Icon(Icons.group, color: Theme.of(context).primaryColor),
                const SizedBox(width: 8.0),
                Text(
                  '$studentCount Students',
                  style: TextStyle(fontSize: 16.0, color: Colors.grey[600]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
