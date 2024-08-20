import 'package:flutter/material.dart';

class ParentAnnouncementsScreen extends StatelessWidget {
  const ParentAnnouncementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
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
            const SizedBox(height: 24.0),

            // Announcement Cards
            const AnnouncementCard(
              title: 'Parent-Teacher Conference',
              date: 'August 20, 2024',
              description:
                  'Join us for the annual Parent-Teacher Conference to discuss your child\'s progress and future goals. Please RSVP by August 15.',
            ),
            const AnnouncementCard(
              title: 'School Fundraiser',
              date: 'September 10, 2024',
              description:
                  'Support our school by participating in the annual fundraiser. All proceeds will go towards new educational resources and extracurricular activities.',
            ),
            const AnnouncementCard(
              title: 'Holiday Break',
              date: 'December 20, 2024 - January 5, 2025',
              description:
                  'The school will be closed for the holiday break. We wish you a joyous holiday season and look forward to seeing everyone back in January!',
            ),
            // Add more announcements as needed
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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              date,
              style: TextStyle(fontSize: 16.0, color: Colors.grey[600]),
            ),
            const SizedBox(height: 12.0),
            Text(
              description,
              style: TextStyle(fontSize: 16.0, color: Colors.grey[800]),
            ),
          ],
        ),
      ),
    );
  }
}
