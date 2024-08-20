import 'package:flutter/material.dart';

class AdminAnnouncementsScreen extends StatelessWidget {
  const AdminAnnouncementsScreen({super.key});

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
              'Manage Announcements',
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 24.0),

            // Add New Announcement Button
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton.icon(
                onPressed: () {
                  // Handle add new announcement action
                },
                icon: const Icon(Icons.add),
                label: const Text('Add New Announcement'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),

            // List of Announcements
            Expanded(
              child: ListView(
                children: [
                  AnnouncementCard(
                    title: 'School Closure Due to Weather',
                    date: 'August 10, 2024',
                    content:
                        'The school will be closed tomorrow due to expected severe weather conditions. Stay safe!',
                    onTap: () {
                      // Handle announcement details action
                    },
                  ),
                  AnnouncementCard(
                    title: 'Parent-Teacher Meeting',
                    date: 'August 15, 2024',
                    content:
                        'A parent-teacher meeting will be held on August 15, 2024, in the school auditorium.',
                    onTap: () {
                      // Handle announcement details action
                    },
                  ),
                  AnnouncementCard(
                    title: 'New Courses Available',
                    date: 'August 18, 2024',
                    content:
                        'We are excited to announce the availability of new elective courses for the upcoming semester.',
                    onTap: () {
                      // Handle announcement details action
                    },
                  ),
                  // Add more announcement cards as needed
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Announcement Card
class AnnouncementCard extends StatelessWidget {
  final String title;
  final String date;
  final String content;
  final VoidCallback onTap;

  const AnnouncementCard({
    super.key,
    required this.title,
    required this.date,
    required this.content,
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
            const SizedBox(height: 8.0),
            Text(content, maxLines: 2, overflow: TextOverflow.ellipsis),
          ],
        ),
        trailing: Icon(Icons.edit, color: Theme.of(context).primaryColor),
        onTap: onTap,
      ),
    );
  }
}
