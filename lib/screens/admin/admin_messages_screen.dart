import 'package:flutter/material.dart';

class AdminMessagesScreen extends StatelessWidget {
  const AdminMessagesScreen({super.key});

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
              'Messages',
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 24.0),

            // Compose Message Button
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton.icon(
                onPressed: () {
                  // Handle compose message action
                },
                icon: const Icon(Icons.create),
                label: const Text('Compose Message'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),

            // List of Conversations
            Expanded(
              child: ListView(
                children: [
                  ConversationCard(
                    userName: 'John Doe',
                    userType: 'Student',
                    lastMessage: 'Could you please check my assignment?',
                    date: 'August 10, 2024',
                    onTap: () {
                      // Handle open conversation action
                    },
                  ),
                  ConversationCard(
                    userName: 'Jane Smith',
                    userType: 'Parent',
                    lastMessage: 'When is the next PTA meeting?',
                    date: 'August 9, 2024',
                    onTap: () {
                      // Handle open conversation action
                    },
                  ),
                  ConversationCard(
                    userName: 'Mr. Williams',
                    userType: 'Staff',
                    lastMessage: 'The meeting notes have been uploaded.',
                    date: 'August 8, 2024',
                    onTap: () {
                      // Handle open conversation action
                    },
                  ),
                  // Add more conversation cards as needed
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Conversation Card
class ConversationCard extends StatelessWidget {
  final String userName;
  final String userType;
  final String lastMessage;
  final String date;
  final VoidCallback onTap;

  const ConversationCard({
    super.key,
    required this.userName,
    required this.userType,
    required this.lastMessage,
    required this.date,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: ListTile(
        title: Text(
          '$userName ($userType)',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Date: $date'),
            const SizedBox(height: 8.0),
            Text(lastMessage, maxLines: 2, overflow: TextOverflow.ellipsis),
          ],
        ),
        trailing: Icon(Icons.message, color: Theme.of(context).primaryColor),
        onTap: onTap,
      ),
    );
  }
}
