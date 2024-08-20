import 'package:flutter/material.dart';

class SuperAdminUserManagementScreen extends StatelessWidget {
  const SuperAdminUserManagementScreen({super.key});

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
              'Manage Users',
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 24.0),

            // Add New User Button
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton.icon(
                onPressed: () {
                  // Handle add new user action
                },
                icon: const Icon(Icons.add),
                label: const Text('Add New User'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),

            // User List
            Expanded(
              child: ListView(
                children: [
                  UserCard(
                    userName: 'John Doe',
                    userType: 'Student',
                    email: 'johndoe@studentmail.com',
                    status: 'Active',
                    onEdit: () {
                      // Handle edit user action
                    },
                    onDelete: () {
                      // Handle delete user action
                    },
                  ),
                  UserCard(
                    userName: 'Jane Smith',
                    userType: 'Staff',
                    email: 'janesmith@staffmail.com',
                    status: 'Active',
                    onEdit: () {
                      // Handle edit user action
                    },
                    onDelete: () {
                      // Handle delete user action
                    },
                  ),
                  UserCard(
                    userName: 'Mark Johnson',
                    userType: 'Parent',
                    email: 'markjohnson@parentmail.com',
                    status: 'Inactive',
                    onEdit: () {
                      // Handle edit user action
                    },
                    onDelete: () {
                      // Handle delete user action
                    },
                  ),
                  // Add more user cards as needed
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// User Card
class UserCard extends StatelessWidget {
  final String userName;
  final String userType;
  final String email;
  final String status;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  UserCard({
    super.key,
    required this.userName,
    required this.userType,
    required this.email,
    required this.status,
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text('Type: $userType'),
                  Text('Email: $email'),
                  Text('Status: $status'),
                ],
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
