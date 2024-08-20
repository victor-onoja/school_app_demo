import 'package:flutter/material.dart';

class AdminTimetablesScreen extends StatelessWidget {
  const AdminTimetablesScreen({super.key});

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
              'Manage Timetables',
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 24.0),

            // Add New Timetable Button
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton.icon(
                onPressed: () {
                  // Handle add new timetable action
                },
                icon: const Icon(Icons.add),
                label: const Text('Add New Timetable'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),

            // List of Timetables
            Expanded(
              child: ListView(
                children: [
                  TimetableCard(
                    className: 'Grade 10 - A',
                    timetable: const [
                      'Monday: Math - 8:00 AM',
                      'Tuesday: Physics - 10:00 AM',
                      'Wednesday: Chemistry - 9:00 AM',
                    ],
                    onTap: () {
                      // Handle timetable details action
                    },
                  ),
                  TimetableCard(
                    className: 'Grade 11 - B',
                    timetable: const [
                      'Monday: English - 9:00 AM',
                      'Tuesday: Biology - 11:00 AM',
                      'Wednesday: History - 10:00 AM',
                    ],
                    onTap: () {
                      // Handle timetable details action
                    },
                  ),
                  // Add more timetable cards as needed
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Timetable Card
class TimetableCard extends StatelessWidget {
  final String className;
  final List<String> timetable;
  final VoidCallback onTap;

  TimetableCard({
    super.key,
    required this.className,
    required this.timetable,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: ListTile(
        title: Text(
          className,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: timetable.map((session) => Text(session)).toList(),
        ),
        trailing: Icon(Icons.edit, color: Theme.of(context).primaryColor),
        onTap: onTap,
      ),
    );
  }
}
