import 'package:flutter/material.dart';

class AdminReportsScreen extends StatelessWidget {
  const AdminReportsScreen({super.key});

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
              'Generate Reports',
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 24.0),

            // Dropdown for Report Types
            Row(
              children: [
                const Text(
                  'Report Type:',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    items: const [
                      DropdownMenuItem(
                        value: 'attendance',
                        child: Text('Attendance Report'),
                      ),
                      DropdownMenuItem(
                        value: 'course_performance',
                        child: Text('Course Performance Report'),
                      ),
                      DropdownMenuItem(
                        value: 'student_performance',
                        child: Text('Student Performance Report'),
                      ),
                      DropdownMenuItem(
                        value: 'staff_performance',
                        child: Text('Staff Performance Report'),
                      ),
                      // Add more report types as needed
                    ],
                    onChanged: (value) {
                      // Handle report type change
                    },
                    hint: const Text('Select Report Type'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),

            // Date Range Picker
            Row(
              children: [
                const Text(
                  'Date Range:',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle date range picker action
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text('Select Date Range'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),

            // Generate Report Button
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton.icon(
                onPressed: () {
                  // Handle generate report action
                },
                icon: const Icon(Icons.analytics),
                label: const Text('Generate Report'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24.0),

            // Placeholder for Generated Report (Static Example)
            const Expanded(
              child: Center(
                child: Text(
                  'Report will be displayed here',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
