import 'package:flutter/material.dart';

class StaffForumsScreen extends StatelessWidget {
  const StaffForumsScreen({super.key});

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
              'Staff Forums',
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 16.0),

            // Create New Topic Button
            ElevatedButton.icon(
              onPressed: () {
                // Functionality to create a new topic
              },
              icon: const Icon(Icons.add),
              label: const Text('Create New Topic'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 16.0),
                textStyle: const TextStyle(fontSize: 16.0),
              ),
            ),
            const SizedBox(height: 24.0),

            // Forum Topics List
            Expanded(
              child: ListView(
                children: const [
                  ForumTopicCard(
                    title: 'Upcoming School Events',
                    author: 'John Doe',
                    replies: 12,
                    lastPost: 'Last post by Jane Smith on August 5, 2024',
                  ),
                  SizedBox(height: 16.0),

                  ForumTopicCard(
                    title: 'Teaching Strategies for Mathematics',
                    author: 'Emily Johnson',
                    replies: 8,
                    lastPost: 'Last post by Mark Lee on August 4, 2024',
                  ),
                  SizedBox(height: 16.0),

                  // Add more topics as needed
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ForumTopicCard extends StatelessWidget {
  final String title;
  final String author;
  final int replies;
  final String lastPost;

  const ForumTopicCard({
    super.key,
    required this.title,
    required this.author,
    required this.replies,
    required this.lastPost,
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
            // Topic Title
            Text(
              title,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 8.0),

            // Author and Replies
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Started by $author',
                  style: TextStyle(fontSize: 16.0, color: Colors.grey[600]),
                ),
                Text(
                  '$replies Replies',
                  style: TextStyle(fontSize: 16.0, color: Colors.grey[600]),
                ),
              ],
            ),
            const SizedBox(height: 8.0),

            // Last Post Info
            Text(
              lastPost,
              style: TextStyle(fontSize: 14.0, color: Colors.grey[500]),
            ),
          ],
        ),
      ),
    );
  }
}
