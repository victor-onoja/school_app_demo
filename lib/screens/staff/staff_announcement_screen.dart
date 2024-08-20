import 'package:flutter/material.dart';

class StaffAnnouncementsScreen extends StatelessWidget {
  const StaffAnnouncementsScreen({super.key});

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
              'School Announcements',
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 16.0),

            // Add Announcement Button
            ElevatedButton.icon(
              onPressed: () {
                // Functionality to add a new announcement
              },
              icon: const Icon(Icons.add),
              label: const Text('Add New Announcement'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 16.0),
                textStyle: const TextStyle(fontSize: 16.0),
              ),
            ),
            const SizedBox(height: 24.0),

            // Announcements List
            Expanded(
              child: ListView(
                children: const [
                  AnnouncementCard(
                    title: 'School Reopening Date',
                    content:
                        'The school will reopen on August 25, 2024. All staff are required to attend the orientation on the first day.',
                    date: 'Posted on August 1, 2024',
                  ),
                  SizedBox(height: 16.0),

                  AnnouncementCard(
                    title: 'Staff Meeting Reminder',
                    content:
                        'There will be a mandatory staff meeting on August 10, 2024, at 2:00 PM in the main auditorium.',
                    date: 'Posted on July 30, 2024',
                  ),
                  SizedBox(height: 16.0),

                  // Add more announcements as needed
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AnnouncementCard extends StatelessWidget {
  final String title;
  final String content;
  final String date;

  const AnnouncementCard({
    super.key,
    required this.title,
    required this.content,
    required this.date,
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
            // Announcement Title
            Text(
              title,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 8.0),

            // Announcement Content
            Text(
              content,
              style: TextStyle(fontSize: 16.0, color: Colors.grey[600]),
            ),
            const SizedBox(height: 8.0),

            // Announcement Date
            Text(
              date,
              style: TextStyle(fontSize: 14.0, color: Colors.grey[500]),
            ),
          ],
        ),
      ),
    );
  }
}
