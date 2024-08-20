import 'package:flutter/material.dart';

class ParentAttendanceScreen extends StatelessWidget {
  const ParentAttendanceScreen({super.key});

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
              'Attendance Record',
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 24.0),

            // Attendance Summary
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AttendanceSummaryCard(
                  title: 'Present',
                  count: 120,
                  color: Colors.green,
                ),
                AttendanceSummaryCard(
                  title: 'Absent',
                  count: 5,
                  color: Colors.red,
                ),
                AttendanceSummaryCard(
                  title: 'Tardy',
                  count: 3,
                  color: Colors.orange,
                ),
              ],
            ),
            const SizedBox(height: 24.0),

            // Detailed Attendance List
            Expanded(
              child: ListView(
                children: const [
                  AttendanceDetailCard(
                    date: 'August 1, 2024',
                    status: 'Present',
                  ),
                  AttendanceDetailCard(
                    date: 'July 31, 2024',
                    status: 'Present',
                  ),
                  AttendanceDetailCard(
                    date: 'July 30, 2024',
                    status: 'Absent',
                    reason: 'Sick',
                  ),
                  AttendanceDetailCard(
                    date: 'July 29, 2024',
                    status: 'Present',
                  ),
                  // Add more records as needed
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Attendance Summary Card
class AttendanceSummaryCard extends StatelessWidget {
  final String title;
  final int count;
  final Color color;

  const AttendanceSummaryCard({
    super.key,
    required this.title,
    required this.count,
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
            Text(
              title,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: color,
              ),
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

// Attendance Detail Card
class AttendanceDetailCard extends StatelessWidget {
  final String date;
  final String status;
  final String? reason;

  const AttendanceDetailCard({
    super.key,
    required this.date,
    required this.status,
    this.reason,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              date,
              style:
                  const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  status,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: _getStatusColor(status),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (reason != null)
                  Text(
                    'Reason: $reason',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey[600],
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Present':
        return Colors.green;
      case 'Absent':
        return Colors.red;
      case 'Tardy':
        return Colors.orange;
      default:
        return Colors.black;
    }
  }
}
