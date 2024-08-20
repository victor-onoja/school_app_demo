import 'package:flutter/material.dart';

class SuperAdminUserFeedbackScreen extends StatefulWidget {
  const SuperAdminUserFeedbackScreen({super.key});

  @override
  _SuperAdminUserFeedbackScreenState createState() =>
      _SuperAdminUserFeedbackScreenState();
}

class _SuperAdminUserFeedbackScreenState
    extends State<SuperAdminUserFeedbackScreen> {
  final List<Map<String, String>> _feedbackList = [
    {
      'date': '2024-08-08',
      'user': 'Student123',
      'feedback': 'The new timetable update feature is really helpful!',
    },
    {
      'date': '2024-08-07',
      'user': 'Staff789',
      'feedback':
          'It would be great to have a bulk upload option for attendance.',
    },
    {
      'date': '2024-08-06',
      'user': 'Parent456',
      'feedback':
          'The parent portal is easy to navigate, but could you add a feature to track fee payments?',
    },
    // Add more feedback as needed
  ];

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
              'User Feedback',
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 24.0),

            // Feedback List
            Expanded(
              child: ListView.builder(
                itemCount: _feedbackList.length,
                itemBuilder: (context, index) {
                  return FeedbackCard(
                    date: _feedbackList[index]['date']!,
                    user: _feedbackList[index]['user']!,
                    feedback: _feedbackList[index]['feedback']!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Feedback Card
class FeedbackCard extends StatelessWidget {
  final String date;
  final String user;
  final String feedback;

  const FeedbackCard({
    super.key,
    required this.date,
    required this.user,
    required this.feedback,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16.0),
        title: Text(
          '$user - $feedback',
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          date,
          style: TextStyle(
            fontSize: 14.0,
            color: Colors.grey[600],
          ),
        ),
        trailing: Icon(Icons.feedback_outlined,
            color: Theme.of(context).primaryColor),
        onTap: () {
          // Handle detailed feedback view or action
        },
      ),
    );
  }
}
