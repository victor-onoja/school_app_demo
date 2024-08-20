import 'package:flutter/material.dart';

class AdminStaffManagementScreen extends StatelessWidget {
  const AdminStaffManagementScreen({super.key});

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
              'Manage Staff',
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 24.0),

            // Add New Staff Button
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton.icon(
                onPressed: () {
                  // Handle add new staff action
                },
                icon: const Icon(Icons.add),
                label: const Text('Add New Staff'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),

            // List of Staff Members
            Expanded(
              child: ListView(
                children: [
                  StaffCard(
                    name: 'Alice Johnson',
                    id: 'STF001',
                    role: 'Math Teacher',
                    onTap: () {
                      // Handle staff details action
                    },
                  ),
                  StaffCard(
                    name: 'Bob Williams',
                    id: 'STF002',
                    role: 'Physics Teacher',
                    onTap: () {
                      // Handle staff details action
                    },
                  ),
                  StaffCard(
                    name: 'Catherine Brown',
                    id: 'STF003',
                    role: 'English Teacher',
                    onTap: () {
                      // Handle staff details action
                    },
                  ),
                  // Add more staff cards as needed
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Staff Card
class StaffCard extends StatelessWidget {
  final String name;
  final String id;
  final String role;
  final VoidCallback onTap;

  const StaffCard({
    super.key,
    required this.name,
    required this.id,
    required this.role,
    required this.onTap,
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
        subtitle: Text('ID: $id\nRole: $role'),
        trailing: Icon(Icons.edit, color: Theme.of(context).primaryColor),
        onTap: onTap,
      ),
    );
  }
}
