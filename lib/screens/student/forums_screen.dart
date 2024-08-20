import 'package:flutter/material.dart';

class ForumsScreen extends StatelessWidget {
  const ForumsScreen({super.key});

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
              'Discussion Forums',
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 16.0),

            // Forums List
            Expanded(
              child: ListView(
                children: const [
                  ForumCard(
                    forumTitle: 'General Discussion',
                    description:
                        'A place to chat about anything related to school life.',
                    postsCount: 120,
                    lastActivity: '2 hours ago',
                  ),
                  SizedBox(height: 16.0),

                  ForumCard(
                    forumTitle: 'Mathematics Forum',
                    description:
                        'Discuss everything related to math courses and topics.',
                    postsCount: 85,
                    lastActivity: '1 hour ago',
                  ),
                  SizedBox(height: 16.0),

                  ForumCard(
                    forumTitle: 'Science and Technology',
                    description: 'A forum for discussions on science and tech.',
                    postsCount: 95,
                    lastActivity: '30 minutes ago',
                  ),
                  SizedBox(height: 16.0),

                  // Add more forums as needed
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ForumCard extends StatelessWidget {
  final String forumTitle;
  final String description;
  final int postsCount;
  final String lastActivity;

  const ForumCard({
    super.key,
    required this.forumTitle,
    required this.description,
    required this.postsCount,
    required this.lastActivity,
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
            // Forum Title
            Text(
              forumTitle,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 8.0),

            // Description
            Text(
              description,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 12.0),

            // Posts Count and Last Activity
            Row(
              children: [
                Icon(Icons.forum, color: Theme.of(context).primaryColor),
                const SizedBox(width: 8.0),
                Text(
                  '$postsCount Posts',
                  style: const TextStyle(
                      fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Icon(Icons.access_time, color: Theme.of(context).primaryColor),
                const SizedBox(width: 8.0),
                Text(
                  lastActivity,
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
