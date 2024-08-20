import 'package:flutter/material.dart';

class AnnouncementsScreen extends StatelessWidget {
  const AnnouncementsScreen({super.key});

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
              'Announcements',
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 16.0),

            // Announcements List
            Expanded(
              child: ListView(
                children: const [
                  AnnouncementCard(
                    title: 'School Reopening Date',
                    date: 'August 25, 2024',
                    description:
                        'The school will reopen on August 25, 2024. All students are required to attend the orientation on the first day.',
                  ),
                  SizedBox(height: 16.0),

                  AnnouncementCard(
                    title: 'Annual Sports Meet',
                    date: 'September 10, 2024',
                    description:
                        'The Annual Sports Meet will be held on September 10, 2024. Students are encouraged to participate in various sports events.',
                  ),
                  SizedBox(height: 16.0),

                  AnnouncementCard(
                    title: 'Mid-Term Exams Schedule',
                    date: 'October 5, 2024',
                    description:
                        'Mid-term exams will start from October 5, 2024. The detailed schedule will be shared soon.',
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
  final String date;
  final String description;

  const AnnouncementCard({
    super.key,
    required this.title,
    required this.date,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
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

            // Date
            Row(
              children: [
                Icon(Icons.calendar_today,
                    color: Theme.of(context).primaryColor),
                const SizedBox(width: 8.0),
                Text(
                  date,
                  style: TextStyle(fontSize: 16.0, color: Colors.grey[600]),
                ),
              ],
            ),
            const SizedBox(height: 12.0),

            // Description
            Text(
              description,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
