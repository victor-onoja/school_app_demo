import 'package:flutter/material.dart';

class AdminCommunicationsScreen extends StatelessWidget {
  const AdminCommunicationsScreen({super.key});

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
              'Manage Communications',
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 24.0),

            // Send Message Button
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton.icon(
                onPressed: () {
                  // Handle send message action
                },
                icon: const Icon(Icons.send),
                label: const Text('Send Message'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),

            // Message History List
            Expanded(
              child: ListView(
                children: [
                  CommunicationCard(
                    title: 'Reminder: Parent-Teacher Meeting',
                    date: 'August 15, 2024',
                    recipientGroup: 'Parents',
                    message:
                        'This is a reminder that the Parent-Teacher Meeting will be held on August 15, 2024, at 10 AM in the school auditorium.',
                    onTap: () {
                      // Handle view message action
                    },
                  ),
                  CommunicationCard(
                    title: 'Exam Schedule Released',
                    date: 'August 10, 2024',
                    recipientGroup: 'Students',
                    message:
                        'The exam schedule for the upcoming semester has been released. Please check the timetable section for details.',
                    onTap: () {
                      // Handle view message action
                    },
                  ),
                  CommunicationCard(
                    title: 'Staff Meeting Tomorrow',
                    date: 'August 8, 2024',
                    recipientGroup: 'Staff',
                    message:
                        'A staff meeting is scheduled for tomorrow at 9 AM in the conference room. Attendance is mandatory.',
                    onTap: () {
                      // Handle view message action
                    },
                  ),
                  // Add more communication cards as needed
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Communication Card
class CommunicationCard extends StatelessWidget {
  final String title;
  final String date;
  final String recipientGroup;
  final String message;
  final VoidCallback onTap;

  const CommunicationCard({
    super.key,
    required this.title,
    required this.date,
    required this.recipientGroup,
    required this.message,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Date: $date'),
            Text('To: $recipientGroup'),
            const SizedBox(height: 8.0),
            Text(message, maxLines: 2, overflow: TextOverflow.ellipsis),
          ],
        ),
        trailing:
            Icon(Icons.arrow_forward, color: Theme.of(context).primaryColor),
        onTap: onTap,
      ),
    );
  }
}
