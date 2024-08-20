import 'package:flutter/material.dart';

class ParentCommunicationScreen extends StatelessWidget {
  const ParentCommunicationScreen({super.key});

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

            // New Message Button
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton.icon(
                onPressed: () {
                  // Handle new message action
                },
                icon: const Icon(Icons.add),
                label: const Text('New Message'),
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
                children: const [
                  ConversationCard(
                    name: 'Ms. Johnson',
                    lastMessage: 'Please review the homework for this week.',
                    timestamp: 'August 8, 2024',
                  ),
                  ConversationCard(
                    name: 'Mr. Smith',
                    lastMessage: 'The field trip is scheduled for next Monday.',
                    timestamp: 'August 7, 2024',
                  ),
                  ConversationCard(
                    name: 'Principal Adams',
                    lastMessage:
                        'We look forward to seeing you at the PTA meeting.',
                    timestamp: 'August 6, 2024',
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
  final String name;
  final String lastMessage;
  final String timestamp;

  const ConversationCard({
    super.key,
    required this.name,
    required this.lastMessage,
    required this.timestamp,
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
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4.0),
            Text(lastMessage),
            const SizedBox(height: 4.0),
            Text(
              timestamp,
              style: TextStyle(fontSize: 12.0, color: Colors.grey[600]),
            ),
          ],
        ),
        onTap: () {
          // Handle conversation tap (e.g., navigate to conversation details)
        },
      ),
    );
  }
}
