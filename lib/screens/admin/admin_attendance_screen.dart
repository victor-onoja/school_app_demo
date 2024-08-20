import 'package:flutter/material.dart';

class AdminAttendanceScreen extends StatelessWidget {
  const AdminAttendanceScreen({super.key});

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
              'Manage Attendance',
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 24.0),

            // Select Date
            Row(
              children: [
                const Text(
                  'Date:',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle date picker action
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text('Select Date'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),

            // List of Students/Staff
            Expanded(
              child: ListView(
                children: [
                  AttendanceCard(
                    name: 'John Doe',
                    id: 'STD001',
                    status:
                        'Present', // Could be "Present", "Absent", "Late", etc.
                    onTap: () {
                      // Handle mark attendance action
                    },
                  ),
                  AttendanceCard(
                    name: 'Jane Smith',
                    id: 'STD002',
                    status: 'Absent',
                    onTap: () {
                      // Handle mark attendance action
                    },
                  ),
                  AttendanceCard(
                    name: 'Alice Johnson',
                    id: 'STD003',
                    status: 'Late',
                    onTap: () {
                      // Handle mark attendance action
                    },
                  ),
                  // Add more attendance cards as needed
                ],
              ),
            ),

            // Submit Attendance Button
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  // Handle submit attendance action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text('Submit Attendance'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Attendance Card
class AttendanceCard extends StatelessWidget {
  final String name;
  final String id;
  final String status;
  final VoidCallback onTap;

  const AttendanceCard({
    super.key,
    required this.name,
    required this.id,
    required this.status,
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
        subtitle: Text('ID: $id\nStatus: $status'),
        trailing: Icon(Icons.edit, color: Theme.of(context).primaryColor),
        onTap: onTap,
      ),
    );
  }
}
