import 'package:flutter/material.dart';

class SuperAdminGlobalAnnouncementsScreen extends StatefulWidget {
  const SuperAdminGlobalAnnouncementsScreen({super.key});

  @override
  _SuperAdminGlobalAnnouncementsScreenState createState() =>
      _SuperAdminGlobalAnnouncementsScreenState();
}

class _SuperAdminGlobalAnnouncementsScreenState
    extends State<SuperAdminGlobalAnnouncementsScreen> {
  final List<String> _announcements = [
    'School will be closed for the summer break from July 1st to August 31st.',
    'The annual parent-teacher conference is scheduled for June 15th.',
    'New courses will be available from the next academic year starting September 1st.',
  ];

  void _addAnnouncement() {
    // Handle add announcement action
  }

  void _editAnnouncement(int index) {
    // Handle edit announcement action
  }

  void _deleteAnnouncement(int index) {
    setState(() {
      _announcements.removeAt(index);
    });
  }

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
              'Manage Global Announcements',
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
                onPressed: _addAnnouncement,
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

            // Announcements List
            Expanded(
              child: ListView.builder(
                itemCount: _announcements.length,
                itemBuilder: (context, index) {
                  return AnnouncementCard(
                    announcement: _announcements[index],
                    onEdit: () => _editAnnouncement(index),
                    onDelete: () => _deleteAnnouncement(index),
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

// Announcement Card
class AnnouncementCard extends StatelessWidget {
  final String announcement;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const AnnouncementCard({
    super.key,
    required this.announcement,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: Text(
                announcement,
                style: const TextStyle(fontSize: 16.0),
              ),
            ),
            IconButton(
              icon: Icon(Icons.edit, color: Theme.of(context).primaryColor),
              onPressed: onEdit,
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}
